set shiftwidth=0
set smarttab autoindent smartindent cindent
set breakindent showbreak=\\_~>
set showmatch matchtime=1
set mouse=a
set showcmd
set wildmenu
set hlsearch incsearch
set splitright
"c,h,cpp,hpp,tpp
autocmd Filetype *			set list	tabstop=4 colorcolumn=81
autocmd Filetype help,man	set nolist	tabstop=8 colorcolumn=

runtime ftplugin/man.vim

colorscheme desert " and two others
highlight ColorColumn	ctermbg=4
highlight IncSearch		ctermbg=11		ctermfg=0
highlight Search		ctermbg=NONE	ctermfg=NONE	cterm=reverse
highlight SpecialKey					ctermfg=8
highlight cDefine						ctermfg=1
highlight DiffAdd		ctermbg=4
highlight DiffChange	ctermbg=NONE cterm=underline ctermul=13
highlight DiffDelete	ctermbg=8		ctermfg=9
highlight DiffText		ctermbg=13 cterm=standout

" '␣' U+2423 Open Box
set listchars=tab:[\ >,multispace:\ `\ '.\ \ '\ .\ '\ \ .\"\ \ \ =,
	\lead:␣,trail:#,extends:{,precedes:},conceal:@,nbsp:~
	"                                             &   & 
	"123456789ABCDEF01234

autocmd Filetype d set filetype=make

" See `:help group-name`

autocmd Filetype cpp,hpp,tpp syntax match lgascStruct	"\<s_\([a-z]\+_\=\)\+\>"
highlight link lgascStruct		cppStruct
highlight link cppStruct		cppClass

autocmd Filetype cpp,hpp,tpp syntax match lgascClass	"\<\([A-Z][a-z]*\)\+\>"
highlight link lgascClass		cppClass
highlight link cppClass			cppType

autocmd Filetype cpp,hpp,tpp
	\ syntax match lgascMethod "\<[a-z]\+\([A-Z][a-z]*\)\+\>"
highlight link lgascMethod		cppMethod
highlight link cppMethod		cppFunction
highlight link cppFunction		cFunction

autocmd Filetype c,h,cpp,hpp,tpp
	\ syntax match lgascMember "\(\.\|->\|::\)\@<=\([a-z]*_\=\)\+\>"
highlight link lgascMember	cMember
highlight link cMember		cIdentifier
highlight link cIdentifier	Identifier

autocmd Filetype cpp,hpp,tpp
	\ syntax match lgascPath contains=lgascStruct,lgascClass
	\ "\<\(s\(_[a-z]\+\)\+\|\(\([A-Z]\?[a-z]*\)\+\)\)\(<[A-Z]>\)\=::"
highlight link lgascPath		cppConstant

autocmd Filetype c,h,cpp,hpp,tpp
	\ syntax match lgascFunction	"\<ft_\([a-z]\+_\=\)\+\>"
highlight link lgascFunction	cFunction
highlight link cFunction		Function

autocmd Filetype c,h,cpp,hpp,tpp
	\ syntax match lgascTypedef		"\<t_\([a-z]\+_\=\)\+\>"
highlight link lgascTypedef		cTypedef
"highlight link cTypedef		Typedef

autocmd Filetype cpp,hpp,tpp
	\ syntax match lgascConstant '\<c_[a-z]_\=\([0-9a-z]\+_\=\)*\>'
autocmd Filetype c,h
	\ syntax match lgascConstant	"\<\([A-Z][a-z]*\)\+_\([A-Z][a-z]*\)\+\>"
highlight link lgascConstant	cConstant
highlight lgascConstant ctermfg=12
"Border case: ALPHA_BRAVO
autocmd Filetype c,h,cpp,hpp,tpp
	\ syntax match lgascMacro		"\<[A-Z]*\(_[A-Z]\+\)*\>"
highlight link lgascMacro		cMacro
highlight link cMacro			Macro
