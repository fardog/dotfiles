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
set swapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp
set undodir=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp

" make search better
set ignorecase
set smartcase

" don't check caps for spelling
set spellcapcheck=

" enable omni completion
set ofu=syntaxcomplete#Complete

set wrap
set linebreak
" make our linebreak wrapping more meaningful
set showbreak=>>>
" highlight column 80
set colorcolumn=80
" highlight the current line
set cursorline

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

if has("gui_win32")
    let Tlist_Ctags_Cmd = 'C:/Users/nwittstock/Dropbox/Setups/vim/ctags58/ctags.exe'
endif

let Tlist_Inc_Winwidth=0 " for konsole


" turn on the "visual bell" - which is much quieter than the "audio blink"
set visualbell
set noerrorbells

set shell=/bin/sh

" colorscheme desert
colorscheme wombat256i

if has("gui_win32")
    set gfn=DejaVu\ Sans\ Mono:h10
elseif has("gui_gtk")
    set gfn=DejaVu\ Sans\ Mono\ 10
    au GUIEnter * set lines=46 columns=178
else
    set gfn=DejaVu\ Sans\ Mono:h12
    au GUIEnter * set lines=65 columns=198
endif

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
autocmd Filetype mkd setlocal ts=2 sw=2 textwidth=80 expandtab
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


" autoclose fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" use open for Gbrowse in fugitive
command! -bar -nargs=1 Browse silent! exe '!open' shellescape(<q-args>, 1)


" set mark before search
nnoremap / ml/
nnoremap ? ml?

" set mark before jumping to top
nnoremap gg mkgg
nnoremap G mkG

" leader commands
noremap <leader>t :!npm test %<cr>
noremap <leader>T :!npm test<cr>
noremap <leader>r :!npm run test-phantom %<cr>
noremap <leader>R :!npm run test-phantom<cr>

if has("clipboard")
    vmap <leader>y "+y
    nmap <leader>p "+p
else
    "for vims without +clipboard, emulate with xclip and the @m register
    vmap <silent> <leader>y "my:call system('xclip -sel clip', @m)<cr>
    nmap <silent> <leader>p :let @m = system('xclip -o -sel clip')<cr>"mp
endif

" commonly used fuzzyfinder commands, to CtrlP
nnoremap <silent> sj     :CtrlPBuffer<CR>
nnoremap <silent> sk     :CtrlP<CR>

" other bindings
nnoremap <silent> <F9> :TagbarToggle<CR>


" configure syntastic
let g:syntastic_javascript_checkers=['eslint']
" if ua-style exists, load those rules
let file = expand("~/Projects/UA/ua-style/config.json")
if filereadable(file)
    let g:syntastic_javascript_eslint_args='--config ~/Projects/UA/ua-style/config.json --rulesdir ~/Projects/UA/ua-style/lib/rules'
endif


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


" statusline funnery (from https://github.com/scrooloose/vimfiles/blob/master/vimrc#L78)
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display if buffer is dirty
set statusline+=%#error#
set statusline+=%{&modified?'[dirty]':''}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=\ [%f]
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
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

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
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
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
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
