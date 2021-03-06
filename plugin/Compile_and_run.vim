function! Compile_and_run()
     exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
   elseif &filetype == 'cs'
	   exec "AsyncRun! dotnet run <root>"
    elseif &filetype == 'python'
       exec "AsyncRun! -raw time python %"
    endif
endfunction

