language en_US
"
" Vundle config
"
set nocompatible
set termguicolors

call plug#begin('~/.config/nvim/plugged')

Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'rizzatti/dash.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'morhetz/gruvbox'
Plug 'dag/vim-fish'
Plug 'ddollar/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rails'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'benmills/vimux'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'skwp/vim-rspec', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'slim-template/vim-slim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elixir-lang/vim-elixir', { 'for': 'ruby' }

call plug#end()

filetype plugin indent on
"
" plug end
"

set lazyredraw
syntax enable
set encoding=utf-8
set showcmd
let mapleader="\<Space>"
set cursorline
set splitright

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

"" Whitespace
set wrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set breakindent
set list

" List chars
set listchars=""          " Reset the listchars
set listchars=tab:\ \     " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.    " show trailing spaces as dots
set listchars+=nbsp:·     " show a middle-dot for non-breakable spaces
set listchars+=extends:>  " The character to show in the last column when wrap is
                          " off and the line continues beyond the right of the screen
set listchars+=precedes:< " The character to show in the last column when wrap is
                          " off and the line continues beyond the left of the screen

" Always edit file, even when swap file is found
set shortmess+=A
set hidden                         " Don't abandon buffers moved to the background
set wildmenu                       " Enhanced completion hints in command line
set backspace=eol,start,indent     " Allow backspacing over indent, eol, & start
set complete=.,w,b,u,U,t,i,d       " Do lots of scanning on tab completion
set directory=~/.config/nvim/swap  " Directory to use for the swap file
set diffopt=filler,iwhite          " In diff mode, ignore whitespace changes and align unchanged lines
set mouse=a

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

"" Undo
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
if has("persistent_undo")
  set undodir=~/.config/nvim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif

"" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :100 : up to 100 lines of command-line history will be remembered
"   n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:100,n~/.config/nvim/viminfo

"" Color
set background=dark
colorscheme gruvbox

"" Line numbers
set number
set ruler

"" No beep
set noeb vb t_vb=

"" Clipboard
set clipboard+=unnamedplus

"" Ruby tags with ripper-tags
function! RipperTags()
  call jobstart('ripper-tags -R --exclude vendor --exclude .bundle')
endfunction

function! RipperTagsIfGemfile()
  if filereadable('Gemfile')
    call RipperTags()
  endif
endfunction

nmap <silent> <Leader>rt :silent call RipperTags()<cr>
autocmd BufWritePost *.rb call RipperTagsIfGemfile()

" Move between buffers with arrow keys
nnoremap <silent> <Right> <c-w>l
nnoremap <silent> <Left> <c-w>h
nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j

" Split buffers with Leader+{v|h}
nnoremap <silent> <Leader>v :vsplit<cr>
nnoremap <silent> <Leader>h :split<cr>

" Buffer and project tags fuzzy search
nnoremap <silent> { :bp<cr>
nnoremap <silent> } :bn<cr>

" Resize splits with Control + arrow keys
nnoremap <silent> <C-Up> :res +3<CR>
nnoremap <silent> <C-Down> :res -3<CR>
nnoremap <silent> <C-Left> :vertical res -3<CR>
nnoremap <silent> <C-Right> :vertical res +3<CR>
nnoremap <silent> = :winc =<CR>

" Highlight curren tline only in the active pane
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

""
"" Wild settings (from Janus)
""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*
" Misc
set wildignore+=*.png,*.jpg,*.gif,*.jpeg,*/public/images/*,*/public/uploads/*,*/docker/bundle/*

" no balloon
" au BufNewFile,BufRead * set noballooneval

" always a status bar
set laststatus=2

""
"" Backup and swap files
""
set backupdir^=~/.vim/_backup//
set directory^=~/.vim/_temp//

""
"" Plugins
""

" NerdTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
map <Leader>/ :NERDTreeToggle<CR>
map <Leader>. :NERDTreeFind<CR>

"" fzf
" Project wide mappings
nnoremap <Leader>pf :FZF<cr>
nnoremap <Leader>pag :Ag<Space>
nnoremap <Leader>pt :Tags<CR>

" File wide mappings
nnoremap <Leader>ft :BTags<CR>


" Editor mappings
nnoremap <Leader>ew :Windows<CR>
nnoremap <Leader>es :Snippets<CR>
nnoremap <Leader>eb :Buffers<CR>
"" end of fzf

" Dash app
:nmap <silent> <leader>d <Plug>DashSearch

" vim-notes
:let g:notes_directories = ['~/Google Drive/vim-notes']

" IndentGuides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 30
let g:monster#completion#rcodetools#backend = "async_rct_complete"
set completeopt-=noselect
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('buffer', 'rank', 501)
call deoplete#custom#source('ultisnips', 'rank', 502)

" Deoplete code completion on tab
imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "<Down>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "<Up>"
"inoremap <expr> <ESC> pumvisible() ? deoplete#smart_close_popup() : "<ESC>"

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
