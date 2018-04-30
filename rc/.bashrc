#sangil
alias ls="ls -Gp"
alias g++="g++ -std=c++14"

source ~/.bash_git

export LESS=-R
export GREP_OPTIONS='--color=auto'
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

__hostname() {
  hostname -s
}
#PS1="[\t]\u@\h:\w> "
export PS1='\[\033[01;33m\]#[\t]$(__hostname)$(__git_ps1 "(%s)"):\[\033[00m\]\w> '

##########################################################################################
# used in SAP
##########################################################################################
#
#alias cdgit="cd /home/sangil/hana"
#alias cdsrc="cd /home/sangil/hana"
#alias cdq="cd /home/sangil/hana/ptime/query"
#alias cdvc="cd /home/sangil/hana/ptime/query/view_cache"
#alias cdqo="cd /home/sangil/hana/ptime/query/plan_generator/dml_search"
#alias cdqohex="cd /home/sangil/hana/ptime/query/plan_generator/dml_search/hex/impl"
#alias cdqe="cd /home/sangil/hana/ptime/query/plan_executor/dml"
#alias cdqt="cd /home/sangil/hana/ptime/query/plan_executor/trex_wrapper/trex_wrapper_body"
#alias cdqx="cd /home/sangil/hana/ptime/query/plan_executor/ddl"
#alias cdts="cd /home/sangil/hana/nutest/testscripts"
#alias cdgl="cd /home2/i071503"
#alias cdpo="cd /HDB_POOL/orange_GCC47/rel/linuxx86_64/LastBuild"
#alias genctags=". /home2/i071503/script/gen_ctags.sh"
#alias updaterc=". /home2/i071503/script/updaterc.sh"
#
#hmbd() { hm build -b Debug -j ${1} ${2}; }
#hmbdk() { hm build -b Debug -j ${1} -k -1 ${2}; }
#hmbo() { hm build -b Optimized -j ${1} ${2}; }
#hmbok() { hm build -b Optimized -j ${1} -k -1 ${2}; }
#hmbr() { hm build -b Release -j ${1} ${2}; }
#hmbrk() { hm build -b Release -j ${1} -k -1 ${2}; }
#
#gpush() { git push origin HEAD:refs/for/${1}; }
#gdraft() { git push origin HEAD:refs/drafts/${1}; }
#gcheck() { git checkout -B ${1} origin/${1}; }
#gmerge() { git merge --no-ff --no-commit origin/${1}; }
#gcommit() { git commit -a; }
#gcommita() { git commit -a --amend; }
#grebase() { git rebase origin/${1}; }
#
#BINUTILS_DIR=/sapmnt/appl_sw/binutils-2.23.1/bin
#DEPOT_TOOLS_DIR=~/depot_tools
#export BINUTILS_DIR
#export DEPOT_TOOLS_DIR
#export PATH=$BINUTILS_DIR:$DEPOT_TOOLS_DIR:$PATH
#
#
#source /home/sangil/.HappyMake/etc/hminit.sh
#
#export LIBGL_ALWAYS_INDIRECT=1
#alias qt="/home2/i071503/bin/qt-creator-4.5.1-sap1-linuxx86_64/bin/qtcreator.sh"
#
# happy make (installed on 2018-03-02 14:55:15.300153)
#source /INT1/sangil/.HappyMake/etc/hminit.sh
