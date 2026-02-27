" Ctrl-a c = new tab
nnoremap <C-a>c :tabnew<CR>
" Ctrl-a n = next
nnoremap <C-a>n gt
" Ctrl-a p = prev
nnoremap <C-a>p gT
" Ctrl-a 1-9 = go to tab
nnoremap <C-a>1 1gt
nnoremap <C-a>2 2gt
nnoremap <C-a>3 3gt
nnoremap <C-a>4 4gt
nnoremap <C-a>5 5gt
" Ctrl-a & = close
nnoremap <C-a>& :tabclose<CR>
" Ctrl-a % = vertical split
nnoremap <C-a>% :vsplit<CR>
" Ctrl-a " = horizontal split
nnoremap <C-a>" :split<CR>
" Ctrl-a h/j/k/l = move between splits
nnoremap <C-a>h <C-w>h
nnoremap <C-a>j <C-w>j
nnoremap <C-a>k <C-w>k
nnoremap <C-a>l <C-w>l

" Session file location
let g:session_file = expand('~/.vim/macvim_session.vim')

" Auto-save session on quit
autocmd VimLeavePre * execute 'mksession!' g:session_file

" Auto-restore session on start
autocmd VimEnter * nested
  \ if filereadable(g:session_file) |
  \   execute 'source' g:session_file |
  \   if argc() > 0 |
  \     execute 'edit' argv(0) |
  \   endif |
  \ endif

