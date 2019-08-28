let g:quickfix_is_open = 0
function! QuickFixToggle()
	if g:quickfix_is_open
		ma
		cclose
		let g:quickfix_is_open = 0
	else
		copen
		let g:quickfix_is_open = 1
	endif
endfunction
