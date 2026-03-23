" Load plugins from ~/.vim/bundle/
call pathogen#infect()

syntax on

set visualbell
" Disable the terminal visual bell flash entirely
set t_vb=
" Allow left/right movement keys to wrap to the previous/next line
set whichwrap+=>,l,<,h
" Store swap files centrally; // causes full path encoding to avoid name collisions
set directory=$HOME/.vim/swapfiles//
" set ruler
" set number
" set nu!
" set smartindent
" Prompt to save unsaved changes instead of refusing to quit
set confirm
set spell
" Keep at least 7 lines visible above and below the cursor (scrolloff)
set so=7
set tabstop=2
set shiftwidth=2
set expandtab
set background=dark
colorscheme solarized

" Always show the status line (default only shows with split windows)
set laststatus=2

set textwidth=90
" Highlight the column just past textwidth as an overflow indicator
set colorcolumn=+1
au FileType gitcommit set textwidth=72

" let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
" let g:airline_section_x = airline#section#create_right(['tagbar'])
" Hide the file encoding section from the status line
let g:airline_section_y = ''

" Prepend ctrlp to runtimepath so it's found before any system-wide version
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist\|coverage'

" Prettier code formatter
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'

au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.tsx set filetype=typescript
au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
au BufNewFile,BufRead *.js.ejs set filetype=javascript
au BufNewFile,BufRead *.json.ejs set filetype=json
au BufNewFile,BufRead *.ts.ejs set filetype=typescript

au BufNewFile,BufRead *.nginx,nginx.conf set filetype=nginx

" Populate new files with a template matching the filetype (silently skips if none exists)
au BufNewFile * :silent! exec ":0r ".$HOME."/.vim/templates/".&ft
au BufNewFile .babelrc :silent! exec ":0r ".$HOME."/.vim/templates/.babelrc"
au BufNewFile .prettierrc :silent! exec ":0r ".$HOME."/.vim/templates/.prettierrc"
au BufNewFile package.json :silent! exec ":0r ".$HOME."/.vim/templates/package.json"
au BufNewFile webpack.config.js :silent! exec ":0r ".$HOME."/.vim/templates/webpack.config.js"

" Strip trailing white space on save
au FileType javascript,typescript,css,scss,sql,html,markdown au BufWritePre <buffer> StripWhitespace

" filetype plugin indent on
" filetype plugin on
" Enable built-in syntax-based omni-completion as a fallback
set omnifunc=syntaxcomplete#Complete

" Exit insert mode by typing jj quickly
:imap jj <Esc>
" Split the window vertically with vv
nnoremap <silent> vv <C-w>v
" Yank to the system clipboard in visual mode
xnoremap y "*y

" Format as JSON
nnoremap <C-j> :%!jq .<CR>

" Highlight search results
set hlsearch
" Map escape to turn off search highlighting
nnoremap <silent> <leader>/ :nohlsearch <CR>

" au vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
" Remove the buffer when a file is deleted or renamed in NERDTree
let NERDTreeAutoDeleteBuffer = 1
" Keep NERDTree open after opening a file
let NERDTreeQuitOnOpen = 0
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

" Show absolute line numbers when the window loses focus (easier to reference)
:au FocusLost * :set number
" Show relative line numbers when focused (easier for jump commands)
:au FocusGained * :set relativenumber
" End: line number management

" Follow file paths without extensions
augroup suffixes
  autocmd!

  let fileTypeToExtensions = {
    \'javascript': '.js,.jsx,.json',
    \'typescript': '.ts,.tsx'
  \}

  for [fileType, extensions] in items(fileTypeToExtensions)
    execute 'autocmd FileType ' . fileType . ' setlocal suffixesadd=' . extensions
    " unlet is required to reuse loop variables across iterations in Vimscript
    unlet fileType extensions
  endfor
augroup END

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
