augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.rb set tabstop=2 softtabstop=2 shiftwidth=2 
    autocmd BufNewFile,BufRead *.html,*.css,*.scss syntax sync fromstart 
augroup END

augroup filetype_yaml
    autocmd!
    autocmd BufNewFile,BufRead *.yaml set tabstop=2 softtabstop=2 shiftwidth=2 
augroup END

augroup filetype_vue
    autocmd!
    autocmd BufNewFile,BufRead *.vue,*.wpy set filetype=vue 
    autocmd BufNewFile,BufRead *.vue,*.wpy syntax sync fromstart
    autocmd BufNewFile,BufRead *.vue,*.wpy set tabstop=2 softtabstop=2 shiftwidth=2 
augroup END

augroup filetype_python
    autocmd!
    autocmd BufNewFile,BufRead *.py nnoremap <leader>r :w<Enter>:!python3 %<CR>
    autocmd BufNewFile,BufRead *.py set tags+=/usr/local/lib/python3.5/dist-packages/tags
    autocmd BufNewFile,BufRead *.py set foldmethod=indent
augroup END

augroup filetype_ruby
    autocmd!
    autocmd BufNewFile,BufRead *.rb set tags+=/home/wjh/.rvm/gems/ruby-2.3.0/gems/tags
augroup END

augroup filetype_go
    autocmd!
    " autocmd BufNewFile,BufRead *.go nnoremap <leader>r :w<Enter>:!go run main.go<CR>
    " autocmd BufNewFile,BufRead *.go nnoremap <leader>u :w<Enter>:!go test -v ./...<CR>
    " autocmd BufNewFile,BufRead *.go set tags+=$GOLIB/src/tags
    " autocmd BufWritePre,FileWritePre *.go GoImports
augroup END

augroup filetype_javscript
    autocmd!
    autocmd BufNewFile,BufRead *.js nmap <leader>r :w<Enter>:!node %<CR>
    autocmd BufNewFile,BufRead *.js nmap <leader>u :w<Enter>:!npm run test-local<CR>
augroup END

function! RunCurrentJavaTest()
    exec ":!mvn test -Dtest=" . expand("%:t:r") . "Tests"
endfunction

augroup filetype_java
    autocmd!
    " autocmd BufNewFile,BufRead *.java setlocal omnifunc=javacomplete#Complete
    " autocmd BufWritePre,FileWritePre *.java call javacomplete#AddImport()
    autocmd BufNewFile,BufRead *.java nmap <leader>i <Plug>(JavaComplete-Imports-AddSmart)
    autocmd BufNewFile,BufRead *.java nmap <leader>n <Plug>(JavaComplete-Generate-Accessors)
    autocmd BufNewFile,BufRead *.java nmap <leader>c :!mvn clean install<CR>
    autocmd BufNewFile,BufRead *.java nmap <leader>u :call RunCurrentJavaTest()<CR>
    autocmd BufNewFile,BufRead *.java nmap <leader>uu :!mvn test<CR>
    autocmd BufNewFile,BufRead *.java nmap <leader>r :!mvn spring-boot:run<CR>
    " autocmd BufWritePost *.java exec ":!ctags -R ."
augroup END

augroup filetype_kotlin
    autocmd!
    autocmd BufNewFile,BufRead *.kt set filetype=kotlin
augroup END

augroup filetype_dart
    autocmd!
    autocmd BufRead,BufNewFile,BufEnter *.dart UltiSnipsAddFiletypes dart-flutter
augroup END

augroup filetype_typescript
    autocmd!
    autocmd BufNewFile,BufRead *.ts,*.tsx set tabstop=2 softtabstop=2 shiftwidth=2 
augroup END
