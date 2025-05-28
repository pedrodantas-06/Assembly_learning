        .text
        .globl main

main:
        li   $a0, 17      # a
        li   $a1, 5       # b
        li   $v1, 0       # flag
        jal  mod_rec
        li   $v0, 10
        syscall

mod_rec:
        addi $sp, $sp, -8
        sw   $ra, 4($sp)
        sw   $s0, 0($sp)

        move $s0, $a1     # salva b
        bltz $a0, neg     # se a<0
        slt  $t0, $a0, $s0
        bne  $t0, $zero, base

        sub  $a0, $a0, $s0
        move $a1, $s0
        jal  mod_rec
        j    end

base:
        move $v0, $a0     # resto

end:
        lw   $ra, 4($sp)
        lw   $s0, 0($sp)
        addi $sp, $sp, 8
        jr   $ra

neg:
        li   $v1, 1       # erro
        li   $v0, 10
        syscall
