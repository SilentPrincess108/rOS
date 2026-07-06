;booting once puts us in real mode: 16-bit mode that allows direct memory access   
[org 0x7c00]

mov ah, 0x0e ;switches to teletype mode (bios video routine)
mov bx, quote ;move this point in memory into bx

printLoop:
    mov al, [bx] ;move whatever is at bx, into al
    int 0x10 ;call bios interrupt for video routine
    cmp al, 0
    je exit
    inc bx
    jmp printLoop

exit:
    jmp $ ; essentially an infinite loop. constantly jump to current address

quote:
    db "Anything for queen roro", 0

times 510-($-$$) db 0 ; add 508 btyes of zeroes so that boot is 512 bytes in total
db 0x55, 0xaa ; boot signature