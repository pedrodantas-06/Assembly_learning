.data
	a: .word 
	b: .word
	
.text
	# Programa lê dois números inteiros e imprime o menor caso sejam diferentes
	# Se forem iguais soma-se os dois números e imprime o resultado
	
	lw $t0, a
	lw $t1, b
	
	bne $t0, $t1, nao_igual
	add $s0, $t0, $t1
	j fim
	
	nao_igual: 
		slt $t2, $t0, $t1
		beq $t2, $zero, a_maior_que_b
		move $s0, $t0
		j fim
		a_maior_que_b:
			move $s0, $t1
			j fim
			
	fim:
		li $v0, 1
		move $a0, $s0
		syscall 
			
 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
