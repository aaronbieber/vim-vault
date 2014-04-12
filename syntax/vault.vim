" Vim syntax file
" Language:         Password DB (plain text)
" Maintainer:       Aaron Bieber
" Latest Revision:  2014-04-11

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match vaultPassword /((.\{-}))/ms=s+2,me=e-2 conceal cchar=*
syn match vaultSection  /^.*:$/
syn match vaultItem     /\s*==.*$/
syn match vaultSpecialItem /\v\s*\[[^]]*\]/

hi def link vaultPassword    Identifier
hi def link vaultSection     Keyword
hi def link vaultItem        String
hi def link vaultSpecialItem Operator

let b:current_syntax = "vault"

let &cpo = s:cpo_save
unlet s:cpo_save
