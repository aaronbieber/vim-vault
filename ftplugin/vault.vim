" Settings for Vault files.
" Part of the Vault plug-in by Aaron Bieber (c) 2014

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal conceallevel=1
setlocal concealcursor=nvic
setlocal textwidth=80
setlocal formatlistpat="^\s*[\d*-]\+[\]:.)}\t ]\s*"
setlocal foldexpr=VaultFoldLevel(v:lnum)
setlocal foldmethod=expr
set foldtext=v:folddashes.substitute(getline(v:foldstart),'==','','g')

let g:vault_password_command = 'pwgen -c -n -1 10'

function! s:TogglePassword()
    if &concealcursor == ""
        set concealcursor=nvic
    else
        set concealcursor=
    endif
endfunction

function! s:CreateItem()
    let lines = ['== New Credentials', '  [Username] ', '  [Password] (())']
    call append(line('.'), lines)
    execute "normal +V2jo"
endfunction

function! s:InsertPassword(command)
    let password = system(g:vault_password_command)
    let password = substitute(password, "\n$", "", "")
    execute "normal " . a:command . password
endfunction

function! VaultFoldLevel(linenum)
    if indent(a:linenum) == 0
        return 0
    elseif match(getline(a:linenum), '^\s*==') > -1
        return '>1'
    else
        return '='
    endif
endfunction

nmap <silent> <Plug>TogglePassword :call <SID>TogglePassword()<CR>
nmap <silent> <Plug>CreateItem     :call <SID>CreateItem()<CR>

command! -nargs=1 InsertPassword call s:InsertPassword(<args>)
nmap <silent> <Plug>InsertPassword :call <SID>InsertPassword()<CR>

nmap <buffer> <CR> <Plug>TogglePassword
nmap <buffer> <Leader>c <Plug>CreateItem
nmap <buffer> <Leader>pi :InsertPassword "i"<CR>
nmap <buffer> <Leader>pI :InsertPassword "I"<CR>
nmap <buffer> <Leader>pa :InsertPassword "a"<CR>
nmap <buffer> <Leader>pA :InsertPassword "A"<CR>
