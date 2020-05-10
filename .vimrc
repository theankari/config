set nocompatible
set clipboard=unnamedplus
set timeoutlen=1000 ttimeoutlen=0

" ---- Vundle Plugins ----
filetype off
" Install plug manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source /home/aron/.vimrc
endif

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'tpope/vim-fugitive' "Git support for vim :Git
Plug 'airblade/vim-gitgutter'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/a.vim'
Plug 'jez/vim-superman'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete daemon
Plug 'ntpeters/vim-better-whitespace' " Highlight and strip trailing whitespace
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular' " Align CSV files at commas, align Markdown tables, and more
Plug 'ekalinin/Dockerfile.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx' " JSX support
Plug 'Galooshi/import-js' " Auto import for javascript
call plug#end()



filetype plugin indent on    " required
" Appearance {{{
    set number " show line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=… " show ellipsis at breaking
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical
    set laststatus=2 " show the satus line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink

    " Tab control
    set expandtab " insert tabs rather than spaces for <Tab>
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=2 " edit as if the tabs are 2 characters wide
    set shiftwidth=2 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪
	set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    " switch cursor to line when in insert mode, and block when not
     set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
     \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
     \,sm:block-blinkwait175-blinkoff150-blinkon175

                 if &term =~ '256color'
                 " disable background color erase
                    set t_ut=
                endif



"			  ----- Plugin-Specific Settings --------------------------------------
" Eslint for syntastic
let g:syntastic_javascript_checkers = ['eslint']
" Enable jsx syntax for other extensions
let g:jsx_ext_required = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" ------ CoC vim settings ---------
" Trigger and iterate with Tab

source $HOME/.vim/configs/plugins.vimrc


" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType java let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END
"
" Multicursor Mappings
"
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1
set <M-n>=n
set <M-a>=a
set <M-p>=p
set <M-x>=x
" Default mapping
let g:multi_cursor_start_word_key      = '<M-n>'
let g:multi_cursor_select_all_word_key = '<M-a>'
let g:multi_cursor_start_key           = 'g<M-n>'
let g:multi_cursor_select_all_key      = 'g<M-a>'
let g:multi_cursor_next_key            = '<M-n>'
let g:multi_cursor_prev_key            = '<M-p>'
let g:multi_cursor_skip_key            = '<M-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
" let g:nerdtree_tabs_open_on_console_startup = 1


set background=dark
set hidden
" Uncomment the next line if your terminal is not configured for solarized
" let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

let g:airline_powerline_fonts=1
let g:powerline_symbols = 'unicode'
let g:solarized_termtrans = 1

" Show PASTE if in paste mode
let g:airline_detect_paste = 1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
" let g:airline_theme='murmur'

"----------------------------------- FZF settings -----------------

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '20split' }




" Customize fzf colors to match your color scheme
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"
" " Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"------------------------------------------------------------
"
hi clear SignColumn
" set eventignore=all | bd | set eventignore=
" Iterate forward and backward trough buffers with ctrl-n bad ctrl-m

" switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

map <C-m> :bnext<CR>
map <C-n> :bprevious<CR>
map <C-w> :bd<CR>
" Map F5 to show and select from buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" Map F6 to show and vertically split buffer
nnoremap <F6> :buffers<CR>:vert belowright sb<Space>
" Map Ctrl-s to format code
nnoremap <C-s> gg=G``:w<CR>

" FZF Mappings
nnoremap <C-p> :Files<CR>
nnoremap <C-i> :Tags<CR>
nmap <silent> <leader>n :cp<CR>
nmap <silent> <leader>m :cn<CR>


nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1) <CR>

syntax on
set relativenumber

