"pathogen setup
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"see vim-rails plugin doc [rails.txt]
set nocompatible
syntax on
filetype plugin indent on


" SHORTCUT KEY MAPPINGS """""""""""""""""""
" shift + arrow keys to resize window
nnoremap <S-Up> <C-W>+
nnoremap <S-Down> <C-W>-
nnoremap <S-Left> <C-W><
nnoremap <S-Right> <C-W>>

"ctrl+alt+f for ack current word in command mode
map <C-M-f> :call AckGrep()<CR>
function! AckGrep()
  let command = "ack ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

"rake spec in a split conque term
map <M-C-D-R> :ConqueTermSplit rake spec<CR>

"bundle exec cucumber in a split conque term
map <M-C-D-C> :ConqueTermSplit bundle exec cucumber<CR>

"rake in a split conque term
map <D-R> :ConqueTermSplit rake<CR>

"prev/next in quickfix file listing (e.g. search results)
map <M-D-Down> :cn<CR>
map <M-D-Up> :cp<CR>

"opt-cmd-arrows [next & previous open files]
map <M-D-Left> :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

"Undo/Redo using undo tree with cmd-z/cmd-shift-z
map <D-z> :earlier 1<CR>
map <D-Z> :later 1<CR>

"file tree browser - backslash
map \ :NERDTreeToggle<CR>

"comment/uncomment visual selection with cmd+/
vmap <D-/> <plug>NERDCommenterToggle
"comment/uncomment current line with cmd+/
nmap <D-/> <plug>NERDCommenterToggle

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp,*.feature :%s/\s\+$//e
"rails
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml :%s/\s\+$//e
"misc
autocmd BufWritePre *.java,*.php :%s/\s\+$//e


" SETTINGS """"""""""""""""""""""""""""""""
if has("gui_macvim")
  set t_Co=256
  colorscheme vividchalk
endif

"Minibuf tab colors - must be set after colorscheme
"Changed + Hidden buffers
hi MBEChanged guibg=darkred ctermbg=darkred guifg=red ctermfg=red
"Changed + Visible buffers
hi MBEVisibleChanged guifg=darkred ctermfg=darkred

"Show whitespace, fullstops for trailing whitespace
set list
set listchars=trail:.

"Keep backup files somewhere else
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

"No swapfiles
set noswapfile

"no toolbar
set guioptions=-T
"no gui tab bar
set guioptions-=e

"no scrollbars
set guioptions-=rL

"font
set guifont=Inconsolata:h24

"history size
set history=1024

"incremental search
set incsearch

"no wrapping
set wrap!

"line numbers
set number

"always show statusline
set laststatus=2

"show matching brackets
set showmatch

"tab settings
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

set scrolloff=3

" Rayban & Peter
let mapleader = ","

" FuzzyFinder and switchback commands
map <leader>e :e#<CR>
map <leader>b :FufBuffer<CR>
map <leader>f :FufFile<CR>
map <leader><C-N> :FufFile **/<CR>
map <D-e> :FufBuffer<CR>
map <D-N> :FufFile **/<CR>

" search
map <leader>s :%s/

" Split screen vertically and move between screens.
map <leader>v :vsp<CR>
map <leader>w <C-W>w
map <leader>h <C-W>s
map <leader>= <C-W>=

" Move between horizontally split screens.
map <leader>j <C-W>j
map <leader>k <C-W>k

" AckGrep current word
map <leader>a :call AckGrep()<CR>

" set question mark to be part of a VIM word. in Ruby it is!
autocmd FileType ruby set isk=@,48-57,_,?,!,192-255

" Insert ' => '
autocmd FileType ruby imap <C-l> <Space>=><Space>

" reload .vimrc
map <leader>rv :source ~/.vimrc<CR>

" refresh the FuzzyFinder cache
map <leader>rf :FufRenewCache<CR>

" ctags again with gemhome added
map <leader>t :!/usr/local/bin/ctags -R --exclude=.git --exclude=log * `rvm gemhome`/*<CR>

" F7 reformats the whole file and leaves you where you were (unlike gg)
map <F7> mzgg=G'z :delmarks z<CR>


" Turn on Ruby folding but unfold when you open a new file because it's
" annoying
"let ruby_fold=1
"au BufAdd *.rb foldopen!

" Write all writeable buffers when changing buffers or losing focus.
autocmd FocusLost * silent! wall
set autowriteall

" Let unsaved buffers exist in the background.
set hidden

" Show typed command prefixes while waiting for operator.
set showcmd
set ruler           " cursor position

" more search options
set hlsearch
set smartcase
" Open reposh
map <C-G> :!reposh<CR>
map <C-A> :!gitx<CR><CR>
" In insert mode, use Cmd-<CR> to jump to a new line in insert mode, a la
" TextMate.
imap <D-CR> <ESC>o

" Find tag
map <D-˜> :FufTag<CR>
" Change background color when inserting.
let g:insert_mode_background_color = "#333333"
