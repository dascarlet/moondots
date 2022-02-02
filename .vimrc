" エンコーディング
set encoding=utf-8

" 構文ごとに色分け
syntax on

" 行番号表示
set number

" タブを空白にする
set expandtab

" tabのスペース数
set tabstop=2

" 改行時に自動インデント
set autoindent

" 改行したら一段深くインデント
set smartindent

" インデントの空白数 （自動挿入）
set shiftwidth=2

" インデントの空白数（tabを押した時）
set softtabstop=2

" 256色モード
set t_Co=256

" カーソル行をハイライトする
set cursorline

" マウス有効
set mouse=a

" 改行時インデント継続
set autoindent

" emacs key bind
noremap <C-a> <HOME>
noremap <C-e> <END>
noremap <C-p> <UP>
noremap <C-n> <DOWN>
noremap <C-b> <LEFT>
noremap <C-f> <RIGHT>

" 各ファイルごとの設定
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

" ペーストするときにインデントずれを防ぐ
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
