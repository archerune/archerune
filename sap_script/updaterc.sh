HOME2="/home2/i071503"
cp $HOME2/rc/.bashrc ~
cp $HOME2/rc/.screenrc ~
cp $HOME2/rc/.vimrc ~
cp $HOME2/rc/.a.vim ~
cp -r $HOME2/rc/.vim ~
cp -r $HOME2/bin/git_completion ~
cp -r $HOME2/bin/depot_tools ~

alias genctags=". /home2/i071503/script/gen_ctags.sh"
alias updaterc=". /home2/i071503/script/updaterc.sh"
