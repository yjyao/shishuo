
%s+\s\+$++ge
%s+“\(\_.\{-}\)”+「\1」+ge
%s+‘\(\_.\{-}\)’+『\1』+ge
%s+(\(\_.\{-}\))+（\1）+ge
%s+,+，+ge

" remove whitespaces before chinese punctuations
" \S: 
"   something not whitespace to enssure that the spaces are not indentation
" \zs\s\+\ze: 
"   the whitespaces to be removed
" \(...\): 
"   make sure it is the whitespaces that are followed by chinese punctuations
"   that we are removing
%s+\S\zs\s\+\ze\(，\|。\|：\|「\|」\|『\|』\|（\|）\|？\|！\)++ge

if has('autocmd')
    au BufReadPost *.tex syn match Comment "\\footnote{\_.\{-}}%"
    au BufReadPost *.tex syn match Keyword "% %% Jy\_.\{-}\n\n"
endif

