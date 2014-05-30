"maps accidental key strokes on commands to their actual commands
:command Q :q
:command Qa :qa
:command QA :qa
:command Xa :xa
:command XA :xa
:command W :w
:command Wa :wa
:command WA :wa

"maps jj and kk to the escape key
:imap jj <Esc>
:imap kk <Esc>
:imap jk <Esc>
:imap kj <Esc>
:imap `` <Esc>

"using improved vi
set nocompatible

"turns on synatx highlighting
syntax on
set t_Co=256
colorscheme inkpot

"makes sure the backspace key is set to work on various terminals
set backspace=2

"allows to hide unsaved buffers
set hidden

"show a color column at 100 characters to see when code lines are too long
set colorcolumn=100

"folding settings
"Enable indent folding
set foldenable
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"set line numbers
set number

"set autocompletion for various languages
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

"maps auto complete to ctrl+space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set laststatus=2

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

"Set line numbering to take up 5 spaces
set numberwidth=5 "Highlight current line
set cursorline

"Turn on spell checking with English dictionary
set spell
set spelllang=en
set spellsuggest=9 "show only 9 suggestions for misspelled words

"change the highlighting for spell checks 
hi clear SpellBad
hi SpellBad cterm=underline

"detect machine
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "RDAGHSTANI-W7"
    "my bhvr station
    "mintty colour settings
    let &t_Co=256 
    let &t_AF="\e[38;5;%dm" 
    let &t_AB="\e[48;5;%dm" 

    set expandtab
    set ts=4
    set shiftwidth=4
    set smartindent

    map <C-P> :!/c/xampp/php/php.exe -l %<CR>
elseif hostname == "rdaghstani-ubuntu"
    "my bhvr ubuntu station
    set expandtab
    set ts=4
    set shiftwidth=4
    set smartindent
elseif hostname == "RAMY-LAPTOP"
    "my laptop
else
    "default settings
    "tab stop and indent width at 4 and automatic indenting
    set ts=4
    set shiftwidth=4
    set smartindent
endif

"underlines the cursor line
hi CursorLine cterm=underline

"underline the current tab
hi TabLineSel cterm=underline

"vundle setup
filetype off                   " required!
filetype plugin indent on     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" see :h vundle for more details or wiki for FAQ
" required! 
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-dispatch'
Bundle 'szw/vim-tags'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jeroenbourgois/vim-actionscript'
Bundle 'lint.vim'
Bundle 'brookhong/DBGPavim'
"Bundle 'git://git.wincent.com/command-t.git'

" vim tabs key binding
nmap <F8> :TagbarToggle<CR>

" vim-tags configuration
let g:vim_tags_auto_generate = 1
let g:vim_tags_project_tags_command = "ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_ignore_files = ['.gitignore', '.hgignore']
let g:vim_tags_ignore_file_comment_pattern = '^[#"]'
let g:vim_tags_directories = []
let g:vim_tags_main_file = 'vim_tags'
let g:vim_tags_extension = '.tags'

" remap ctr-] to open the tag in a new tab
:nnoremap <C-]> <C-w><C-]><C-w>T

" fix my pasting problems
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" Automatically fall into paste mode when pasting
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Configure DBGPavim
let g:dbgPavimPort = 9000
let g:dbgPavimBreakAtEntry = 0
let g:dbgPavimOnce = 0
