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

"#highlight
syntax on
set cursorline
set hlsearch

"#line number
set nu

"#color scheme
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
"colorscheme eclipse

"---------------
"auto complete
"---------------
"brackets and symbols 
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

"---------------
"shortcut
"---------------
"comment python 
nnoremap <leader>3 ^i#<Esc><CR>
vnoremap <leader>3 ^I#<Esc><CR>
nnoremap <leader>' O"""<Esc><CR>

"TODO,FIXME,NOTE 
nnoremap <leader>t O#TODO:
nnoremap <leader>f O#FIXME:
nnoremap <leader>n O#NOTE:

"cursor back to main(middle) window
nmap <leader>w :3 wincmd w<CR>

"paste mode 
:set pastetoggle=<F9>


"---------------
"NERDTree
"---------------
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
autocmd WinEnter * call NERDTreeQuit() 
"auto-quit for vim7.4
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

"auto open
autocmd VimEnter * NERDTree 
autocmd VimEnter * wincmd p

"open shortcut
nmap <F7> :NERDTreeToggle<CR>

"others
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc', '\.pyo']

"---------------
"tagbar
"---------------
"auto open
autocmd FileType c,cpp,python nested :TagbarOpen

"open shortcut
nmap <F8> :TagbarToggle<CR>

"others
let tagbar_width=32 
let g:tagbar_compact=1
let g:tagbar_sort = 0

"---------------
"minibufexplorer
"---------------
let g:miniBufExplBuffersNeeded = 0

"---------------
"powerline(statusline)
"---------------
let g:Powerline_colorscheme='solarized256'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_stl_path_style = 'full'

"---------------
"autopep8
"---------------
"open shortcut
map <F6> :call FormartSrc()<CR>
func FormartSrc()
    exec "w"
    if &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    endif
    exec "e! %"
endfunc
