" vim:fileencoding=utf-8:foldmethod=marker

" Basic settings {{{
" --------------

" Don't try to be Vi compatible.
set nocompatible

" Use unicode encoding.
set encoding=utf-8

" Disable swap files.
set noswapfile

" Show line numbers and jump numbers.
set number relativenumber

" Disable the annoying bell.
set belloff=all vb t_vb=

" Allow backspace to work before insert point.
set backspace=indent,eol,start

" Go to matching text while searching.
set incsearch
" Search case insensitive when search pattern only has lowercase letters.
" When an uppercase letter is put in the pattern, search case sensitive.
set ignorecase smartcase

" Provide context lines above and below cursor.
set scrolloff=4

" Insert spaces insteads of tabs.
set expandtab
" Amount of spaces to use to display and insert a tab character. Think of this
" setting as the 'size of the tab', either when it's expaned into spaces and
" when an actual tab character is placed.
set tabstop=2
" Preserve the indentin of the current line when creating new lines, and mind the
" syntax of the current language when deciding to perfom some auto indentation.
" Notice that 'shiftwidth=0' makes auto indenting use the size defined by 'tabstop'.
set autoindent
set smartindent
set shiftwidth=0

" Create window splits in more comfortable positions.
set splitright splitbelow

" Use PowerShell as the shell.
set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

" Enable mouse interaction.
set mouse=a

" }}}

" Basic remappings {{{
" ----------------

" Spacebar as mapleader.
nnoremap <Leader> <Nop>
let mapleader=" "

" By default, yank/paste/delete using the OS clipboard.
nnoremap y "+y
nnoremap Y "+Y
vnoremap y "+y
nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
nnoremap d "+d
nnoremap D "+D
vnoremap d "+d
" Allow normal use of yank/paste/delete by prefixing space.
nnoremap <Leader>y y
nnoremap <Leader>Y Y
vnoremap <Leader>y y
nnoremap <Leader>p p
nnoremap <Leader>P P
vnoremap <Leader>p p
nnoremap <Leader>d d
nnoremap <Leader>D D
vnoremap <Leader>d d

" Enter block visual mode easily.
nnoremap Q <C-q>

" Use Y to yank up to the end of the line.
nnoremap Y yg_

" More comfortable scrolling.
nnoremap <C-u> 8<C-u>
nnoremap <C-d> 8<C-d>

" More comfy scrolling through search matches.
nnoremap n :set hlsearch<CR>nzz
nnoremap N :set hlsearch<CR>Nzz

" Move lines up or down.
vnoremap <C-k> :m '<-2<CR>gv
nnoremap <C-k> :m .-2<CR>
vnoremap <C-j> :m '>+1<CR>gv
nnoremap <C-j> :m .+1<CR>

function! InvokeCrNormalMode()
  " Buffers in which CR behaves normally.
  let l:normalCrBuffers = {
    \ '[Command Line]': '',
  \}
  if has_key(l:normalCrBuffers, bufname('%'))
    exe "normal! \<CR>"
  else
    exe "normal! v\<ESC>o\<ESC>gv\<ESC>"
  endif
endfunction

" Add empty line below/above cursor with Enter/<Leader>Enter
nnoremap <CR> :call InvokeCrNormalMode()<CR>
nnoremap <Leader><CR> v<ESC>O<ESC>gv<ESC>
vnoremap <CR> <ESC>'>o<ESC>gv
vnoremap <Leader><CR> <ESC>'<O<ESC>gv

" Delete current line without leaving normal mode.
nnoremap <BS> :s/.*//<CR>

" Break line at cursor position using <Leader>+s.
nnoremap <Leader>s i<CR><ESC>

" Repeat last command-line command easily.
nnoremap <C-p> @:

" Select all contents in the file.
nnoremap <Leader>a ggVG

" Keep flags when repeating last substitution.
nnoremap & :&&<CR>

" Stay on current word when loading search criteria with word under cursor
" using *. (The default behavior is to jump to the next match).
nnoremap * *``

" Remove search highlighting.
nnoremap <C-l> :set nohlsearch<CR>

" }}}

" GUI-only settings {{{
" -----------------
" Easily resize the guifont.

if has("gui_running")

  " GUI font and line spacing.
  set guifont=Iosevka\ NF:h10
  set linespace=4

  " Window initial size.
  set lines=25
  set columns=120

  " Remove toolbar and menubar.
  set guioptions-=T
  set guioptions-=m

  " Remove scroll bars.
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b

  nnoremap <F9> :call FontSizeMinus()<CR>
  nnoremap <F10> :call FontSizePlus()<CR>
endif

" Credit goes to: https://vi.stackexchange.com/a/3104
if has("gui_gtk2")
  function! FontSizePlus ()
    let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole + 1
    let l:new_font_size = ' '.l:gf_size_whole
    let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
  endfunction
  function! FontSizeMinus ()
    let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole - 1
    let l:new_font_size = ' '.l:gf_size_whole
    let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
  endfunction
else
  function! FontSizePlus ()
    let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole + 1
    let l:new_font_size = ':h'.l:gf_size_whole
    let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
  endfunction
  function! FontSizeMinus ()
    let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole - 1
    let l:new_font_size = ':h'.l:gf_size_whole
    let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
  endfunction
endif

" }}}

" Colors & looks {{{
" --------------

" Enably syntax highlight.
syntax on

" Color scheme.
colorscheme darkblue

" }}}

