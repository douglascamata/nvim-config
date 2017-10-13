function! RSpecPosition()
  let line = line('.')
  let command = "bin/rspec %:" . line
  call neoterm#do(command)
  call neoterm#map_for(command)
endfunction

command! TRspecFile :Trunmap bin/rspec %
nnoremap <LocalLeader>tf :TRspecFile<CR>
nnoremap <LocalLeader>tp :call RSpecPosition()<CR>

"" Ruby tags with ripper-tags
function! RipperTags()
  call jobstart('ripper-tags -R --exclude vendor --exclude .bundle')
endfunction

function! RipperTagsIfGemfile()
  if filereadable('Gemfile')
    call RipperTags()
  endif
endfunction

autocmd BufWritePost *.rb call RipperTagsIfGemfile()
" Manual rippertags
nmap <silent> <Leader>rt :silent call RipperTags()<cr>
