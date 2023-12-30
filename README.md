# Description
We are multiplying two rectangular matrices filled with random 3-digit integers, a matrix A of size 300x500, and a matrix B of size 500x200. The resulting matrix C is of size 300x200.

# Output
All programs output processing time taken by the matrix multiplication operation in milliseconds. Commented out sections include code for printing out the contents of matrix A, B, or C.

# Prerequisites
- The latest version of C.
- The latest version of CUDA.
- The latest version of GNU Compiler Collection (GCC).
- The latest version of NVIDIA CUDA Compiler (NVCC).
- A GPU-enabled OS/environment.
- Any text editor.

# Compile & Execute
1. Open any terminal.
2. Navigate to the path of the downloaded C/CUDA files.
3. To compile the sequential C code, run 'gcc MatMulSeq -lm -o out1'.
4. To execute the output file, run './out1' or 'out1'.
5. To compile the basic CUDA code, run 'nvcc MatMulBasic.cu -o out2'.
6. To execute the output file, run './out2' or 'out2'.
7. To compile the tiled CUDA code, run 'nvcc MatMulTiled.cu -o out3'.
8. To execute the output file, run './out3' or 'out3'.
