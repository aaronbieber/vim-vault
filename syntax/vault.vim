" Vim syntax file
" Language:         Password DB (plain text)
" Maintainer:       Aaron Bieber
" Latest Revision:  2014-04-11

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match pdbPassword /\[\[.\{-}\]\]/ms=s+2,me=e-2 conceal cchar=*

hi def link pdbPassword String

let b:current_syntax = "vault"

let &cpo = s:cpo_save
unlet s:cpo_save
