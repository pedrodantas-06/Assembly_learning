.data 
	a: .word -129
	b: .word 10
	result: .word 0
	remainder: .word 0
	sinal: .word 0
	space: .asciiz  " "
.text 
	# carregar os valores de a e b na memória
	lw $t0, a
	lw $t1, b 
	
	# inicializar quociente 
	li $s0, 0 

	
	# determinar o sinal do resultado
	xor $t3, $t0, $t1
	slt $t3, $t3, $zero
	sw $t3, sinal 
	
	# Extraimos o abs de cada inteiro 
	abs $t0, $t0
	abs $t1, $t1
	
	# subtrair b de a até a ser menor que b em módulo
	loop_division:
		blt $t0, $t1, end_loop
		addi $s0, $s0, 1
		sub $t0, $t0, $t1
		j loop_division
		
	# mudar o valor do quociente se necessário
	end_loop:
		lw $t3, sinal
		beqz $t3, store_result
		neg $s0, $s0
		
	# mudar o valor do resto se necessário
	store_result:
		lw $t4, a
		bgez $t4, saves
		neg $t0, $t0
	
	# salvar ambos os valores nos registradores	
	saves:
		sw $s0, result
		sw $t0, remainder
	
	# imprimir resultado e encerrar o programa
	li $v0, 1
	move $a0, $s0
	syscall 
	
	li $v0, 4
	la $a0, space
	syscall 
	
	li $v0, 1
	move $a0, $t0
	syscall 
	
	li $v0, 10
	syscall 
		 
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

	
