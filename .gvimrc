" remove distractions
if has("gui_macvim")
    set fullscreen
else
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove toolbar
endif

" switch input method to us in normal mode
set noimd
set imi=2
set ims=2

" gvim display modes
" ==================
" This will affect globally, so auto settings are hard to implement,
" change them manually instead

" Normal
" -------
" if has("gui_macvim")
"     set guifont=InputMono\ ExLight:h12
" else 
"     set guifont=Input\ Mono\ Light\ 10
" endif
" colorscheme solarized
" set background=dark

" Writing
" -------
if has("gui_macvim")
    set guifont=CMU\ Typewriter\ Text\ Light:h22
    set linespace=5
    let g:goyo_height='100%'
else
    set guifont=CMU\ Typewriter\ Text\ Ultra-Light\ 16
    set linespace=11
endif
colorscheme pencil


" goyo
" ----
function! s:goyo_enter()
    Limelight
endfunction

function! s:goyo_leave()
    Limelight!
endfunction

autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()
