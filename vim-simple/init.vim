filetype plugin on
filetype plugin indent on

" make drawing betterer
set lazyredraw
set ttyfast
set background=dark

" reload files changed outside vim
set autoread

" make temporary files sensible
set backup
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp
set backupskip=~/tmp/*
set noswapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp
set undodir=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp

" make search better
set ignorecase
set smartcase

" don't check caps for spelling
set spellcapcheck=

set wrap
set linebreak
" make our linebreak wrapping more meaningful
set showbreak=>>>
" highlight column 80
set colorcolumn=80
set showmatch

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" search highlighting
set hlsearch

set wildmenu
set wildmode=longest:full,full

" turn on the "visual bell" - which is much quieter than the "audio blink"
set visualbell
set noerrorbells

" correctly opening splits
set splitright
set splitbelow

set shell=/bin/sh

" set correct tabs for python (PEP8)
let python_highlight_all = 1

" indent
set autoindent
set smartindent

" defaults not terrible
set ts=4 sw=4 noexpandtab

" turn on spelling where sensible
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell


" filetype aliases
autocmd BufNewFile,BufRead *.ract set filetype=mustache


" filetype tab settings
autocmd Filetype html setlocal ts=4 sw=4 expandtab
autocmd Filetype htmldjango setlocal ts=4 sw=4 expandtab
autocmd Filetype mustache setlocal ts=4 sw=4 expandtab
autocmd Filetype ejs setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype jade setlocal ts=2 sw=2 expandtab
autocmd Filetype mkd,mkd.markdown,markdown setlocal ts=2 sw=2 textwidth=80 expandtab
autocmd Filetype rst setlocal ts=2 sw=2 expandtab
autocmd Filetype less setlocal ts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=4 sw=4 expandtab
autocmd Filetype php setlocal ts=2 sw=2 noexpandtab
autocmd Filetype xml setlocal ts=4 sw=4 expandtab
autocmd Filetype java setlocal ts=4 sw=4 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype haxe setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype vim setlocal ts=4 sw=4 expandtab
autocmd Filetype go setlocal ts=4 sw=4 noexpandtab

" jk for escape
inoremap jk <esc>

" set mark before search
nnoremap / ml/
nnoremap ? ml?

" set mark before jumping to top
nnoremap gg mkgg
nnoremap G mkG

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" remap leader to spc
nnoremap <SPACE> <Nop>
let mapleader=" "
let g:mapleader=" "

" leader commands
if has("clipboard")
    vmap <leader>y "+y
    nmap <leader>p "+p
else
    "for vims without +clipboard, emulate with xclip and the @m register
    vmap <silent> <leader>y "my:call system('xclip -sel clip', @m)<cr>
    nmap <silent> <leader>p :let @m = system('xclip -o -sel clip')<cr>"mp
endif

nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>/ :Ag
" other bindings
nnoremap <silent> <F9> :TagbarToggle<cr>
nnoremap <silent> <C-l> :nohl<cr><C-l>
nnoremap <silent> <C-y> :let @+=getreg()<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "node_modules/"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ag_prg="ag --nogroup --nocolor --ignore '*.min.*' --column"
