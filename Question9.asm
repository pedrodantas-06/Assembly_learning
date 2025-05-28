.data 
	final_string : .space 100
	my_string : .asciiz "enTRadA"
	
.text

	# t0 = indice na palavra de origem
	# t1 = indice na palavra de destino

	# carregando as posições das strings
	la $t0, my_string
	la $t1, final_string
	
	# loop para detectar as vogais
	for_vogais:

		
		lb $t2, 0($t0) # charactere atual
		
		beqz $t2, end_vogais # termina loop caso string acabe
		
		addi $t0, $t0, 1		  
		
		# tratando de characteres que não são letras
		blt $t2, 'A', other
		bgt $t2, 'z', other
		blt $t2, 91, letra
		bgt $t2, 96, letra
		j other
		

		letra:
		# escolhendo vogais minusculas
		beq $t2, 'a', vogal_min
		beq $t2, 'e', vogal_min
		beq $t2, 'i', vogal_min
		beq $t2, 'o', vogal_min
		beq $t2, 'u', vogal_min
		
		# escolhendo vogais maiusculas
		beq $t2, 'A', vogal_mai
		beq $t2, 'E', vogal_mai
		beq $t2, 'I', vogal_mai
		beq $t2, 'O', vogal_mai
		beq $t2, 'U', vogal_mai
		
		# faz o loop caso não sejam vogais
		j for_vogais
		
		# vogais minusculas tem o valor subtraido por 32
		# para seu valor ASCII ser maisculo

		# adicionando as vogais
		vogal_min:
			addi $t2, $t2, -32
			sb $t2, 0($t1)
			addi $t1, $t1, 1
			j for_vogais
		
		vogal_mai:
			sb $t2, 0($t1)
			addi $t1, $t1, 1
			j for_vogais
	
	end_vogais:
	

	la $t0, my_string # voltando o indice t0 para o inicio da string
	for_consoantes:
		lb $t2, 0($t0) # charactere atual
		
		beqz $t2, end # termina loop caso string acabe
		
		addi $t0, $t0, 1
		
		# ignorando as vogais
		beq $t2, 'a', skip
		beq $t2, 'e', skip
		beq $t2, 'i', skip
		beq $t2, 'o', skip
		beq $t2, 'u', skip
		
		beq $t2, 'A', skip
		beq $t2, 'E', skip
		beq $t2, 'I', skip
		beq $t2, 'O', skip
		beq $t2, 'U', skip
		
		# tratando de characteres que não são letras
		blt $t2, 'A', other
		bgt $t2, 'z', other
		blt $t2, 91, maiusculo
		bgt $t2, 96, minusculo
		j other
		
		# consoantes maiusculas tem o valor adicionado por 32
		# para seu valor ASCII ser minusculas

		# adicionando as consoantes
		maiusculo:
			addi $t2, $t2, 32
			sb $t2, 0($t1)
			addi $t1, $t1, 1
			j for_consoantes
		
		minusculo:
			sb $t2, 0($t1)
			addi $t1, $t1, 1
		
		# ignorando as vogais
		skip:
			j for_consoantes
		
	# caso o valor lido não seja uma letra
	other:
		move $v1, $t2
			
		li $v0, 10
		syscall
		
	# print da string final
	end:
	
	li $v0, 4
	la $a0, final_string
	syscall
	
