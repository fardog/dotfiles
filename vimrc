" load pathogen
execute pathogen#infect()
call pathogen#helptags()
syntax on
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

" enable omni completion
set ofu=syntaxcomplete#Complete

" enable omnicompletion for some filetypes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mkd.markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

set wrap
set linebreak
" make our linebreak wrapping more meaningful
set showbreak=>>>
" highlight column 80
set colorcolumn=80
" highlight the current line
set cursorline
set showmatch

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" search highlighting
set hlsearch

set wildmenu
set wildmode=longest:full,full

" set up taglist, bind to F8
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1 " exit if taglist is last window open
let Tlist_Show_One_File = 1 " Only show tags for current buffer
let Tlist_Use_Right_Window = 0 " Open on right side
let Tlist_Enable_Fold_Column = 0 " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'

let g:vim_markdown_folding_disabled=1

let Tlist_Inc_Winwidth=0 " for konsole

" turn on the "visual bell" - which is much quieter than the "audio blink"
set visualbell
set noerrorbells

" correctly opening splits
set splitright
set splitbelow

set shell=/bin/sh

" colors
colorscheme wombat256i

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
autocmd Filetype mkd,mkd.markdown setlocal ts=2 sw=2 textwidth=80 expandtab
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

" autoclose omnicompletion scratch window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" turn on neomake for everything
autocmd! BufWritePost,BufEnter * Neomake


" autoclose fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" use open for Gbrowse in fugitive
command! -bar -nargs=1 Browse silent! exe '!open' shellescape(<q-args>, 1)

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

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" left and right arrows navigate buffers
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
" up and down navigate jump list
nnoremap <up> <c-o>
nnoremap <down> <c-i>
" allow c-p and c-n to do command filtering
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" remap leader to spc
nnoremap <SPACE> <Nop>
let mapleader=" "
let g:mapleader=" "

" leader commands
noremap <leader>t :belowright split<cr>:resize 20<cr>:terminal $SHELL -c "npm test %"<cr>
noremap <leader>T :belowright split<cr>:resize 20<cr>:terminal $SHELL -c "npm test"<cr>
noremap <leader>w :.w !zsh<cr>
noremap <leader>z :terminal $SHELL<cr>
noremap <leader>N :TernRename<cr>

" terminal leader commands
tnoremap <leader>\ <C-\><C-n>

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

" configure neomake
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_python_enabled_makers = ['flake8']

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "node_modules/"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:agprg="ag --nogroup --nocolor --ignore '*.min.*' --column"


" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'modified', 'fugitive', 'readonly', 'relativepath' ],
      \             ['tabwarning', 'trailingspace'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'StatuslineFugitive',
      \   'modified': 'StatuslineModified',
      \   'readonly': 'StatuslineReadonly',
      \   'tabwarning': 'StatuslineTabWarning',
      \   'trailingspace': 'StatuslineTrailingSpaceWarning'
      \ }
      \ }

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" returns '+' if the file is modified
function! StatuslineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

" returns the current HEAD from fugitive, if there is one
function! StatuslineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" returns 'ro' if a file is read-only
function! StatuslineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "ro"
  else
    return ""
  endif
endfunction

"return '\s' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '\s'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '&et' if &et is set wrong
"return 'mixed-indenting' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  'mixed-indenting'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '&et'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
