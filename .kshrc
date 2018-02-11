# #######################################################################
# set initial environemnt variables
#
# #######################################################################
# http://www.badassvim.com/find-edit-vimrc-file/
# find . -name *.mpeg -exec cp '{}' /tmp/set \;
# sudo update-alternatives --config java
# sudo update-alternatives --config javac
# http://ubuntuhandbook.org/index.php/2015/01/install-openjdk-8-ubuntu-14-04-12-04-lts/
# #######################################################################
cp ~/.vimrc /home/mestes/scm/vimrc.vim/.vimrc


alias vii='vi -o'
alias VIM='vim -u NONE'
alias VI='vim'
alias big='ls -l | gawk '{print $5,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25}' | sort -nr | head -6'
# #######################################################################
# specific program variables
# 
# #######################################################################
export EMAIL=michael@fastlight.com
export JAVA_HOME=/usr/lib/jvm/default-java

AMAN_USER=mestes
export AMAN_HOME=$HOME/aman
export EC2_HOME=$HOME/awsapi/ec2-api-tools-1.7.1.1
#aws-java-sdk-1.8.9.1  ec2-api-tools-1.7.1.0

export AWS_CLOUDWATCH_HOME=$AMAN_HOME/CloudWatch-1.0.13.4
export AWS_CREDENTIAL_FILE=$AWS_CLOUDWATCH_HOME/creds
export AWS_CLOUDWATCH_URL=http://monitoring.us-east-1.amazonaws.com/ 

export SCRDIR=$HOME/aman/scripts
export PEMDIR=$HOME/PEMS
export M2_HOME=$HOME/apache-maven-3.2.3
export M2=$M2_HOME/bin

# https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-7-on-ubuntu-14-04-via-apt-get
export CATALINA_HOME="/usr/share/tomcat7"
export CATALINA_BASE="/var/lib/tomcat7"
export CATALINA_DEFAULT_HOME_PAGE="/var/lib/tomcat7/webapps/ROOT/index.html"
export CATALINA_TOMCAT_MANAGER="http://localhost:8080/manager/html"
alias mc='mc -b'
alias restartnfs='sudo service nfs-kernel-server restart'
alias tomcatrestart='sudo service tomcat7 restart'
alias tomcatstart='sudo service tomcat7 start'
alias tomcatstop='sudo service tomcat7 stop'
alias tomcatwmi='sudo vi /etc/tomcat7/tomcat-users.xml'
alias tomcatapps='cd $CATALINA_BASE/webapps'
alias tomcatlib='cd $CATALINA_HOME/lib'
alias webapps='ls /var/lib/tomcat7/webapps'
export UTILHOME="/etc/time/bin"
export AWKBIN=/usr/bin/gawk

alias twitter='rainbowstream'
# #######################################################################
# tmux alias
alias tsplit='tmux split-window -v'



# #######################################################################
# git alias
#
# #######################################################################
alias gitupdateorigin='git push -u origin master'
alias gitstatus='git status -uno'
alias gitstat='git status -uno'


# #######################################################################
# set sensitive items
#
# #######################################################################

# #######################################################################
# configure history
# configure terminal
# #######################################################################
export HISTFILE=$HOME/.history
export HISTSIZE=1024
alias h='history'
set -o tabcomplete
set -o emacs
alias __A=`echo "\020"`     # up arrow = ^p = back a command
alias __B=`echo "\016"`     # down arrow = ^n = down a command
alias __C=`echo "\006"`     # right arrow = ^f = forward a character
alias __D=`echo "\002"`     # left arrow = ^b = back a character
alias __H=`echo "\001"`     # home = ^a = start of line
alias __Y=`echo "\005"`     # end = ^e = end of line
# print $PATH | gawk '{n=split($0,a,":");for (i=1;i<=n;i++) print a[i]}'
# #######################################################################
# setup aliases
# 
# #######################################################################
alias water='ssh mestes@water'
alias fire='ssh mestes@fire'
alias wind='ssh mestes@192.168.1.9'
alias H9='ssh mestes@192.168.1.9'
alias sky='ssh mestes@192.168.1.250'
alias H155='ssh 192.168.1.155'
alias H250='ssh 192.168.1.250'
alias H251='ssh 192.168.1.155'
alias H252='ssh 192.168.1.252'
alias H253='ssh 192.168.1.253'
alias H254='ssh 192.168.1.254'
alias H255='ssh 192.168.1.255'
alias H256='ssh 192.168.1.256'
alias H257='ssh 192.168.1.257'
alias H258='ssh 192.168.1.258'
alias H259='ssh 192.168.1.259'
alias H260='ssh 192.168.1.260'
alias lssize='ls -S -lr'
alias lss='ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep "^l"'

alias lse='ls -l /etc/time/earth'
alias vfig='vi /usr/local/tools/fig'
alias vrbu='vi /usr/local/tools/rbu'
# alias aa=alias | gawk -F= '{printf("%-20s %s\n",$1,$2)}'
alias restartapache='sudo /etc/init.d/apache2 restart'
alias itt='cd ~/aman/amanscripts'
alias scm='cd ~/scm'
alias scmi='cd ~/scm/iman'
alias scmp='cd ~/scm/polymode.vim'
alias scmpp='cd ~/scm/polymode.vim/plugin'
alias scmf='cd ~/scm/fastlight'
alias scmkm='cd ~/scm/km'
alias scmt='cd ~/scm/tom'
alias scmd='cd ~/scm/dlcdashboard'
alias scmi='cd ~/scm/mi'
alias scmit='cd ~/scm/itlearningresources'
alias scmarch='cd ~/scm/archernar'
alias scmar='cd ~/scm/archernar'
alias scma='cd ~/scm/archernar'
alias scmawscli='cd ~/scm/awscli'
alias scmdotfiles='cd ~/scm/dotfiles'
alias scmu='cd ~/scm/utils'
alias scms='cd ~/aman/amanscripts'
alias here='cd $VHERE'
alias there='cd $VTHERE'
alias ee='vi $VFILE'


alias tomcatlogterm='xterm -geometry 200x24+50+50 -hold -e "tail -f /var/log/tomcat7/catalina.out" &'
# alias tclx='xterm -geometry 200x24+50+50 -hold -e "tail -f /var/log/tomcat7/catalina.out" &'
alias tclx='/usr/local/tools/tclmain'
alias tomcatlog="tail -f /var/log/tomcat7/catalina.out" 
alias tcl="tail -f /var/log/tomcat7/catalina.out" 


alias tcll="tail -f /var/log/tomcat7/catalina.out | less"
alias tclless="less /var/log/tomcat7/catalina.out"


alias term='gnome-terminal --geometry 132x24+50+200'
alias term2b='gnome-terminal --geometry 132x24+50+50;gnome-terminal --geometry 132x24+50+200'
alias term2b='gnome-terminal --geometry 132x24+50+50;gnome-terminal --geometry 132x24+50+200'
alias term2b='gnome-terminal --geometry 132x24+50+50;gnome-terminal --geometry 132x24+50+200'
alias term2='gnome-terminal --geometry 132x16+50+50 &;gnome-terminal --geometry 132x16+50+400 &'
alias termw='gnome-terminal --geometry 138x24+10+10'
alias termn='gnome-terminal --geometry 56x24+10+10'
alias ll='ls -l'    # how how how
alias zow='cd "/home/mestes/etc/The Grateful Dead"'
alias uu='cd ..'
alias fulljar='find . -type f | sed "s#^.#$(pwd)#" | egrep "[.]jar$"'
alias tools='cd /usr/local/tools'
alias dev='cd /home/mestes/dev'
alias lsl='ls -l'
alias lsd='ls -l | egrep "^d"'
alias lsa='alias | gawk -F= -f /usr/local/tools/2col.awk | sort'

alias oh='nautilus ,'
alias finddups='dupes -r -S .'
alias fullpath='find . -type f | sed "s#^.#$(pwd)#"'
alias sfullpath='sudo find . -type f | sed "s#^.#$(pwd)#"'
alias loo='sudo du -xh --max-depth=1'
alias al='alias | nawk -F "=" -f /etc/time/bin/alias.awk'
alias wwget='wget -w 4 -e robots=off -r -l1 --no-parent -A pdf,ppt'
alias powerdown='sudo shutdown -P now'
alias down='sudo shutdown -P now'
alias poweroff='sudo shutdown -P now'
alias reboot='sudo shutdown -r now'
alias halt='sudo shutdown -H now'
alias vs='sudo vi'
alias xcopy='rsync -urv'
alias kshrc='sudo vi /etc/time/bin/.kshrc'
alias kmtxt='vi /etc/time/bin/km.txt'
alias rebootmenow='sudo shutdown -r now'
alias dff=df -h -P | gawk '{printf("%-32s %6s  %6s  %6s  %s\n", $1,$2,$3,$4,$5)}'
alias musictoexternal='rsync --delete -av /etc/space/music  /media/S500A'
# #######################################################################
# print to screen
# 
# #######################################################################
print ""
print "Config"
lsb_release -a
print "Kernel:        " `uname -mrs`
print "Gnome Shell:   " `gnome-shell --version`
print "Hostname:      " `hostname`
print "aman home:     " $AMAN_HOME
print "ec2 home:      " $EC2_HOME
# cat /etc/*-release
print ""
# lspci -nn | grep VGA
/usr/lib/jvm/default-java/bin/java -version
iwconfig


export ADK=$HOME/aws-java-sdk-1.11.51
export ADKV=1.11.51
CLASSPATH=./
CLASSPATH=$CLASSPATH:/home/mestes/scm/fastlight/fastlight.jar
CLASSPATH=$CLASSPATH:$ADK/lib/aws-java-sdk-1.11.51.jar
CLASSPATH=$CLASSPATH:$ADK/lib/aws-java-sdk-1.11.51-javadoc.jar
CLASSPATH=$CLASSPATH:$ADK/lib/aws-java-sdk-1.11.51-sources.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/aspectjrt-1.8.2.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/aspectjweaver.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/commons-codec-1.9.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/commons-logging-1.1.3.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/freemarker-2.3.9.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/httpclient-4.5.2.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/httpcore-4.4.4.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/ion-java-1.0.1.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/jackson-annotations-2.6.0.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/jackson-core-2.6.6.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/jackson-databind-2.6.6.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/jackson-dataformat-cbor-2.6.6.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/javax.mail-api-1.4.6.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/jmespath-java-1.0.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/joda-time-2.8.1.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/spring-beans-3.0.7.RELEASE.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/spring-context-3.0.7.RELEASE.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/spring-core-3.0.7.RELEASE.jar
CLASSPATH=$CLASSPATH:$ADK/third-party/lib/spring-test-3.0.7.RELEASE.jar
CLASSPATH=$CLASSPATH:/usr/share/tomcat7/lib/servlet-api.jar
export CLASSPATH

mounter() {
#  mounter 192.168.1.8:/home/mestes /home/mestes/wind/mestes
if mountpoint -q "$2"; then
     figlet -t -c "$2"
else
     IP=`echo $1 | gawk -F: '{print $1}'`
     fping -c1 -t300 $IP 2>/dev/null 1>/dev/null
     if [ $? -eq 0 ] ; then
          printf "\nHost Found, Mounting %-25s %-25s\n" $1 $2
          sudo mount $1 $2 -o noatime >/dev/null 2>&1
          if [ $? -eq 0 ] ; then
               printf " OK\n"
               if [ -L "$3" ] ; then
                    rm -rf $3  >/dev/null 2>&1
               fi
               # ln -s $2 $3
               # printf "Linked\n"
          else
               printf " Error\n"
          fi
     else
          printf "File Server is not found\n"
     fi
fi
}








server=wind 
if nc -w 2 -z $server 22 2>/dev/null; then 
    echo "$server ✓" 
    echo "Calling mounter" 
    mounter 192.168.1.8:/etc/time          /etc/time        l2-time 
    mounter 192.168.1.8:/etc/space         /etc/space       l2-space    
    mounter 192.168.1.8:/etc/air           /etc/air         l2-air
    mounter 192.168.1.8:/etc/air/network   /usr/network     l2-network
    mounter 192.168.1.8:/home/mestes       /etc/mesteswind  l2-mesteswind
    mounter 192.168.1.8:/home/mestes/puller     /etc/puller  l2-puller
    mounter 192.168.1.8:/srv/samba/share /etc/share       l2-share
    cp ~mestes/.kshrc   /etc/space/sys  
    cp ~mestes/.vimrc   /etc/space/sys  
    cp ~mestes/.profile /etc/space/sys  
else 
    echo "$server ✗"
    figlet -t -c "Not Home"
fi
# #######################################################################
# end
# 
# #######################################################################

# #######################################################################
# notes
# 
# #######################################################################
#alias | nawk -F "=" -f /etc/time/bin/alias.awk
#cat /etc/*-release
#lspci -nn | grep VGA
#uname -mrs
#java -version 
#javac -version 
#print $ENV 
# lsb_release -a | gawk '/Codename:/ {printf $2 " Ready"}' | figlet
# http://www.cyberciti.biz/faq/linux-gnome-open-terminal-shell-prompt-here 
# http://osr507doc.sco.com/en/OSUserG/_Command_history.html
#if [ -z "$VISUAL" -a -z "$EDITOR" ] 
#then 
#set -o vi 
#figlet set
#fi
# lsb_release -a | gawk '/Codename:/ {printf $2 " Ready"}' | figlet
# http://www.cyberciti.biz/faq/linux-gnome-open-terminal-shell-prompt-here 
# http://osr507doc.sco.com/en/OSUserG/_Command_history.html
# lowriter --convert-to pdf *.doc
#alias | nawk -F "=" -f /etc/time/bin/alias.awk

# sudo gedit /etc/nsswitch.conf
# sudo tee /proc/sys/net/ipv6/conf/all/disable_ipv6 <<<"1"

# #######################################################################
# set shell prompt
#
# #######################################################################
export PS1=`whoami`@`hostname -s`:'$PWD>'

# lsb_release -a 2>/dev/null | gawk '/Description/ {$1=""; sub(/^ */, "", $0);print $0}'
figlet -t -c `date`
figlet -t -c `lsb_release -a 2>/dev/null | gawk '/Description/ {$1=""; sub(/^ */, "", $0);print $0}'`

permcheck() {
STAT=`stat -c '%a %n' "$1" | gawk '{print $1}'`
if [ "$STAT" != "$2" ]
then 
    figlet -t -c  $1" not "$2
fi
}
permcheck ".ssh" "400"
permcheck ".ssh/id_rsa" "400"
permcheck ".ssh/id_rsa.pub" "400"

stat -c '%a %n' .ssh
stat -c '%a %n' .ssh/id_rsa
stat -c '%a %n' .ssh/id_rsa.pub

# http://serverfault.com/questions/50585/whats-the-best-way-to-check-if-a-volume-is-mounted-in-a-bash-script
HOSTNAME=`hostname -s`
if grep -qs '/etc/share' /proc/mounts; then
    echo "$server ✓" 
    echo "alamo" 
    tar cvf /etc/share/SYS/$HOSTNAME/vim.tar   ~/.vim          2>/dev/null 1>/dev/null
    tar cvf /etc/share/SYS/$HOSTNAME/vimrc.tar ~/.vimrc        2>/dev/null 1>/dev/null
    tar cvf /etc/share/SYS/$HOSTNAME/kshrc.tar ~/.kshrc        2>/dev/null 1>/dev/null
    tar cvf /etc/share/SYS/$HOSTNAME/profile.tar ~/.profile    2>/dev/null 1>/dev/null
    cp ~/.vimrc   /etc/share/SYS/$HOSTNAME/.vimrc
    cp ~/.kshrc   /etc/share/SYS/$HOSTNAME/.kshrc
    cp ~/.profile /etc/share/SYS/$HOSTNAME/.profile

    ALAMOBACKUP=/etc/share/backup
    rsync -av --delete ~/.vimrc          $ALAMOBACKUP
    rsync -av --delete ~/.kshrc          $ALAMOBACKUP
    rsync -av --delete ~/.profile        $ALAMOBACKUP

else
    figlet -t -c "No Alamo File Server"
fi


if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

nmcli -p d wifi
iwlist wlan0 freq | grep Current
iwlist wlan0 


# cat ~/alfrede.txt
print "https://gitlab.com/archernar/archernar.git"


# export M2_HOME=/usr/share/maven
# export M2=$M2_HOME/bin
# export PATH=$M2:$PATH


if grep -qs '/etc/share' /proc/mounts; then
    ls -l /etc/share/SYS/$HOSTNAME
fi


# #######################################################################
# setup PATH
# setup CLASSPATH
# monty $M2 
# #######################################################################
monty() {
     print "$1" |  gawk '{printf("%-54s ",$0)}'
     if [ -d "$1" ] ; then
          PATH="$1:$PATH"
          export PATH
          print "OK" |  gawk '{printf("%s\n",$0)}'
     else
          print "BAD" |  gawk '{printf("%s\n",$0)}'
     fi
}
print "+-------------------------------------------------------------------+"
monty ./
monty /home/mestes/scm/km
monty /home/mestes/scm/km/scripts
monty /sbin
monty /usr/share/fslint/fslint
monty $HOME/ec2

monty /usr/local/tools
monty $HOME/firstbin
print "+-------------------------------------------------------------------+"
