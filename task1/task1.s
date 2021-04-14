section .data
    form: dw "%d"

section .text                    	
        global assFunc
        extern printf
        extern c_checkValidity

assFunc:
    push ebp              		
    mov ebp, esp         		
    pushad  
    mov ecx, dword [ebp+8]
    push ecx
    call c_checkValidity
    mov edx, [eax]
    cmp byte [edx], 1
    jne odd
    even:
    shl edx, 2
    jmp end
    odd:
    shl edx, 3
    end:
    push edx
    push word [form]
    call printf
    pop edx
    popad                    	     		
    mov esp, ebp			
    pop ebp				
    ret