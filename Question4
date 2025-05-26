.data

.text 

	li $t0, 2 # int b = 2
	
	li $v0, 5
	syscall 
	
	move $t1, $v0 # int e = input()
	
	li $s0, 1 # res = 1
	li $t2, 0 # i = 0
	
	for:
		beq $t2, $t1, fim
		sll $s0, $s0, 1
		addi $t2, $t2, 1
		j for
		
	fim:
		li $v0, 1
		move $a0, $s0
		syscall 
		
		li $v0, 10
		syscall 
		
