execute pathogen#infect()
syntax on
set number
set hlsearch
set virtualedit=onemore
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set cindent
set ruler
set smartcase
set ignorecase
set laststatus=2
set incsearch
"set autochdir
set mouse=a
set runtimepath^=~/.vim/bundle/ctrlp.vim
set switchbuf+=usetab,newtab
"set tags=tags;
let python_highlight_all = 1
let g:unite_source_grep_command='silent ag'
let g:airline_theme='luna'
let &t_Co=256
nnoremap <silent> <F3> :Ag<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :NERDTreeToggle<CR>
let mapleader = "\<Space>"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader><PageUp> :tabprevious<CR>
noremap <leader><PageDown> :tabnext<CR>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
colo elflord
"setlocal foldmethod=indent
"set foldlevel=2

source ~/.vim/mswin.vim
behave mswin

set shell=/bin/bash

let g:ctrlp_prompt_mappings = {
       \ 'AcceptSelection("e")': ['<c-t>'],
       \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
       \ }

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "1"

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>c :call ToggleList("Quickfix List", 'c')<CR>
noremap q1 :q!<CR>
