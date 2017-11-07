" vim configuration

set nocompatible                              " use vim, rather than vi, settings - NOTE: This must come first as it changes alot of other settings as a side effect

set nobackup                                  " do not save a .bak backup of the file
set noexrc                                    " .exrc is reserved for nvi usage

set autoindent                                " match the indentation of the preceding line
set cursorline                                " highlight the current line
set expandtab                                 " convert tabs to spaces
set incsearch                                 " do incremental searching
set ruler                                     " show cursor position in the status line
set shiftround                                " tab goes to the nearest multiple of shiftwidth/tabstop
set showcmd                                   " show incomplete commands
set showmode                                  " show current mode (e.g., INSERT)
set wrap                                      " wrap overly long lines

set backspace  =indent,eol,start              " backspace over everything in insert mode
set encoding   =utf-8                         " use unicode
set history    =64                            " keep n number of lines of command history
set shiftwidth =4                             " number of columns for each >> or <<
set softtabstop=4                             " number of columns for the soft tab
set tabstop    =4                             " number of columns for each tab
set viminfo    =                              " turn off using the viminfo file
set timeout timeoutlen=3000 ttimeoutlen=100   " this helps speed up performance on certain actions (e.g., hitting 'O')

syntax on                                     " turn on syntax highlighting
filetype plugin on                            " turn on filetype specefic rules
filetype plugin indent on                     " turn on filetype specific indentation rules

" http://www.vim.org/scripts/script.php?script_id=795
" use the colorscheme developed at Carnegie Mellon University
let xterm16_colormap  ='allblue'
let xterm16_brightness='high'
colorscheme xterm16

" XXX: these need to be set *after* the color scheme is set or they will be overwritten
highlight CursorLine ctermbg=233              " make the current line highlight only subtly lighter than background
" highlight OverLength ctermbg=130              " make all overlength lines highlight in a dark yellow color
" match OverLength /\%81v.*/                    " highlight lines longer than 80 characters

" http://www.vim.org/scripts/script.php?script_id=4354
" display indent guides for programming languages
let g:indentLine_color_term =236 " set color for vertical indent line to a dark grey
let g:indentLine_indentLevel=16  " because 10 just isn't enough
let g:indentLine_char       ='┊' " make a nicer indent line
let g:indentLine_fileType   =["c","cpp","css","html","javascript","lua","python","sh","sql","vim","xml"]

if has('autocmd') " assign filetype specific settings
  " show line numbers and turn off line wrapping in programming languages
  autocmd FileType c,cpp,css,html,javascript,lua,python,sh,sql,vim,xml set number nowrap

  " adjust tab and shift settings
  autocmd FileType c,cpp,javascript,python set shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType lua                     set shiftwidth=3 tabstop=3 softtabstop=3
  autocmd FileType css,html,sh,sql,vim,xml set shiftwidth=2 tabstop=2 softtabstop=2
endif

if has('mouse') " since many terminal emulators can handle the mouse just fine, enable it
  set mouse=a
endif

if !exists(':DiffBuffer') " this is a convenient command to diff the current buffer with the most recently saved version of the file
  command DiffBuffer vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Do not use ex mode. Use Q for formatting.
map Q gq

" CTRL-U in insert mode deletes alot. Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
