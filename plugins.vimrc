"" NeoTerm
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_autoscroll = 1
let g:neoterm_use_relative_path = 1
function! Neoterm_runmap(command)
  call neoterm#do(a:command)
  call neoterm#map_for(a:command)
endfunction

"" Don't load elm-vim mappings by default
let g:elm_setup_keybindings = 0

" vim-notes
let g:notes_directories = ['~/Google Drive/vim-notes']

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
