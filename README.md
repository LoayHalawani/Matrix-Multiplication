# Description
We are multiplying two rectangular matrices filled with random 3-digit integers, a matrix A of size 300x500, and a matrix B of size 500x200. The resulting matrix C is of size 300x200.

# Output
All programs output processing time taken by the matrix multiplication operation in milliseconds. Commented out sections include code for printing out the contents of matrix A, B, or C.

# Compiling
- To compile Sequential code, run 'gcc MatMulSeq -lm -o out'.
- To compile Basic code, run 'nvcc MatMulBasic.cu -o out'.
- To compile Tiled code, run 'nvcc MatMulTiled.cu -o out'.

# Execution
To execute compiled code, run './out' or 'out'.
