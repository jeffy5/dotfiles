function! DartIndent()
  " Default to cindent in most cases
  let indentTo = cindent(v:lnum)

  let previousLine = getline(prevnonblank(v:lnum - 1))
  let currentLine = getline(v:lnum)

  " Don't indent after an annotation
  if previousLine =~# '^\s*@.*$'
    let indentTo = indent(v:lnum - 1)
  endif

  " Don't indent after a comment
  if previousLine =~# '^\s*//.*$'
    let indentTo = indent(v:lnum - 1)
  endif

  " trying to fix the ); indent
  if currentLine =~# '^\s*);$'
    " let indentTo = indent(v:lnum - 1) - &shiftwidth
    let indentTo = indent(v:lnum - 1)
  endif

  " Indent after opening List literal
  if previousLine =~# '\[$' && !(currentLine =~# '^\s*\]')
    let indentTo = indent(v:lnum - 1) + &shiftwidth
  endif

  " Ident after opening parenthesis
  if previousLine =~# '($' && !(currentLine =~# '^\s*)')
    let indentTo = indent(v:lnum - 1) + &shiftwidth
  endif

  return indentTo
endfunction
