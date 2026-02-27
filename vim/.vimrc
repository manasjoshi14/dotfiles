" Plugin Manager
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'rust-lang/rust.vim'
"let g:WebDevIconsOS = 'Darwin'
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
"let g:DevIconsEnableFolderExtensionPatternMatching = 1
"let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
"let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
"Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-obsession'
"Plug 'nordtheme/vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'lervag/vimtex'

call plug#end()

colorscheme catppuccin_macchiato

" If colors still look off
if has('termguicolors')
  set termguicolors
endif

" Rust Stuff

let g:rustfmt_autosave = 1
" CoC essentials
let g:coc_global_extensions = ['coc-rust-analyzer']
set completeopt=menuone,noinsert,noselect
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap K  :call CocActionAsync('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)

" Diagnostics
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" Make :make use cargo (build errors go to quickfix)
set makeprg=cargo\ build
nnoremap <leader>m :make<CR>



let g:tex_flavor = 'latex'

" Lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'filename': '%<%{LightLineFilename()}' } 
      \ }
function! LightLineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

set laststatus=2
set noshowmode

syntax on

set relativenumber " Relative line numbers
set number " Also show current absolute line
set showcmd " Show (partial) command in status line.
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set nowrap
set clipboard=unnamed

" No arrow keys --- force yourself to use the home row
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <Esc>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" set mouse=v
" if !has('gui_running')
"   autocmd TextChanged,TextChangedI * silent! write
" endif

"colorscheme base16-gruvbox-dark-hard

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

" highlight CocFloating    ctermbg=235 ctermfg=223 guibg=#282828 guifg=#ebdbb2
" highlight CocMenuSel     ctermbg=239 ctermfg=214 guibg=#504945 guifg=#fabd2f
" highlight CocErrorFloat  ctermbg=235 ctermfg=167 guibg=#282828 guifg=#fb4934
" highlight CocWarningFloat ctermbg=235 ctermfg=214 guibg=#282828 guifg=#fabd2f
" highlight CocInfoFloat   ctermbg=235 ctermfg=109 guibg=#282828 guifg=#83a598
" highlight CocHintFloat   ctermbg=235 ctermfg=108 guibg=#282828 guifg=#8ec07c

" highlight Pmenu          ctermbg=235 ctermfg=223 guibg=#282828 guifg=#ebdbb2
" highlight PmenuSel       ctermbg=239 ctermfg=214 guibg=#504945 guifg=#fabd2f
" highlight PmenuSbar      ctermbg=237 guibg=#3c3836
" highlight PmenuThumb     ctermbg=243 guibg=#7c6f64


" CoC Popup Colors - must be at end of vimrc
" autocmd ColorScheme * call SetupCocColors()
" autocmd VimEnter * call SetupCocColors()

" function! SetupCocColors()
"     highlight CocFloating    ctermbg=235 ctermfg=223 guibg=#282828 guifg=#ebdbb2
"     highlight CocErrorFloat  ctermbg=235 ctermfg=167 guibg=#282828 guifg=#fb4934
"     highlight CocWarningFloat ctermbg=235 ctermfg=214 guibg=#282828 guifg=#fabd2f
"     highlight CocInfoFloat   ctermbg=235 ctermfg=109 guibg=#282828 guifg=#83a598
"     highlight CocHintFloat   ctermbg=235 ctermfg=108 guibg=#282828 guifg=#8ec07c
"     highlight CocMenuSel     ctermbg=239 ctermfg=214 guibg=#504945 guifg=#fabd2f
"     highlight CocSearch      ctermfg=214 guifg=#fabd2f
"     highlight Pmenu          ctermbg=235 ctermfg=223 guibg=#282828 guifg=#ebdbb2
"     highlight PmenuSel       ctermbg=239 ctermfg=214 guibg=#504945 guifg=#fabd2f
" endfunction

" " Inlay hints colors
" highlight CocInlayHint       ctermbg=237 ctermfg=243 guibg=#282828 guifg=#7c6f64
" highlight CocInlayHintType   ctermbg=237 ctermfg=108 guibg=#282828 guifg=#8ec07c
" highlight CocInlayHintParameter ctermbg=237 ctermfg=109 guibg=#282828 guifg=#83a598





" -------------------------------------------------------------------------------


