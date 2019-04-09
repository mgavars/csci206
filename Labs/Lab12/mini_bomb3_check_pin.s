   0x004007b0 <+0>:     andi    v1,a0,0x55
   0x004007b4 <+4>:     li      v0,65
   0x004007b8 <+8>:     bne     v1,v0,0x4007c8 <check_pin+24>
   0x004007bc <+12>:    xori    a0,a0,0x41
   0x004007c0 <+16>:    jr      ra
   0x004007c4 <+20>:    sltu    v0,zero,a0
   0x004007c8 <+24>:    jr      ra
   0x004007cc <+28>:    move    v0,zero
