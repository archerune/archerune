GIT_DIR=/home2/i333043/git_completion/

echo 'copy /home2/i333043/git_completion/git_completion to your $HOME'
cp $GIT_DIR/git_completion ~/git_completion

echo 'Your ~/.bashrc is updated.'
cat $GIT_DIR/README.txt >> ~/.bashrc

exec bash
