# Note
In both programs, we are multiplying two matrices filled with random 3-digit integers, a matrix A of size 300x500, and a matrix B of size 500x200. The resulting matrix C is of size 300x200.

# How-to-compile
Basic: "nvcc MatMulBasic.cu -o out" | Tiling: "nvcc MatMulTiling.cu -o out"

# How-to-run
./out

# Output
Both programs output processing time taken by the matrix multiplication operation in milliseconds. Commented out sections include code for printing out the resulting matrix C.
