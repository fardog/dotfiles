" load pathogen
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin on
filetype plugin indent on

" make temporary files sensible
set backup
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp 
set backupskip=~/tmp/*
set swapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp 
set undodir=~/.vim-tmp,~/tmp,/var/tmp,$HOME/Local\ Settings/Temp 

" enable spell checking
set spell

" enable omni completion
set ofu=syntaxcomplete#Complete

set wrap
set linebreak
" make our linebreak wrapping more meaningful
set showbreak=>>>
" highlight column 80
set colorcolumn=80

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
set vb

set shell=/bin/sh

colorscheme desert

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
set autoindent
" set expandtab
" set softtabstop=4
" set shiftwidth=4

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ejs setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype jade setlocal ts=2 sw=2 expandtab
autocmd Filetype mkd setlocal ts=4 sw=4 expandtab
autocmd Filetype less setlocal ts=2 sw=2 noexpandtab
autocmd Filetype scss setlocal ts=2 sw=2 noexpandtab
autocmd Filetype php setlocal ts=2 sw=2 noexpandtab
autocmd Filetype xml setlocal ts=4 sw=4 expandtab
autocmd Filetype java setlocal ts=4 sw=4 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype haxe setlocal ts=4 sw=4 noexpandtab 
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

" autoclose omnicompletion scratch window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" enable powerline
" set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

" bind commands for FuzzyFinder
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> sj     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> sL     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sy     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>


" " Everything past this line is for neocomplcache
" " Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
" let g:acp_enableAtStartup = 0
" " Launches neocomplcache automatically on vim startup.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" " Use underscore completion.
" let g:neocomplcache_enable_underbar_completion = 1
" " Sets minimum char length of syntax keyword.
" let g:neocomplcache_min_syntax_length = 3
" " buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 
" " Define file-type dependent dictionaries.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"     \ }
" 
" " Define keyword, for minor languages
" if !exists('g:neocomplcache_keyword_patterns')
"   let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
" 
" " SuperTab like snippets behavior.
" "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" 
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" 
" " AutoComplPop like behavior.
" "let g:neocomplcache_enable_auto_select = 1
" 
" " Shell like behavior(not recommended).
" "set completeopt+=longest
" "let g:neocomplcache_enable_auto_select = 1
" "let g:neocomplcache_disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
" "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" 
" " Enable omni completion. Not required if they are already set elsewhere in .vimrc
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" 
" " Enable heavy omni completion, which require computational power and may stall the vim. 
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
