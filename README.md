Vault
=====

Vault is a plug-in designed to allow you to very easily and simply manage a
list of credentials within Vim. Included is a straightforward syntax file
providing a basic structure for blocks of credentials utilizing Vim's
"conceal" feature to hide passwords from prying eyes.

Vault is meant to be used to manage files that are encrypted using Vim's
built-in blowfish encryption (the 'cryptmethod' setting is defaulted to
"blowfish" in \*.vault files), although you are welcome to use any other
on-disk encryption mechanism or simply assume that nobody will ever get their
hands on your password file. That part is up to you.

Getting Started
===============

To begin using Vault, you need to create a credentials file. Simply edit a
file with a '.vault' extension, or set the filetype of any file to "vault".
The basic structure of vault files is as follows:

* Sections are simply labels identifying groups of credentials. They are
  identified by any text ending with a colon.
* Actual credentials begin with double equal signs, similar to Markdown
  syntax.
* Items within credential blocks can include free-form text, lists of
  items beginning with asterisks (\*), hyphens (-), or numbers, and most
  importantly some usernames and passwords. Any items beginning with
  bracketed words will get special syntax highlighting.

Here is an example of what a couple of credentials blocks might look like:

```
Web sites:
  == Github
    [URL] https://www.github.com
    [Username] user@domain.com
    [Password] {rockyroad5!}
  == Facebook
    [URL] https://www.facebook.com
    [Username] user@domain.com
    [Password] {soc14lbu77erfly}
    * Password last changed 2014-04-01
```

Feel free to format data within credential blocks in any way you desire.
Secrets should be enclosed within braces (as demonstrated by the password
above). If your Vim is compiled with "conceal" support, the contents of braces
will be obscured, replaced by a single asterisk. You can toggle the
concealment of information on the current line by pressing `<Return>`, but even
when the text is concealed you can still yank it, allowing you to grab your
password without onlookers even seeing it.
