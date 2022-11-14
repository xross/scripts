" XMOS ASS syntax highlighter

" In the future this can be based on tasm.vim from global VIM configuration

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Case sensitive
syntax case match

" Instructions
syntax keyword AssInstructionsArithm add and andnot ashr bitrev byterev crc clz
syntax keyword AssInstructionsArithm eq divs divu ldc lss lsu mkmsk mul mov neg not rems remu sext shl shr sub xor zext crc32
syntax keyword AssInstructionsBranch bl bf bt bu blat blacp bla bau entsp retsp bru
syntax keyword AssInstructionsIO in out inshr outshr eef eet eeu getr gettstmp freer freet outct outt outwct
syntax keyword AssInstructionsIO setclk setc setd setptime setv testct testwct waitef waitet waiteu int edu clre
syntax keyword AssInstructionsMemory ld16s ld8u lda16 ldap ldaw st16 st8 stw ldw
syntax keyword AssInstructionsStatus get set getsr extsp extdp setsr tsetmr clrsr
syntax keyword AssInstructionsThreads getst mjoin msync ssync init start
syntax keyword AssInstructionsDebug dentsp dcall drestsp dret dsetreg
syntax keyword AssInstructionsKernel kcall kentsp krestsp kret ecallf ecallt
highlight link AssInstructionsArithm Keyword
highlight link AssInstructionsBranch Structure
highlight link AssInstructionsIO Structure
highlight link AssInstructionsMemory Keyword
highlight link AssInstructionsStatus Keyword
highlight link AssInstructionsThreads NonText
highlight link AssInstructionsDebug Keyword
highlight link AssInstructionsKernel Keyword

" Registers
syntax keyword AssRegister r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11
syntax keyword AssSpecialRegister sp cp dp
highlight link AssRegister Register
highlight link AssSpecialRegister Register

" Comments
syntax match AssIdentifier /\<[\l_][\l_\d]+\>/
syntax match AssComment /\/\/.*/
highlight link AssComment Comment

" Assembler directives
syntax match AssDirective /\.word/
syntax match AssDirective /\.align/
syntax match AssDirective /\.skip/
highlight link AssDirective Keyword

" Preprocessor
syntax region AssPreprocessor start=/#/ end=/$/ contains=AssComment keepend
highlight link AssPreprocessor Preproc



"hex number
syntax match	hexNumber		"0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syntax match	decNumber		" \d\+\(u\=l\{0,2}\|ll\=u\)\>"

highlight link hexNumber Constant
highlight link decNumber Constant
let b:current_syntax = "ass"

syntax match to_do /\TODO/
highlight link todo to_do
