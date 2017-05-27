
%s+\s\+$++ge
%s+“\(\_.\{-}\)”+「\1」+ge
%s+‘\(\_.\{-}\)’+『\1』+ge
%s+(\(\_.\{-}\))+（\1）+ge
%s+,+，+ge

if has('autocmd')
    au BufReadPost *.tex syn match Comment "\\footnote{\_.\{-}}%"
    au BufReadPost *.tex syn match Keyword "% %% Jy\_.\{-}\n\n"
endif

