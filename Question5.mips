.data 

	a: .word 9
	b: .word 2
	c: .word 3
	string: .space 5
	
.text 

	lw $t0, a
    	lw $t1, b
    	lw $t2, c
	
	add $t3, $t0, $t1
	bge $t2, $t3, print_not
	
	add $t3, $t0, $t2
	bge $t1, $t3, print_not
	
	add $t3, $t1, $t2
	bge $t0, $t3, print_not 
	
	bne $t0, $t1, check_iso
	bne $t0, $t2, check_iso
	
	la $t4, string
	li $t5, 'e'
	sb $t5, 0($t4)
	li $t5, 'q'
	sb $t5, 1($t4)
	sb $zero, 2($t4)
	
	j end
	
	check_iso:
		beq $t0, $t1, print_iso
		beq $t0, $t2, print_iso
		beq $t1, $t2, print_iso
		j print_esc
		
		
	print_iso:
		la $t4, string
		li $t5, 'i'
		sb $t5, 0($t4)
		li $t5, 's'
		sb $t5, 1($t4)
		li $t5, 'o'
		sb $t5, 2($t4)
		sb $zero, 3($t4)
		j end
		
	print_esc:
		la $t4, string
		li $t5, 'e'
		sb $t5, 0($t4)
		li $t5, 's'
		sb $t5, 1($t4)
		li $t5, 'c'
		sb $t5, 2($t4)
		sb $zero, 3($t4)
		j end
	
	print_not:
		la $t4, string
		li $t5, 'n'
		sb $t5, 0($t4)
		li $t5, 'o'
		sb $t5, 1($t4)
		li $t5, 't'
		sb $t5, 2($t4)
		sb $zero, 3($t4)
		j end
		
	end:
	
		li $v0, 4
		la $a0, string
		syscall 
		
		li $v0, 10
		syscall 
		
		
	
	 
	
	
	
	
	
