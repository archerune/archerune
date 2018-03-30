set nu
set ts=4
set expandtab
set shiftwidth=4
set ci
set hlsearch
set tags=./tags,./TAGS,tags,TAGS,/home/sangil/tags
set noeb vb t_vb=

syntax on
colorscheme evening

function Blame() range
    execute '!git blame -L ' . a:firstline . ',' . a:lastline . ' %'
endfunction

vnoremap b :call Blame()<CR>

map f ma[[k"xyy`a:echo @x<CR>

source ~/.a.vim

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


