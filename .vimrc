" pathogen plugin manager
execute pathogen#infect()

" show line numbers
set number

" syntax highlighting
syntax on
set bg=dark

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


