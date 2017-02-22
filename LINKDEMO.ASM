; Link Assembly Language Demo
; David Couzelis
; 1999


        .MODEL SMALL


        .386

        
        .STACK 100h

        
        .DATA


; A bitmap of the hero...
pic_link  DB    000d,000d,000d,000d,000d,000d,191d,191d,191d,191d,191d,000d,000d,000d,000d,000d 
          DB    000d,000d,000d,000d,000d,191d,002d,010d,010d,002d,002d,191d,000d,000d,000d,000d 
          DB    000d,000d,000d,000d,191d,191d,002d,191d,191d,002d,002d,002d,191d,191d,000d,000d 
          DB    000d,000d,000d,191d,067d,191d,191d,010d,010d,010d,010d,002d,191d,067d,191d,000d 
          DB    000d,000d,000d,191d,067d,191d,010d,191d,191d,191d,191d,010d,191d,067d,191d,000d 
          DB    000d,000d,000d,191d,067d,191d,191d,191d,191d,191d,191d,191d,191d,067d,191d,000d 
          DB    000d,000d,191d,191d,066d,066d,191d,191d,191d,191d,191d,191d,065d,065d,191d,000d 
          DB    000d,191d,004d,191d,191d,067d,067d,191d,066d,066d,191d,066d,066d,191d,000d,000d 
          DB    000d,191d,004d,191d,191d,066d,067d,191d,066d,066d,191d,066d,065d,191d,000d,000d 
          DB    000d,191d,004d,191d,006d,191d,066d,067d,067d,067d,067d,065d,191d,006d,191d,000d 
          DB    000d,191d,004d,191d,067d,191d,191d,191d,191d,191d,191d,191d,191d,006d,191d,000d 
          DB    000d,191d,004d,191d,067d,191d,002d,002d,002d,002d,191d,067d,067d,006d,191d,000d
          DB    000d,191d,004d,191d,191d,010d,010d,010d,010d,010d,191d,067d,067d,191d,000d,000d 
          DB    000d,000d,191d,191d,191d,191d,191d,191d,002d,002d,002d,191d,191d,000d,000d,000d 
          DB    000d,000d,000d,191d,191d,006d,006d,006d,191d,191d,191d,191d,191d,191d,000d,000d 
          DB    000d,000d,000d,000d,191d,191d,191d,191d,191d,191d,191d,191d,191d,000d,000d,000d 

; A bitmap of some grass...
pic_grass DB    118d,118d,118d,118d,118d,165d,118d,118d,118d,165d,165d,118d,118d,165d,165d,118d
          DB    118d,165d,165d,165d,165d,118d,118d,165d,118d,118d,118d,118d,118d,118d,118d,118d
          DB    118d,118d,118d,118d,118d,118d,118d,118d,118d,165d,118d,118d,118d,118d,165d,165d
          DB    118d,165d,165d,118d,118d,118d,118d,118d,118d,118d,165d,165d,118d,118d,118d,118d
          DB    118d,118d,118d,165d,118d,118d,165d,165d,165d,118d,118d,118d,118d,118d,118d,118d
          DB    118d,118d,118d,165d,165d,165d,165d,118d,118d,165d,118d,118d,118d,118d,118d,118d
          DB    165d,165d,118d,118d,165d,165d,118d,118d,118d,118d,118d,165d,118d,165d,165d,118d
          DB    165d,118d,118d,165d,165d,165d,118d,118d,118d,165d,165d,118d,118d,118d,118d,118d
          DB    118d,118d,118d,118d,118d,118d,118d,118d,118d,118d,118d,118d,118d,118d,165d,165d
          DB    118d,165d,118d,165d,165d,118d,118d,118d,165d,165d,118d,118d,118d,118d,118d,118d
          DB    118d,118d,118d,118d,118d,118d,118d,165d,118d,165d,165d,165d,165d,165d,118d,118d
          DB    165d,165d,118d,118d,118d,118d,118d,118d,118d,118d,165d,165d,165d,118d,118d,118d
          DB    118d,165d,165d,165d,118d,165d,118d,118d,118d,165d,165d,165d,118d,118d,118d,165d
          DB    118d,118d,118d,118d,118d,118d,118d,118d,165d,118d,165d,165d,118d,118d,165d,165d
          DB    118d,165d,165d,118d,118d,165d,165d,118d,118d,118d,118d,118d,118d,118d,118d,118d
          DB    118d,118d,118d,165d,118d,118d,118d,118d,118d,118d,118d,118d,165d,165d,118d,118d

; A bitmap of a rock
pic_rock  DB    118d,118d,118d,118d,118d,165d,118d,118d,118d,165d,165d,118d,118d,165d,165d,118d
          DB    118d,165d,165d,165d,165d,118d,118d,165d,118d,118d,118d,118d,118d,118d,118d,118d
          DB    118d,118d,118d,118d,118d,118d,118d,118d,118d,165d,118d,118d,118d,118d,165d,165d
          DB    118d,165d,165d,118d,118d,118d,118d,118d,118d,118d,165d,165d,118d,118d,118d,118d
          DB    119d,119d,119d,140d,119d,119d,191d,191d,191d,191d,191d,119d,119d,118d,118d,119d
          DB    119d,140d,119d,140d,140d,191d,007d,007d,007d,007d,007d,191d,119d,119d,140d,119d
          DB    119d,140d,119d,140d,191d,191d,007d,007d,007d,007d,007d,007d,191d,119d,140d,140d
          DB    119d,191d,191d,191d,007d,007d,007d,007d,007d,007d,007d,007d,191d,191d,140d,140d
          DB    191d,191d,007d,008d,007d,007d,007d,007d,007d,007d,008d,007d,007d,007d,191d,140d
          DB    191d,007d,007d,008d,008d,007d,007d,007d,008d,007d,007d,008d,007d,007d,008d,191d
          DB    191d,007d,007d,007d,008d,008d,007d,007d,007d,007d,007d,007d,007d,008d,008d,191d
          DB    191d,191d,007d,007d,007d,007d,008d,007d,007d,007d,008d,008d,008d,008d,008d,191d
          DB    140d,191d,191d,007d,007d,007d,007d,007d,008d,008d,008d,008d,008d,008d,191d,191d
          DB    140d,140d,191d,191d,007d,007d,007d,008d,008d,008d,008d,008d,191d,191d,191d,140d
          DB    140d,140d,140d,191d,007d,007d,007d,008d,008d,008d,191d,191d,140d,140d,140d,140d
          DB    142d,142d,140d,140d,191d,191d,191d,191d,191d,191d,140d,140d,140d,142d,142d,142d


pos_x      DW    50
pos_y      DW    50
x_loops    DW    ?
y_loops    DW    ?
color_loc  DW    ?

EnterSC  EQU     28
UpSC     EQU     72
DownSC   EQU     80
inkey    DB      ?

x_count  DW      ?
y_count  DW      ?

Hi      DB      'Hi $'    ; Something to print, for debugging purposes...


        .CODE


; Move cursor to the next line...
next_line  PROC
        mov     dl, 13
        mov     ah, 2h
        int     21h
        mov     dl, 10
        int     21h
        ret
next_line  ENDP



draw_pic_16x16  MACRO  pic_array, x_pos, y_pos
        LOCAL  pic_y_loop, pic_x_loop, continue_x_loop

        ; Begin the y loop...
        mov     y_loops, 0          ; Loop the y 16 times...

        pic_y_loop:
        ; Begin the x loop...
        mov     x_loops, 0          ; Loop the x 16 times...

        pic_x_loop:
        ; Plot the pixel...
        mov     ax, y_loops         ; Multiply to find pixel color from array...
        mov     bx, 16
        imul    bx
        add     ax, x_loops
        mov     color_loc, ax

        mov     ah, 0Ch

        mov     di, color_loc           ; Use di to store color_loc as an index number...
        mov     al, [pic_array+di]
        cmp     al, 000d
        je      continue_x_loop

        mov     bh, 0

        mov     cx, x_pos              ; For position purposes...
        add     cx, x_loops
        mov     dx, y_pos
        add     dx, y_loops
        ;mov     cx, x_loops
        ;mov     dx, y_loops

        int 10h
        ; Done plotting the pixel...

        continue_x_loop:
        ; Repeat the x loop...
        mov     ax, x_loops      
        inc     ax
        mov     x_loops, ax
        cmp     ax, 16
        jne     pic_x_loop
        
        ; Repeat the y loop...
        mov     ax, y_loops
        inc     ax
        mov     y_loops, ax
        cmp     ax, 16
        jne     pic_y_loop

        ENDM



;get_inkey  PROC
;        ; Check for key input...
;        mov     ah, 01h
;        int     16h
;        jz      game_start      ; No key is pressed...
;        mov     inkey, ah
;
;        up_key_check:
;        mov     dh, inkey
;        cmp     dh, UpSC        ; Check up key press...
;        jne     down_key_check
;        mov     cx, 10
;        sub     pos_y, cx
;        jmp     game_start
;
;        down_key_check:
;        mov     dh, inkey
;        cmp     dh, DownSC      ; Check down key press...
;        jne     end_key_check
;        mov     cx, pos_y
;        add     cx, 10
;        mov     pos_y, cx
;        jmp     game_start
;
;        end_key_check:
;        ;_PutStr Hi
;        mov     ah, inkey
;        cmp     ah, EnterSC     ; Check "end program" key's scan code...
;        jne     game_start
;
;        ret
;get_inkey  ENDP



Main    PROC
        mov     ax, @data
        mov     ds, ax

        ; Set DOS screen mode...
        mov     ax, 0013h
        int     10h


        game_start:

        ; Let's draw some grass!...
        mov     y_count, 0
        grass_loop_y:                                  ; Y loop...
        mov     x_count, 0
        grass_loop_x:                                  ; X loop...
        draw_pic_16x16  pic_grass, x_count, y_count
        mov     ax, 16
        add     x_count, ax
        mov     ax, 304
        cmp     x_count, ax
        jle     grass_loop_x                           ; Fall out of x loop...
        mov     ax, 16
        add     y_count, ax
        mov     ax, 184
        cmp     y_count, ax
        jle     grass_loop_y


        ; Ok, now how about some rocks!...
        mov     y_count, 0
        rock_loop_y:                                  ; Y loop...
        mov     x_count, 0
        rock_loop_x:                                  ; X loop...
        draw_pic_16x16  pic_rock, x_count, y_count
        mov     ax, 0
        cmp     y_count, ax
        je      rock_add_16
        mov     ax, 176
        cmp     y_count, ax
        je      rock_add_16

        mov     ax, 304
        add     x_count, ax
        jmp     rock_finish_x_loop

        rock_add_16:
        mov     ax, 16
        add     x_count, ax

        rock_finish_x_loop:
        mov     ax, 304
        cmp     x_count, ax
        jle     rock_loop_x                           ; Fall out of x loop...


        mov     ax, 16
        add     y_count, ax
        mov     ax, 184
        cmp     y_count, ax
        jle     rock_loop_y


        ;draw_pic_16x16  pic_grass, 34, 50
        ;draw_pic_16x16  pic_grass, 50, 50
        draw_pic_16x16  pic_link, 50, 50

        ; Check for key input...
        check_inkey:
        mov     ah, 01h
        int     16h
        jz      check_inkey      ; No key is pressed...


        mov     ax, 0003h
        int     10h
        mov     ax, 4C00h       ; Return code of 0...
        int     21h

Main    ENDP



        END     Main           ; Start execution...
