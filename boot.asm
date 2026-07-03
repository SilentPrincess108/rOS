jmp $ ; essentially an infinite loop. constantly jump to current address

times 510-($-$$) db 0 ; add 508 btyes of zeroes so that boot is 512 bytes in total
db 0x55, 0xaa ; boot signature