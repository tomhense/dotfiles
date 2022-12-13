set mouse=a " Enable Mouse

"if exists(':GuiFont')
"	GuiScrollBar 1 
"endif

"if exists(':GuiWindowMaximized')
"	GuiWindowMaximized 1
"endif
"
if exists(':GuiTabline')
	GuiTabline 0
endif

" Toggle file explorer bar
"nmap <F3> :GuiTreeviewToggle<CR>

" Enable adjusting fontsize with mouse wheel
let s:fontsize = 10
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Source Code Pro:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
"inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
"inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
noremap <C-=> :call AdjustFontSize(1)<CR>
noremap <C--> :call AdjustFontSize(-1)<CR>

:call AdjustFontSize(0)
