" Keep it vim, folks
set nocompatible

" match braces
set showmatch

" don't highlight 
set nohls

" increment search
set incsearch
"set ignorecase

" move around in command mode
"set virtualedit=all

" remember 300 lines
set history=300

" show line numbers
set number 

syntax on

"set endentation to 4 spaces instead of 8
"set cindent
"set smartindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"set to break lines at 80 chars
"set textwidth=80

"tabbed completion
function! Tab_Complete_Wrapper(direction)
let col = col('.') - 1
if !col || strpart( getline('.'), col('.')-2, 3 ) !~ '^\w'
return "\<tab>"
elseif "backward" == a:direction
return "\<c-p>"
else
return "\<c-n>"
endif
endfunction
inoremap <tab> <c-r>=Tab_Complete_Wrapper("forward")<cr>
inoremap <s-tab> <c-r>=Tab_Complete_Wrapper("backward")<cr>

"add the syntax highlighting file to the tab completion
au FileType * exe('setl dict+='.escape($VIMRUNTIME.'/syntax/'.&filetype.'.vim',' \$,'))
set complete+=k

set wrap
set number
set ruler
let g:localvimrc_ask=0
if exists('+cc')
    set cc=81
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
