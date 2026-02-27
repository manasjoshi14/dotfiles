" Obsidian Vimrc
" Generated from ~/.vimrc

" Use system clipboard
set clipboard=unnamed

" Escape key mappings (C-j as Escape)
inoremap <C-j> <Esc>
nnoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" No arrow keys - force yourself to use the home row
nmap <up> <nop>
nmap <down> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Surround support (requires obsidian-vimrc-support plugin)
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" Map surround keys in visual mode
vmap s" :surround_double_quotes<CR>
vmap s' :surround_single_quotes<CR>
vmap s` :surround_backticks<CR>
vmap sb :surround_brackets<CR>
vmap s( :surround_brackets<CR>
vmap s) :surround_brackets<CR>
vmap s[ :surround_square_brackets<CR>
vmap s] :surround_square_brackets<CR>
vmap s{ :surround_curly_brackets<CR>
vmap s} :surround_curly_brackets<CR>
vmap s[[ :surround_wiki<CR>

" Navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Quickly remove search highlights
exmap nohlsearch obcommand editor:clear-highlight
nmap <Space>h :nohlsearch<CR>

" Focus on different panes
exmap focusRight obcommand editor:focus-right
exmap focusLeft obcommand editor:focus-left
exmap focusTop obcommand editor:focus-top
exmap focusBottom obcommand editor:focus-bottom
nmap <C-w>l :focusRight<CR>
nmap <C-w>h :focusLeft<CR>
nmap <C-w>k :focusTop<CR>
nmap <C-w>j :focusBottom<CR>

" Splits
exmap splitVertical obcommand workspace:split-vertical
exmap splitHorizontal obcommand workspace:split-horizontal
nmap <C-w>v :splitVertical<CR>
nmap <C-w>s :splitHorizontal<CR>

" Go to link (like gd in your vim config)
exmap followLink obcommand editor:follow-link
nmap gd :followLink<CR>

" Go back/forward
exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
nmap <C-o> :goBack<CR>
nmap <C-i> :goForward<CR>
