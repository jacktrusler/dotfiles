" ----------------------------
" Variables
" ----------------------------
set nu
set tabstop=2 softtabstop=2
set scrolloff=8
set shiftwidth=2
set expandtab
set smartindent
set exrc
set guicursor=
set hidden
set relativenumber
set incsearch
set nohlsearch
set termguicolors
set mouse=a

" ----------------------------
" Status Line 
" ----------------------------
  set laststatus=2                             " always show statusbar  
  set statusline=  
  set statusline+=%-4.3n\                      " buffer number  
  set statusline+=%f\                          " filename   
  set statusline+=%h%m%r%w                     " status flags  
  set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
  set statusline+=%=                           " right align remainder  
  set statusline+=0x%-8B                       " character value  
  set statusline+=%-14(%l,%c%V%)               " line, character  
  set statusline+=%<%P                         " file position  

colorscheme elflord

" ----------------------------
" Remaps
" ----------------------------
let mapleader = " "
" Normal Mode
nnoremap <leader>V :Vexplore<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>S :Sexplore<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>edit :vsplit $MYVIMRC<CR>
nnoremap <leader>D :bd<CR>
nnoremap <leader>d :bp \| sp \| bn \| bd<CR>
nnoremap <leader>term :bel 12 split \| term <CR>

" Visual Mode
vnoremap <leader>p "_dP
vnoremap <leader>Y "+y
vnoremap <leader>y ygv<Esc>

" Command Mode
cnoremap %% <C-R>=expand('%:h').'/'<CR> 

" Terminal Mode
tnoremap qq <C-\><C-N>
tnoremap quit <C-\><C-N><C-W>k
