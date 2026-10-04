ENTRY(_start)

SECTIONS {
  . = 0x0;
  .text   : { KEEP(*(.text.init)) KEEP(*(.text.boot)) *(.text*) }
  .rodata : { *(.rodata*) *(.srodata*) }
  .data   : {
    *(.data*)
    . = ALIGN(8);
    __global_pointer$ = . + 0x800;
    *(.sdata*)
  }
  .bss    : {
    . = ALIGN(4);
    _bss_start = .;
    *(.bss*) *(.sbss*) *(COMMON)
    . = ALIGN(4);
    _bss_end = .;
  }
  . = ALIGN(8);
  _end = .;
  _stack_top = 0x08000000;
  ASSERT(_end < _stack_top, "image overruns the stack top")
}