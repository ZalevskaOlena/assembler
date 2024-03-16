.686
.model flat, stdcall

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

.data
 res dd 256 dup(0)
 Text db 'EAX=xxxxxxxx',13,10,
         'EBX=xxxxxxxx',13,10,
         'ECX=xxxxxxxx',13,10,
         'EDX=xxxxxxxx',0
 Caption db "0",0
 CaptionA db "1",0
 CaptionB db "2",0
 CaptionC db "80000000h",0
 CaptionD db "80000001h",0
 CaptionF db "80000002h,80000003h,80000004h",0
 CaptionI db "80000005h",0
 CaptionJ db "80000008h",0
 Vendor db 16 dup(0)
 CaptionVendor db "Vendor string",0

.code
DwordToStrHex proc
 push ebp
 mov ebp,esp
 mov ebx,[ebp+8] 
 mov edx,[ebp+12] 
 xor eax,eax
 mov edi,7
@next:
 mov al,dl
 and al,0Fh 
 add ax,48 
 cmp ax,58
 jl @store
 add ax,7 
@store:
 mov [ebx+edi],al
 shr edx,4
 dec edi
 cmp edi,0
 jge @next
 pop ebp
 ret 8
DwordToStrHex endp
main:
 mov eax, 0
 cpuid

 mov dword ptr[Vendor], ebx
 mov dword ptr[Vendor+4], edx
 mov dword ptr[Vendor+8], ecx
 invoke MessageBoxA, 0, ADDR Vendor, ADDR CaptionVendor, 0

 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx

 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0

 mov eax, 1
 cpuid
 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx
 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR CaptionA, 0

 mov eax, 2
 cpuid
 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx
 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR CaptionB, 0

 mov eax, 80000000h
 cpuid
 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx
 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR CaptionC, 0

 mov eax, 80000001h
 cpuid
 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx
 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR CaptionD, 0

 mov eax, 80000002h
 cpuid
 mov dword ptr[Vendor], eax
 mov dword ptr[Vendor+4], ebx
 mov dword ptr[Vendor+8], ecx
 mov dword ptr[Vendor+12], edx

 mov eax, 80000003h
 cpuid
 mov dword ptr[Vendor+16], eax
 mov dword ptr[Vendor+20], ebx
 mov dword ptr[Vendor+24], ecx
 mov dword ptr[Vendor+28], edx

 mov eax, 80000004h
 cpuid
 mov dword ptr[Vendor+32], eax
 mov dword ptr[Vendor+36], ebx
 mov dword ptr[Vendor+40], ecx
 mov dword ptr[Vendor+44], edx

 invoke MessageBoxA, 0, ADDR Vendor, ADDR CaptionF, 0


 mov eax, 80000005h
 cpuid
 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx
 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR CaptionI, 0

 mov eax, 80000008h
 cpuid
 mov dword ptr[res], eax
 mov dword ptr[res+4], ebx
 mov dword ptr[res+8], ecx
 mov dword ptr[res+12], edx
 push [res] 
 push offset [Text+4] 
 call DwordToStrHex
 push [res+4] 
 push offset [Text+18]
 call DwordToStrHex
 push [res+8] 
 push offset [Text+32]
 call DwordToStrHex
 push [res+12] 
 push offset [Text+46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text, ADDR CaptionJ, 0

 invoke ExitProcess, 0
end main