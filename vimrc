"#pathogen 
execute pathogen#infect()

"set mouse=a
"#file type
filetype on
filetype plugin on
filetype indent on

"#Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"#set highlight
syntax on
set hlsearch

"#show line number
set nu

"#color scheme
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
"colorscheme eclipse

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

"#set NERDTree 
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
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
"autocmd WinEnter * call NERDTreeQuit() "auto quit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * NERDTree "auto open
autocmd VimEnter * wincmd p
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeAutoDeleteBuffer=1
" let NERDTreeShowHidden=1
" let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc']

"#set tarbar
autocmd VimEnter * nested :TagbarOpen "auto open
nmap <F8> :TagbarToggle<CR>
"let tagbar_left=1 
let tagbar_width=32 
let g:tagbar_compact=1

"set minibufexplorer
let g:miniBufExplBuffersNeeded = 0
