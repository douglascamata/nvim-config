" Move between buffers with Control + {l|j|k|h|}
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j
nnoremap <silent> <leader>fd :bp\|bd#<cr>

" Split buffers with Leader+{v|h}
nnoremap <silent> <Leader>v :vsplit<cr>
nnoremap <silent> <Leader>h :split<cr>

" Move between buffers
nnoremap <silent> { :bp<cr>
nnoremap <silent> } :bn<cr>

" Tab management
nnoremap <silent> th :tabfirst<CR>
nnoremap <silent> tj :tabnext<CR>
nnoremap <silent> tk :tabprev<CR>
nnoremap <silent> tl :tablast<CR>

" Resize splits with arrow keys
nnoremap <silent> <Up> :res +3<CR>
nnoremap <silent> <Down> :res -3<CR>
nnoremap <silent> <Left> :vertical res -3<CR>
nnoremap <silent> <Right> :vertical res +3<CR>
nnoremap <silent> = :winc =<CR>

" Improved scrolling credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

"" Terminal stuff
command! -nargs=* T :split | :terminal <args>
command! -nargs=* VT :vsplit | :terminal <args>
nnoremap <silent> <Leader>eth :T<CR>
nnoremap <silent> <Leader>etv :VT<CR>

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
nmap <silent> <leader>d <Plug>DashSearch

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

" Vim Fugitive
nnoremap <silent> <Leader>gs :Gstatus<CR>

" Manual rippertags
nmap <silent> <Leader>rt :silent call RipperTags()<cr>

" EasyAlign
xmap ga <Plug>(EasyAlign)
