call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler'
Plug 'tpope/vim-rails'
Plug 'Shougo/neocomplete.vim'
Plug 'w0ng/vim-hybrid'
Plug 'jpo/vim-railscasts-theme'

" Initialize plugin system
call plug#end()

colorscheme railscasts

"####################### 
" 表示系 
"#######################

set number "行番号表示 
set showmode "モード表示 
set title "編集中のファイル名を表示 
set ruler "ルーラーの表示 
set showcmd "入力中のコマンドをステータスに表示する 
set showmatch "括弧入力時の対応する括弧を表示 
set laststatus=2 "ステータスラインを常に表示

"clipboardを使用
set clipboard+=unnamed

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" set cursorline
" hi clear CursorLine

"####################### 
" プログラミングヘルプ系 
"#######################

syntax on "カラー表示 
set smartindent "オートインデント 
" tab関連 
set expandtab "タブの代わりに空白文字挿入 
set ts=2 sw=2 sts=0 "タブは半角2文字分のスペース 
" ファイルを開いた際に、前回終了時の行で起動 
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"####################### 
" 検索系 
"#######################

set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する 
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する 
set wrapscan "検索時に最後まで行ったら最初に戻る 
set incsearch "検索文字列入力時に順次対象文字列にヒットさせない 
set hlsearch "検索結果文字列の非ハイライト表示

"####################### 
" vimfiler
"#######################

"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

nnoremap s <Nop>
nnoremap sn gt
nnoremap sp gT
nnoremap sw <C-w>w

nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"####################### 
" UniteVim
"#######################

" The prefix key.
" nnoremap [unite] <Nop>
" nmap <Space>u [unite]

" unite.vim keymap
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
nnoremap <silent> ,uu :<C-u>Unite<Space>file<CR>
nnoremap <silent> ,ug :<C-u>Unite<Space>grep<CR>
nnoremap <silent> ,uf :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> ,ub :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> ,ua :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> ,um :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> ,uh :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uc :<C-u>UniteWithBufferDir -buffer-name=files file<CR>


"####################### 
" NeoComplete
"#######################

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
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

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
