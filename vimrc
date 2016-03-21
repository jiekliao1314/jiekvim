"#pathogen 
execute pathogen#infect()

"#file type
filetype on
filetype plugin on
filetype indent on

"#Tabstops 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"#set highlight
syntax on
set cursorline
set hlsearch

"#show line number
set nu

"#color scheme
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
"colorscheme eclipse

"set bracket and symbol auto-complete
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

"simple auto-comment for python 
nnoremap <leader>3 ^i#<Esc><CR>
nnoremap <leader>' O"""<Esc><CR>

"todo,fixme,note auto-comment
nnoremap <leader>t O#TODO:
nnoremap <leader>f O#FIXME:
nnoremap <leader>n O#NOTE:

"-----------------------
"plugins
"-----------------------

"#set NERDTree 
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0
  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)
    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor
  if (!windowfound)
    quitall
  endif
endfunction

"auto-quit for vim7.3
"autocmd WinEnter * call NERDTreeQuit() 

"auto-quit for vim7.4
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

"auto-open
autocmd VimEnter * NERDTree 
autocmd VimEnter * wincmd p
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc', '\.pyo']

"#set tagbar
autocmd FileType c,cpp,python nested :TagbarOpen
nmap <F8> :TagbarToggle<CR>
let tagbar_width=32 
let g:tagbar_compact=1
let g:tagbar_sort = 0

"set minibufexplorer
let g:miniBufExplBuffersNeeded = 0

"set powerline(statusline)
let g:Powerline_colorscheme='solarized256'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_stl_path_style = 'full'

"#set autopep8
map <F6> :call FormartSrc()<CR>
func FormartSrc()
    exec "w"
    if &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    endif
    exec "e! %"
endfunc
