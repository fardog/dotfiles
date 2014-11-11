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


if has("lua")
	" everything past this line is for neocomplete
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
		\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
	    let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplete#close_popup() . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplete#enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplete#enable_insert_char_pre = 1

	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
