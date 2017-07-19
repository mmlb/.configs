if getline(1) =~ '^#!.*python2'
	let g:syntastic_python_python_exec = '/usr/bin/python2'
elseif getline(1) =~ '^#!.*python3'
	let g:syntastic_python_python_exec = '/usr/bin/python3'
endif
