"#pathogen 
execute pathogen#infect()

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

"#syntax highlight
syntax on

"#show line number
set nu

"#color scheme
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
"colorscheme eclipse

"#set tarbar
"let tagbar_left=1 
"nnoremap <Leader>tl :TagbarToggle<CR> 
nmap <F8> :TagbarToggle<CR>
let tagbar_width=32 
let g:tagbar_compact=1

"#set NERDTree 
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
" let NERDTreeShowHidden=1
" let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

"#set autopep8
map <F6> :call FormartSrc()<CR>

"define FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    endif
    exec "e! %"
endfunc
""end FormartSrc
