- Assembling and linking c and assembly code:
	mips-linux-gnu-gcc -static <c_file_name>.c <assembly_file_name>.s -o <executable_name>
- Running the executable using a mips emulator: qemu-mips ./<executable_name>
