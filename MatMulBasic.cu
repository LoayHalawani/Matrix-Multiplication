#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cuda.h>

#define M 300
#define N 500
#define K 200

__host__ void generate(int *matrix, int rows, int cols) {
    int i, j;
    for(i = 0; i < rows; i ++) {
        for(j = 0; j < cols; j ++) {
            matrix[i * cols + j] = rand() % 900 + 100;
        }
    }
}

/*__host__ void display(int *matrix, int rows, int cols) {
    for(int i = 0; i < rows; i ++) {
        for(int j = 0; j < cols; j ++) {
            printf("%d ", matrix[i * cols + j]);
        }
        printf("\n");
    }
}*/

__global__ void mat_mul(int *A, int *B, int *C) {
    int row = (blockIdx.y * blockDim.y) + threadIdx.y;
    int col = (blockIdx.x * blockDim.x) + threadIdx.x;
    if(row < M && col < K) {
        int i, sum = 0;
        for(i = 0; i < N; i ++) {
            sum += A[row * N + i] * B[i * K + col];
        }
        C[row * K + col] = sum;
    }
}

int main() {
    int *h_a, *h_b, *h_c;
    int *d_a, *d_b, *d_c;
    
    int s_a = M * N * sizeof(int);
    int s_b = N * K * sizeof(int);
    int s_c = M * K * sizeof(int);

    h_a = (int *)malloc(s_a);
    h_b = (int *)malloc(s_b);
    h_c = (int *)malloc(s_c);

    srand(time(NULL));
    generate(h_a, M, N);
    generate(h_b, N, K);

    cudaMalloc((void **)&d_a, s_a);
    cudaMalloc((void **)&d_b, s_b);
    cudaMalloc((void **)&d_c, s_c);

    cudaMemcpy(d_a, h_a, s_a, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, h_b, s_b, cudaMemcpyHostToDevice);

    dim3 DimBlock(16, 16, 1);
    dim3 DimGrid((K + DimBlock.x - 1) / DimBlock.x, (M + DimBlock.y - 1) / DimBlock.y, 1);

    printf("Multiplying random matrices A (300x500) and B (500x200)...\n");

    clock_t start = clock();

    mat_mul<<<DimGrid, DimBlock>>>(d_a, d_b, d_c);

    clock_t end = clock();

    cudaMemcpy(h_c, d_c, s_c, cudaMemcpyDeviceToHost);

    //printf("Resulting Matrix C (300x200):\n");
    //display(h_c, M, K);

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    free(h_a);
    free(h_b);
    free(h_c);

    double time = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Time taken: %f ms", time * 1000);

    return 0;
}
