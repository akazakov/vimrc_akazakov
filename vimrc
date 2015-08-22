" UI {{{
set colorcolumn=80
set modelines=1
set modeline
syntax enable	
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set showcmd " Show command
set cursorline 
filetype indent on
set wildmenu " Visual autocomplete for command menu
set wildmode=longest:full,full
set lazyredraw " redraw only when necessary
set showmatch " Highlight matching parenthesis
" highlight last inserted text
nnoremap gV `[v`]
map Q :qa<CR>
" }}}
" SEARHCHING  {{{
set hlsearch
set incsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" FOLDING {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}
" MOVING {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" }}}
" Laungage specific {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
  
 
" vim:foldmethod=marker:foldlevel=0
