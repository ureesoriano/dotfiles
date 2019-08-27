" Plug plugin manager
call plug#begin("~/.vim/plugged")
    " Code completion for Vim
    Plug 'Valloric/YouCompleteMe'
    " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
    Plug 'ctrlpvim/ctrlp.vim'
    " File system explorer for Vim
    Plug 'scrooloose/nerdtree'
    " Highlight whitespace/strip it
    Plug 'ntpeters/vim-better-whitespace'
    " Ease navigation with vim motions
    Plug 'easymotion/vim-easymotion'
    " Better JSON edition
    Plug 'elzr/vim-json'
    " Perl-relatex syntax and helper for Perl 5
    Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
    " Tern-based JavaScript editing support
    Plug 'ternjs/tern_for_vim'
    " Better JavaScript syntax highlight
    Plug 'pangloss/vim-javascript'
    " Vuejs syntax highlight
    Plug 'posva/vim-vue'
call plug#end()

" Tern auto-close doc window after closing YouCompleteMe suggestions
autocmd CompleteDone * pclose

" syntax highlighting
syntax on
set bg=dark
colorscheme kraihlight

set encoding=utf-8
set noswapfile      " No swap (.swp) files
set nobackup        " No backup (~) files

" show line numbers
set number
set relativenumber

" autoindent
set autoindent
set smartindent

" Keep 3 lines below and above the cursor
set scrolloff=3

" 2 space tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" incremental search, case insensitive when using lower
set incsearch
set ignorecase
set smartcase

" highlight search matches
" ... and clear search hl with 'esc'
set hlsearch
nnoremap <F1> :nohl<Enter>

" show matching brackets
set showmatch
hi MatchParen cterm=none ctermbg=none ctermfg=red cterm=bold

" show undesired blanks
"set list
"set listchars=tab:,.,trail:.,extends:#,nbsp:.

" prevent delays when leaving insert mode via ESC
set timeoutlen=1000
set ttimeoutlen=0

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

" open vsplits on the right
set splitright

" comment/uncomment blocks of code in vmode
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" ease tab navigation
map <c-t> :tabnew<Enter>
map <c-w> :tabclose<Enter>
map <F7> :tabp<Enter>
map <F8> :tabn<Enter>
nnoremap <s-h> :tabp<Enter>
nnoremap <s-l> :tabn<Enter>


" tab relocation
nnoremap <s-j> :execute 'tabmove' tabpagenr() - 2 <CR>
nnoremap <s-k> :execute 'tabmove' tabpagenr() <CR>

" ease window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" Always show statusline
set laststatus=2
" Use 256 colors
set t_Co=256

" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
" override max files default
let g:ctrlp_max_files=0
" jump to file if already open
let g:ctrlp_switch_buffer = 'Et'
" open new file in a tab right after the current one
let g:ctrlp_tabpage_position = 'ac'
" open new files in a tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" Ignore .git and node_modules folders
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules$\|local$',
\ }

" NerdTree config
map <C-n> :NERDTreeToggle<CR>
" Fix terminal not sending ALT
execute "set <M-n>=\en"
map <M-n> :NERDTreeFind<CR>
let NERDTreeMapOpenInTab='t'

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Omni menu colors
hi Pmenu ctermfg=15 ctermbg=235 cterm=bold
hi PmenuSel ctermfg=15 ctermbg=238 gui=bold

" YouCompleteMe config
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1
" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" backspace not in vim-style
set backspace=indent,eol,start

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
"nmap <up> <nop>
"imap <up> <nop>
"nmap <down> <nop>
"imap <down> <nop>
"nmap <left> <nop>
"imap <left> <nop>
"nmap <right> <nop>
"imap <right> <nop>


" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" Restore EasyMotion config to be triggered by leader
"map <Leader> <Plug>(easymotion-prefix)
map ç <Plug>(easymotion-prefix)

" Session management
"map <F5> :mksession! ~/vim_session <cr>
"map <F6> :source ~/vim_session <cr>
map <F5> :mks! ~/.vim/sessions/session.vim <cr>
map <F6> :source ~/.vim/sessions/session.vim <cr>

" Leader more accessible
let mapleader = "ç"

" Window Swap
nnoremap <silent> çww :call WindowSwap#EasyWindowSwap()<CR>

" Folds
autocmd Syntax html,javascript,json,perl setlocal foldmethod=indent
autocmd Syntax html,javascript,json,perl normal zR
