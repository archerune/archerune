cd ~/; source /home/sangil/.bashrc
cd ~/hana; /home/sangil/.HappyMake/bin/hm update --force;
cd ~/hana; /home/sangil/.HappyMake/bin/hm init;
#cd ~/hana; hm build clean;
#cd ~/hana; hm build clean -b Debug;
#cd ~/hana; hm build clean -b Optimized;
#cd ~/hana; hm build clean -b Release;
#echo "[[[check cleaned]]]"
#ls ~/hana/build/Optimized/packages/*.tgz
echo "[[[build]]]"
cd ~/hana; /home/sangil/.HappyMake/bin/hm build -b Debug all -k -1;
#cd ~/hana; hm build -b Optimized all -k -1;
cd ~/hana; /home/sangil/.HappyMake/bin/hm build -b Release all -k -1;

