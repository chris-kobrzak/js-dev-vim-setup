execute pathogen#infect()

syntax on

set visualbell
set whichwrap+=>,l,<,h
set directory=$HOME/.vim/swapfiles//
" set ruler
" set number
" set nu!
" set smartindent
set confirm
set so=7
set tabstop=2
set shiftwidth=2
set expandtab
set background=dark
set colorcolumn=+1
colorscheme solarized

set laststatus=2

set textwidth=90
au FileType gitcommit set textwidth=72

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

" Prettier code formatter
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'

au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
au BufNewFile,BufRead *.js.ejs set filetype=javascript
au BufNewFile,BufRead *.json.ejs set filetype=json
au BufNewFile,BufRead *.ts.ejs set filetype=typescript

au BufNewFile,BufRead *.nginx,nginx.conf set filetype=nginx

au BufNewFile * :silent! exec ":0r ".$HOME."/.vim/templates/".&ft
au BufNewFile .babelrc :silent! exec ":0r ".$HOME."/.vim/templates/.babelrc"
au BufNewFile .prettierrc :silent! exec ":0r ".$HOME."/.vim/templates/.prettierrc"
au BufNewFile package.json :silent! exec ":0r ".$HOME."/.vim/templates/package.json"
au BufNewFile webpack.config.js :silent! exec ":0r ".$HOME."/.vim/templates/webpack.config.js"

" Strip trailing white space on save
au FileType javascript,typescript,css,scss,sql,html,markdown au BufWritePre <buffer> StripWhitespace

:imap jj <Esc>
nnoremap <silent> vv <C-w>v
xnoremap y "*y

" Highlight search results
set hlsearch
" Map escape to turn off search highlighting
nnoremap <silent> <leader>/ :nohlsearch <CR>

" au vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 50

" Toggle line number management
function! LineNumberToggle()
  if (&relativenumber == 0 && &number == 0)
    set norelativenumber
    set number
  elseif (&number == 1)
    set nonumber
    set relativenumber
  else
    set norelativenumber
    set nonumber
  endif
endfunc

nnoremap <C-l> :call LineNumberToggle()<CR>

:au FocusLost * :set number
:au FocusGained * :set relativenumber
" End: line number management

" Display buffer list in the alphabetical order
command! -bang Ls redir @" | silent ls<bang> | redir END | echo " " |
 \ perl {
 \   my $msg=VIM::Eval('@"');
 \   my %list=();
 \   my $key, $value;
 \   while($msg =~ m/(.*?line\s+\d+)/g) {
 \     $value = $1;
 \     $value =~ m/"([^"]+)"/;
 \     $key = $1;
 \     $list{$key} = $value;
 \   }
 \   my $msg = '';
 \   for $key (sort keys %list) {
 \     $msg .= "$list{$key}\n";
 \   }
 \   VIM::Msg($msg);
 \ }
 \ <CR>
