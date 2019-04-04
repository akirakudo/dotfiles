call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler'
Plug 'posva/vim-vue'
Plug 'w0ng/vim-hybrid'

call plug#end()

filetype plugin off

set background=dark
colorscheme hybrid

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
set cursorline
hi clear CursorLine

"clipboardを使用
set clipboard+=unnamed

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! MultiByteSpace()
  highlight MultiByteSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup MultiByteSpace
    autocmd!
    autocmd ColorScheme       * call MultiByteSpace()
    autocmd VimEnter,WinEnter * match MultiByteSpace /　/
  augroup END
  call MultiByteSpace()
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
