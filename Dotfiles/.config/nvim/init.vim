set cursorline

" Recompile Suckless program after edit
	autocmd BufWritePost config.h,config.def.h !rm config.h && sudo make install
