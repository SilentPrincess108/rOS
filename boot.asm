mov bx, 5
cmp bx, 5
je loop
jmp $

loop:
    mov ah, 0x0e
    mov al, 65
    int 0x10

jmp $

jmp $ ; essentially an infinite loop. constantly jump to current address

times 510-($-$$) db 0 ; add 508 btyes of zeroes so that boot is 512 bytes in total
db 0x55, 0xaa ; boot signature