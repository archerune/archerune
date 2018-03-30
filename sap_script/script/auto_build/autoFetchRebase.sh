echo "[[[stash current working code]]]"
cd ~/hana; git stash;
echo "[[[fetch/rebase]]]"
cd ~/hana; git fetch; git rebase;
echo "[[[garbage collection]]]"
cd ~/hana; git gc;

