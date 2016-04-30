" pathogen plugin manager
execute pathogen#infect()

" show line numbers
set relativenumber

" syntax highlighting
syntax on
set bg=dark
colorscheme kraihlight

" autoindent
set autoindent
set smartindent

" 4 space tabs
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" incremental search, case insensitive when using lower
set incsearch
set ignorecase
set smartcase

" show matching brackets
set showmatch

" show undesired blanks
"set list
"set listchars=tab:,.,trail:.,extends:#,nbsp:.

" history & undo BIG TIME
set history=1000
set undolevels=1000

" make tab in v mode ident code
vmap <tab> >gv 
vmap <s-tab> <gv 
" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>
" make s-tab in insert mode unident code
imap <s-tab> <bs>

" comment/uncomment blocks of code in vmode
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" ease tab navigation
map <c-t> :tabnew<Enter>
map <c-w> :tabclose<Enter>
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>

" ease window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" convenience mappings
nmap ñ :
nmap º <esc>
vmap º <esc>
imap º <esc>

" HATE stumbling into 'Q' instead of ':q'
map Q :q

" paste mode
set pastetoggle=<F9>

" powerline config
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" Always show statusline
set laststatus=2
" Use 256 colors
set t_Co=256

" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_working_path_mode = 'ra' " DAMN YOU SVN!
let g:ctrlp_working_path_mode = 0
" jump to file if already open
let g:ctrlp_switch_buffer = 'Et'
" open new file in a tab right after the current one
let g:ctrlp_tabpage_position = 'ac'
" open new files in a tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" reopen file at last-edited position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" default templates for new files
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" perl subroutine signatures, biatch
"let perl_sub_signatures = 1
"let perl_no_subprototype_error = 1

" check perl code with :make
"autocmd FileType perl set makeprg=perl\ -c\ %\ $*
"autocmd FileType perl set errorformat=%f:%l:%m
"autocmd FileType perl set autowrite

" habits, habits: disable arrow keys in normal & insertion modes
nmap <up> <nop>
imap <up> <nop>
nmap <down> <nop>
imap <down> <nop>
nmap <left> <nop>
imap <left> <nop>
nmap <right> <nop>
imap <right> <nop>


