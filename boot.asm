;booting once puts us in real mode: 16-bit mode that allows direct memory access   

mov ah, 0x0e ;switches to teletype mode (bios video routine)
mov al, 65
int 0x10 ;call bios interrupt for video routine

loop:
    inc al
    add al, 32 ;make lowercase
    int 0x10
    sub al, 32 ;make uppercase again b4 comp
    inc al

    cmp al, 91
    je exit
    int 0x10
    jmp loop

exit:
    jmp $ ; essentially an infinite loop. constantly jump to current address

times 510-($-$$) db 0 ; add 508 btyes of zeroes so that boot is 512 bytes in total
db 0x55, 0xaa ; boot signature