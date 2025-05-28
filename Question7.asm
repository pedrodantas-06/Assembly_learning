.data 	
	array_a:
		.align 2
		.space 80
	array_b:
		.align 2
		.space 80
		
	msg_input_1 : .asciiz "Insira a quantidade de numeros: "
	msg_input_2 : .asciiz "Insira um numero: "
.text

	li $v0, 4
	la $a0, msg_input_1
	syscall
	
	li $v0, 5
	syscall
	
	# t0 = indice para navegar na array a
	# t1 = indice para navegar na array b
	# t2 = tamanho da array a
	
	# Armazenando os numeros da Array a
	move $t2, $v0
	move $t0, $zero
	move $t3, $zero
	receber_array:
		li $v0, 4
		la $a0, msg_input_2
		syscall
		
		li $v0, 5
		syscall
		
		sw $v0, array_a($t0)
		
		addi $t0, $t0, 4
		addi $t3, $t3, 1
		
		blt $t3, $t2, receber_array
	
	
	# Buscando cubos perfeitos e armazenando na array b
	
	move $t0, $zero
	move $t1, $zero
	move $t3, $zero
	ler_array:
		lw $a0, array_a($t0)
		
		jal floor_sqrt
		
		addi $t0, $t0, 4
		addi $t3, $t3, 1
		
		beq $v0, 1, perfect
		
		blt $t3, $t2, ler_array
		
		j pular
		
		perfect:
			sw $a0, array_b($t1)
			addi $t1, $t1, 4
			bne $t0, $t2, ler_array
			j pular
		
		
	
	# subrotina que verifica se o numero � um cubo perfeito
	# Se o numero for um cubo perfeito retorna 1 se nao retorna 0
	
	floor_sqrt:
		li $t4, 1
		li $t5, 0
		main_loop:
			mul $t5, $t4, $t4
			mul $t5, $t5, $t4
			
			beq $t5, $a0, is_root
			
			addi $t4, $t4, 1
			
			blt $t5, $a0, main_loop
			
			
		li $v0, 0
		jr $ra
		
		is_root:
			li $v0, 1
			jr $ra
	
	
	pular:
		move $t6, $zero    # índice para percorrer b
	# imprimir elementos de array_b
	print_array:
    		bge $t6, $t1, end  # se o índice >= tamanho de b, termina

    		lw $a0, array_b($t6)  # carrega elemento atual de b
    		li $v0, 1
    		syscall               # imprime o número

    		li $v0, 11
    		li $a0, 10            # imprime a quebra de linha
    		syscall

    		addi $t6, $t6, 4      # vai pro próximo
    		j print_array

	end:
    		li $v0, 10            # encerra o programa
    		syscall
