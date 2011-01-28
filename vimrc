"pathogen setup
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"see vim-rails plugin doc [rails.txt]
set nocompatible
syntax on
filetype plugin indent on


" SHORTCUT KEY MAPPINGS """""""""""""""""""

"ctrl+alt+f for ack current word in command mode
map  :call AckGrep()<CR>
function! AckGrep()
  let command = "ack ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

"prev/next in quickfix file listing (e.g. search results)
map <M-D-Down> :cn<CR>
map <M-D-Up> :cp<CR>

"select open file, MRU sorted
map <D-e> :FufBuffer<CR>

"open file
map <D-N> :FufFile **/<CR>

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

"simple comment/uncomment visual selection with cmd+/
vmap <silent> <D-/> :call CommentOutLine()<CR>
function! CommentOutLine()
  let ext = expand("%:e")

  if ext == "rb" || ext == "sh"
    let comment_prefix = "#"
  elseif ext == "c" || ext == "cpp" || ext == "h" || ext == "h" || ext == "m" || ext == "mm"
    let comment_prefix = "//"
  endif
  let line = getline('.')
  let pattern = "^".comment_prefix
  if line =~ pattern
    call setline(".", substitute(line, pattern, "", ""))
  else
    call setline(".", substitute(line, "^", comment_prefix, ""))
  endif
endfunction

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e
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
set guioptions-=T

"font
set guifont=Monaco:h16

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
set showcmd
set ruler           " cursor position

" more search options
set hlsearch
set smartcase

