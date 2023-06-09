#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define M 300
#define N 500
#define K 200

void generate(int *matrix, int rows, int cols) {
    int i, j;
    for(i = 0; i < rows; i ++) {
        for(j = 0; j < cols; j ++) {
            matrix[i * cols + j] = rand() % 900 + 100;
        }
    }
}

/*
void display(int *matrix, int rows, int cols) {
    for(int i = 0; i < rows; i ++) {
        for(int j = 0; j < cols; j ++) {
            printf("%d ", matrix[i * cols + j]);
        }
    }
    printf("\n\n");
}
*/

void mat_mul(int *A, int *B, int *C) {
    int i, j, k;
    for(i = 0; i < M; i ++) {
        for(j = 0; j < K; j ++) {
            C[i * K + j] = 0;
            for(k = 0; k < N; k ++) {
                C[i * K + j] += A[i * N + k] * B[k * K + j];
            }
        }
    }
}

int main() {
    int *A, *B, *C;

    int s_a = M * N * sizeof(int);
    int s_b = N * K * sizeof(int);
    int s_c = M * K * sizeof(int);

    A = (int *)malloc(s_a);
    B = (int *)malloc(s_b);
    C = (int *)malloc(s_c);

    srand(time(NULL));
    generate(A, M, N);
    generate(B, N, K);

    printf("Multiplying random matrices A (300x500) and B (500x200)...\n");

    clock_t start = clock();

    mat_mul(A, B, C);

    clock_t end = clock();

     /*
    printf("Random Matrix A (300x500):\n");
    display(A, M, N);
    */
    
    /*
    printf("Random Matrix B (500x200):\n");
    display(B, N, K);
    */
    
    /*
    printf("Resulting Matrix C(300x200):\n");
    display(C, M, K);
    */

    free(A);
    free(B);
    free(C);

    double time = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Time taken: %f ms", time * 1000);

    return 0;
}
