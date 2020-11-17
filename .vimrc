" Plug plugin manager
call plug#begin("~/.vim/plugged")
    " Code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
    Plug 'ctrlpvim/ctrlp.vim'
    " File system explorer for Vim
    Plug 'scrooloose/nerdtree'
    "Plug 'ryanoasis/vim-devicons'
    " Highlight whitespace/strip it
    Plug 'ntpeters/vim-better-whitespace'
    " Ease navigation with vim motions
    Plug 'easymotion/vim-easymotion'
    " Easy window swap
    Plug 'wesQ3/vim-windowswap'
    " Better JSON edition
    Plug 'elzr/vim-json'
    " Better JavaScript syntax highlight
    Plug 'pangloss/vim-javascript'
    " Vuejs syntax highlight
    Plug 'posva/vim-vue'
    " JSX syntax highlight
    Plug 'MaxMEllon/vim-jsx-pretty'
    " Go development plugin
    Plug 'fatih/vim-go'
call plug#end()

" syntax highlighting
syntax on
set bg=dark
colorscheme kraihlight
"colorscheme happy_hacking
"colorscheme mustang

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

" search for selected text in vmode
vnoremap // y/<C-R>"<CR>

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
imap ñ ;
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

"Omni menu colors
hi Pmenu ctermfg=15 ctermbg=235 cterm=bold
hi PmenuSel ctermfg=15 ctermbg=238 gui=bold

" backspace not in vim-style
set backspace=indent,eol,start

" reopen file at last-edited position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" default templates for new files
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.template

" habits, habits: disable arrow keys in normal & insertion modes
"nmap <up> <nop>
"imap <up> <nop>
"nmap <down> <nop>
"imap <down> <nop>
"nmap <left> <nop>
"imap <left> <nop>
"nmap <right> <nop>
"imap <right> <nop>

" Restore EasyMotion config to be triggered by leader
map ç <Plug>(easymotion-prefix)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz,'

" Window Swap
nnoremap <silent> çww :call WindowSwap#EasyWindowSwap()<CR>

" Force usage of the old regex engine
 set re=1

 " CoC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-json',
  \ 'coc-yaml',
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Diagnostics
nmap <silent> g, <Plug>(coc-diagnostic-prev)
nmap <silent> g. <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gb <C-o>

" Refactor: Symbol renaming
nmap <F2> <Plug>(coc-rename)
