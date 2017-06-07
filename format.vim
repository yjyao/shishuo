
" strip trailing spaces
%s+\s\+$++ge

" convert english punctuations to chinese ones
let non_eng_prefix = '[^a-zA-Z0-9]\s*'
let digit_prefix = '\d\s*'
let start_pat='\zs'
let end_pat='\ze'
let replace_patterns = [ 
            \ [',', '，'],
            \ ['\.', '。'],
            \ ['“\(\_.\{-}\)”', '「\1」'],
            \ ['‘\(\_.\{-}\)’', '『\1』'],
            \ ['(\(\_.\{-}\))', '（\1）'],
            \ ]
for pair in replace_patterns
    let from = pair[0]
    let to   = pair[1]
    exec '%s+'.non_eng_prefix.start_pat.from.'+'.to.'+ge'
    exec '%s+'.digit_prefix.start_pat.from.'+'.to.'+gec'
endfor

" remove whitespaces before chinese punctuations
" \S: 
"   something not whitespace to enssure that the spaces are not indentation
" \zs\s\+\ze: 
"   the whitespaces to be removed
" \(...\): 
"   make sure it is the whitespaces that are followed by chinese punctuations
"   that we are removing
%s+\S\zs\s\+\ze\(，\|。\|：\|「\|」\|『\|』\|（\|）\|？\|！\)++ge

" highlights
if has('autocmd')
    au BufReadPost *.tex syn match Comment "\\footnote{\_.\{-}}%"
    au BufReadPost *.tex syn match Keyword "% %% Jy\_.\{-}\n\n"
endif

