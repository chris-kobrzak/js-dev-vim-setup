execute pathogen#infect()

syntax on

:imap jj <Esc>

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

set laststatus=2
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
" let g:airline_section_x = airline#section#create_right(['tagbar'])
let g:airline_section_y = ''

" filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|coverage'

" Strip trailing white space from JS files on save
autocmd FileType javascript,css,scss autocmd BufWritePre <buffer> StripWhitespace

autocmd BufNewFile * :silent! exec ":0r ".$HOME."/.vim/templates/".&ft
autocmd BufNewFile .babelrc :silent! exec ":0r ".$HOME."/.vim/templates/.babelrc"
autocmd BufNewFile package.json :silent! exec ":0r ".$HOME."/.vim/templates/package.json"
autocmd BufNewFile webpack.config.js :silent! exec ":0r ".$HOME."/.vim/templates/webpack.config.js"

autocmd BufNewFile,BufRead *.ejs,*.hbs set filetype=html
autocmd BufNewFile,BufRead *.js.ejs set filetype=javascript
autocmd BufNewFile,BufRead *.json.ejs set filetype=json
autocmd BufNewFile,BufRead *.ts.ejs set filetype=typescript

" autocmd vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

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
