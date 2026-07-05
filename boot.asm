;booting once puts us in real mode: 16-bit mode that allows direct memory access   

mov ah, 0x0e ;switches to teletype mode (bios video routine)
mov al, "A"
int 0x10 ;call bios interrupt for video routine

loop:
    inc al
    cmp al, "Z" + 1
    je exit
    int 0x10
    jmp loop

exit:
    jmp $


jmp $ ; essentially an infinite loop. constantly jump to current address

times 510-($-$$) db 0 ; add 508 btyes of zeroes so that boot is 512 bytes in total
db 0x55, 0xaa ; boot signature