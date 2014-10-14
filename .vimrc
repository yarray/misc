set nocompatible
set nobackup

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set rnu

set encoding=utf-8
set langmenu=en_US
let $LANG='en_US'

au BufCreate,BufRead,BufNew * :if ((&readonly==1)) || (&modifiable==0) | noremap <buffer> q :q<CR> | endif

set modelines=0
set showmode
set showcmd
set nocursorline
set hlsearch
set backspace=indent,eol,start
set ruler
set incsearch
set autoindent

nnoremap j gj
nnoremap k gk

command! -bar SudoWrite : setlocal nomodified | exe (has('gui_running') ? '' : 'silent') 'write !sudo tee % > /dev/null' | let &modified = v:shell_error

" Bundle
" ==========

filetype off

let BUNDLE = '~/.vim/bundle'

" set the runtime path to include Vundle and initialize
let &rtp .= ',' . BUNDLE . '/Vundle.vim/'
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

Bundle 'plasticboy/vim-markdown'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'chase/vim-ansible-yaml'
Bundle 'majutsushi/tagbar'
Bundle 'junegunn/goyo.vim'
" Bundle 'junegunn/limelight.vim' " focus mode, not very practical
Bundle 'mattn/emmet-vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'c.vim'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'yonchu/accelerated-smooth-scroll'
Bundle 'VOoM'
" Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex' " too big so many key conflict
Bundle 'LaTeX-Box-Team/LaTeX-Box'
" Bundle 'bling/vim-airline' " not useful for me
" Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'JavaScript-Indent'
" new plugins here...

" themes
Bundle 'reedes/vim-colors-pencil'
Bundle 'altercation/vim-colors-solarized'
"
" bundles end

" syntax
Bundle 'applescript.vim'


" writing
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj
  map k gk
  " map <F3> :setlocal spell! spelllang=en_us<CR> " now use language_check
  "set thesaurus+=/Users/yarray/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
  setlocal cursorline
  if has("gui_running")
    set guifont=Bitstream\ Vera\ Sans\ Mono:h15
    set guifontwide=Hiragino\ Sans\ GB:h15
    set lsp=5
    colorscheme pencil
  endif
endfu 

au FileType mkd,tex call WordProcessorMode()
au FileType mkd set filetype=mkd.text

" ======================
"
" syntastic
let g:syntastic_mode_map = { "mode": "active",
                               \ "passive_filetypes": ["text"] }
let g:syntastic_python_checkers = ["pylint", "pyflakes", "flake8"]
let g:syntastic_text_checkers = ["language_check"]
let g:syntastic_javascript_checkers = ["jshint"]

" let g:syntastic_text_checkers = ["atdtool"] " online slow
map <F3> :SyntasticCheck<CR> " now use language_check

" markdown
let g:vim_markdown_initial_foldlevel=1

" YCM
let g:ycm_key_list_select_completion = ["<cr>", "<down>"]
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
set cmdheight=2  " avoid annoying error messages
let g:ycm_confirm_extra_conf = 0

" Ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

au FileType cpp,c noremap <buffer> <C-]> :YcmCompleter GoTo<CR>

" Emmet
"let g:user_emmet_leader_key='<C-,>'

" NERDTree
nnoremap - :NERDTreeToggle<CR>

" tagbar
noremap <F7> :Tagbar<CR>

" applescript
au BufCreate,BufRead,BufNew *.applescript set filetype=applescript

" fswitch
au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'

" vim-latex
" let g:Tex_DefaultTargetFormat='pdf'
" let g:Tex_CompileRule_pdf = 'xelatex --aux-directory=/tmp/ --synctex=-1 -src-specials -interaction=nonstopmode $*'

" VOoM
let g:voom_tree_placement = "right"
let g:voom_tree_width = 50
au Filetype vim map <F7> VoOM
au Filetype mkd map <F7> :VoomToggle markdown<CR>
au Filetype tex map <F7> :VoomToggle latex<CR>

syntax on
filetype on
filetype plugin on
filetype indent on
