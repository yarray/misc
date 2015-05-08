set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove toolbar

" gvim display modes
" ==================
" This will affect globally, so auto settings are hard to implement,
" change them manually instead

" Normal
" -------
" set guifont=Input\ Mono\ Light\ 10
" colorscheme solarized

" Writing
" -------
set guifont=CMU\ Typewriter\ Text\ Ultra-Light\ 16
set linespace=11
colorscheme pencil


" goyo
" ----
function! s:goyo_enter()
    " linux has no perfect full screen solution here,
    " so we should manually maximize window manually first
    if has("gui_macvim")
        set fullscreen
    endif
    Limelight
endfunction

function! s:goyo_leave()
    Limelight!
endfunction

autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()
