.data 

.text

	li $v0, 5
	syscall
	
	addi $s0, $v0, 0 # a
	addi $s1, $zero, 0 # b 	
	move $t0, $zero # i
	
	for:
		beq $t0, 10, prox
		mul $t1, $t0, $t0
		addi $t0, $t0, 1
		bne $t1, $s0, for
		addi $s1, $s1, 1
		move $s2, $s0 # result_perfect_square = a
		j prox
		
	prox:
	
		bne $s1, $zero, fim
		move $s3, $s0 # result_not_perfect = a
		j fim
		fim:
			li $v0, 10
			syscall
		
		
		
		
	
	
	
			
	
	
	
	

	
