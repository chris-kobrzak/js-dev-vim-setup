execute pathogen#infect()

syntax on

set whichwrap+=>,l,<,h
set directory=$HOME/.vim/swapfiles//
" set ruler
" set number
" set nu!
" set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set background=dark
set colorcolumn=80
colorscheme solarized

" filetype plugin indent on

" Strip trailing white space from JS files on save
autocmd FileType javascript,css,scss autocmd BufWritePre <buffer> StripWhitespace

autocmd BufNewFile * :silent! exec ":0r ".$HOME."/.vim/templates/".&ft
autocmd BufNewFile .babelrc :silent! exec ":0r ".$HOME."/.vim/templates/.babelrc"
autocmd BufNewFile package.json :silent! exec ":0r ".$HOME."/.vim/templates/package.json"
autocmd BufNewFile webpack.config.js :silent! exec ":0r ".$HOME."/.vim/templates/webpack.config.js"

" autocmd vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>

nnoremap <silent><f1> :jshint<cr>
inoremap <silent><f1> <c-o>:jshint<cr>
vnoremap <silent><F1> :JSHint<CR>

" Toggle line number management
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber
" End: line number management
