is_linux=0

# Assumes the following symbolic links:
# /appsdir (ex: /usr/local or /Applications)
# /homedir (ex: /home/arno or /Users/arno)
# /data (ex: /home/arno/data or /Users/arno/Data)
# /docs (ex: /home/arno/docs or /Users/arno/Documents)
# /projects (ex: /home/arno/projects or /Users/arno/Projects)
# /software (ex: /home/arno/software or /Users/arno/Software)
# /desk (ex: /Users/arno/Desktop)
# /down (ex: /Users/arno/Downloads)
# /drive (ex: /Users/arno/Drive)
# /drop (ex: /Users/arno/Dropbox)
#
# Linux:
# sudo ln -s /usr/local /appsdir
# sudo ln -s /home/arno /homedir
# sudo ln -s /homedir/data /data
# sudo ln -s /homedir/docs /docs
# sudo ln -s /homedir/projects /projects

# Apple:
# sudo ln -s /Applications /appsdir
# sudo ln -s /Users/arno /homedir
# sudo ln -s /homedir/Dropbox /drop
# sudo ln -s /homedir/Drive /drive
# sudo ln -s /homedir/Data /data
# sudo ln -s /homedir/Documents /docs
# sudo ln -s /homedir/Downloads /down
# sudo ln -s /homedir/Projects /projects
# sudo ln -s /homedir/Software /software

###########
# Aliases #
###########
# Aliases -- local paths:
 alias b='. /homedir/bash_profile/bash_profile'
 alias eb='emacs /homedir/bash_profile/bash_profile'
 alias d='cd $1'
 alias da='cd /appsdir'
 alias db='cd /drop'
 alias dc='cd /docs'
 alias dk='cd /desk'
 alias dm='cd /projects/Mindboggle/mindboggle/mindboggle'
 alias dn='cd /downloads'
 alias dp='cd /projects'
 alias ds='cd /software'
 alias dt='cd /data'
 alias dv='cd /drive'

# Aliases -- remote:
 alias sshd='ssh -x binarybottle@binarybottle.com' # binarybottle
 alias sshb='ssh -p 22 arno@140.107.149.218' # boggle
 #alias sshm='ssh -p 22 arno@130.245.159.201' # mindboggler
 alias sshmr='ssh -p 22 root@boggler4' # mindboggler
 alias sshm='ssh -p 22 arno@mindboggler' # mindboggler
 alias sshm4='ssh -p 22 arno@boggler4' # mindboggler
 alias sshftpmindboggle='ssh ftpmindboggle@mindboggle.info' # binarybottle

# Aliases -- rsync to home:
 alias rsyncecho='echo "rsync -avz --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh <in> ."'
 if [ $is_linux==1 ]; then
   alias rsyncdhost2home='cd /homedir/sites; rsync -avz --delete --numeric-ids --sparse --exclude-from=/homedir/.rsync-exclude -e /usr/bin/ssh binarybottle@binarybottle.com:/home/binarybottle/* .'
 fi
 #alias rsyncdhostbkp='rsync -e ssh -av A b498945@hanjin.dreamhost.com:~/B'

# Aliases -- Git:
 alias ga='git add'
 alias gc='git commit'
 alias gp='git push origin master'
 alias gpull='git pull'
 alias gb='git branch'
 alias gh='git --help'
 alias go='git checkout'
 alias gs='git status -s'
 alias gd='git diff'

# Aliases -- list:
 alias t='ls $1'
 alias ta='ls -A $1'
 alias tm='ls $1 | more'
 alias tam='ls -A $1 | more'
 alias tt='ls -lart $1'
 alias tta='ls -lA $1'
 alias ttm='ls -l $1 | more'
 alias ttam='ls -lA $1 | more'
 alias td='ls -ba'
 alias tdd='ls .[a-zA-Z0-9_]*'
 alias du='du -hs *'

# Aliases -- common:
 alias a='alias | more'  
 alias cr='cp -R'
 alias md='mkdir $1'
 alias h='history'
 alias m='more'
 alias p='pwd'
 alias r='rm *#* .*#* *~ .*~ core .DS_Store *.pyc crash-*'
 alias rrf='rm -rf'

# Aliases -- applications:
if [ $is_linux==1 ]; then
  alias c3d='/software/c3d/bin/c3d'
  alias s='/software/itksnap/bin/itksnap $1'
fi
if [ $is_linux==0 ]; then
  alias s='/appsdir/ITK-SNAP.app/Contents/MacOS/InsightSNAP $1'
  alias f='/usr/local/fsl/bin/fslview.app/Contents/MacOS/fslview $1'
fi
 alias e='emacs &'

#########
# PATHS #
#########
export EDITOR=/usr/bin/emacs
export LSCOLORS="ExgxfxfxCxDxDxCxCxaCaC"

# Mindboggle
MINDBOGGLE_TOOLS=/software/mindboggle_tools/bin #/projects/Mindboggle/mindboggle/mindboggle_tools/bin
export MINDBOGGLE_TOOLS
export PATH=$PATH:$MINDBOGGLE_TOOLS
export DYLD_LIBRARY_PATH=/anaconda/lib/vtk-5.10:${DYLD_LIBRARY_PATH}

# FreeSurfer:
if [ $is_linux==1 ]; then
  FREESURFER_HOME=/software/freesurfer
fi
if [ $is_linux==0 ]; then
  FREESURFER_HOME=/appsdir/freesurfer
fi
SUBJECTS_DIR=/appsdir/freesurfer/subjects
PATH=${FREESURFER_HOME}:${PATH}
export FREESURFER_HOME SUBJECTS_DIR
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# ANTS:
ANTSPATH=/software/antsbin/bin/
PATH=${ANTSPATH}:${PATH}
export ANTSPATH PATH

# FSL:
#FSLDIR=/appsdir/fsl
#. ${FSLDIR}/etc/fslconf/fsl.sh
#PATH=${FSLDIR}/bin:${PATH}
#export FSLDIR PATH

# added by Anaconda 1.8.0 installer
export PATH="//anaconda/bin:$PATH"
