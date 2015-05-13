set nocompatible

set nobackup
" undo even after quitting
set undofile
" just use /tmp since there's no need to undo that much
set undodir=/tmp/
set encoding=utf-8
" columns to display tab 
set tabstop=4
" columns inserted when hitting tab
set softtabstop=4
" columns when indenting or >
set shiftwidth=4
" <tab> and <bs> with shiftwidth
set smarttab
" expand tab to spaces
set expandtab
" related row number to ease jumping
set rnu
" show absolute row number for current line
set number
" turn off modeline for security
set modelines=0
set showmode
" show running command and other informations
set showcmd
set nocursorline
" backspace can delete indent, eol, start (just like in other apps)
set backspace=indent,eol,start
" show rows and columns
set ruler
" filter as you type
set incsearch
set hlsearch
" indent as the last line when no available rules
set autoindent
" bash-like command menu behavior
set wildmenu
set wildmode=list:longest,full
" change leader to easier pressed one
let mapleader="\<space>"

" Plugins
" ==========

filetype off

let BUNDLE = '~/.vim/bundle'

" set the runtime path to include Vundle and initialize
let &rtp .= ',' . BUNDLE . '/Vundle.vim/'
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" General essentials
" ------------------
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'rking/ag.vim'
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'

" Web essentials
" --------------
"   Integrates with YCM and goto def and more
Bundle 'marijnh/tern_for_vim'
"   For no perfect js indent plugin, but it can do much more
Bundle 'Chiel92/vim-autoformat'
Bundle 'mattn/emmet-vim'

" Python essentials
" -----------------
Bundle 'hynek/vim-python-pep8-indent'

" Writing essentials
" ------------------
Bundle 'plasticboy/vim-markdown'
Bundle 'lervag/vimtex'
Bundle 'junegunn/goyo.vim'
Bundle 'reedes/vim-pencil'
Bundle 'reedes/vim-lexical'

" Tools
" -----
Bundle 'Lokaltog/vim-easymotion'
Bundle 'junegunn/limelight.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'derekwyatt/vim-fswitch'

" new plugins here...

" themes
Bundle 'reedes/vim-colors-pencil'
Bundle 'altercation/vim-colors-solarized'
"
" bundles end

" Plugin settings
" ======================

" ctrlp
" -----
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NERDTree
" --------
nnoremap - :NERDTreeToggle<CR>

" syntastic
" ---------
let g:syntastic_mode_map = { "mode": "active",
                               \ "passive_filetypes": ["text", "python"] }
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_javascript_checkers = ["jshint"]
map <F3> :SyntasticCheck<CR>

" YCM
" ---
let g:ycm_key_list_select_completion = ["<c-cr>", "<down>"]
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set cmdheight=2  " avoid annoying error messages
let g:ycm_confirm_extra_conf = 0

au FileType cpp,c noremap <buffer> <C-S-]> :YcmCompleter GoTo<CR>

" Ultisnips
" ---------
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" tagbar
" ------
noremap <leader>- :Tagbar<CR>
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
    \ ]
\ }

" easytags
" --------
set tags=./tags
let g:easytags_dynamic_files = 1
let g:easytags_suppress_report = 1

" tern
" ----
au Filetype javascript nnoremap <C-]> :TernDef<CR>

" Autoformat
" ----------
" The js indenters are so broken that I have to do this
au FileType javascript autocmd BufWritePre <buffer> silent Autoformat

" markdown
" --------
let g:vim_markdown_initial_foldlevel=1

" vimtex
" ------
let g:tex_flavor = "latex"
" too disturbing
let g:vimtex_quickfix_ignore_all_warnings = 1

" goyo
" refer to .gvimrc to see distraction free mode
" ----------------
let g:goyo_rnu=1

" pencil & lexical
" ----------------
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
                            \ | call lexical#init()
  autocmd FileType tex call pencil#init({'wrap': 'soft'})
                            \ | call lexical#init()
augroup END

" EasyMotion
" ----------
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map <leader>f <Plug>(easymotion-s)

" fswitch
" -------
au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'


" Handcrafted
" ===========
" write using sudo when the file is not opened with root priviledges
command! -bar SudoWrite : setlocal nomodified | exe (has('gui_running') ? '' : 'silent') 'write !sudo tee % > /dev/null' | let &modified = v:shell_error


syntax on
filetype on
filetype plugin on
filetype indent on
