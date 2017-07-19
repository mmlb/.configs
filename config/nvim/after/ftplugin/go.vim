setlocal makeprg=go\ build
if expand('%t') =~# '.*_test.go'
	setlocal makeprg=go\ test\ -c
endif
