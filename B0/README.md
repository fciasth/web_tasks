0号任务主要是为了让⼤家先把环境搭建起来，熟悉⼀下接下来开发需要接触的
各类环境。
1. 在⾃⼰的电脑上安装Ubuntu系统，并要熟悉Linux Shell的操作，例如ls,
cd, grep, find, 管道, cp, mv, rm, ps, kill, tar, cat, less, more, chown,
chmod, vim, gcc, time, halt(关机), echo, env, man, whereis等，另外，与
ssh有关的例如ssh-keygen ssh-add命令也要有所了解。
2. 安装zsh，并安装github上的oh-my-zsh插件
3. 安装git, 并学会git的⼀些基本操作
4. 安装⼀个⽂本编辑器，可以是下⾯四种中的⼀个。
sublimetext(需要通过很⿇烦的⼿段才能⽀持中⽂输⼊)
atom（只⽀持64位Linux，没在linux上⽤过）
Rubymine（需要jdk，很耗内存，速度也⽐较慢，但是功能全）
Vim(学习曲线⽐较⾼，初期不建议使⽤)
5. 编译安装Ruby
6. 安装Ruby on Rails
7. 学习Ruby的基础语法
8. 注册⼀个Github账号，新建⼀个名为web_tasks的项⺫，然后添加ssh
key，在本地建⽴项⺫⺫录，以B0为⼦⺫录名，下⾯放置⼀个fib.rb⽂件，
然后与Github完成⼀次同步。
后端B0任务
任务要求
检查点
1. github上存在相应项⺫⺫录并且结构正确
2. fib.rb⽂件在运⾏时会⾸先让⽤户输⼊⼀个1-100之间的数字n，然后他会输
出⼀个1-n的斐波那契数列
你需要在7⽉15⽇晚8点前完成任务。本次任务由于重⼼在熟悉环境上，因此不
能提前提交任务。到7⽉15⽇8时会直接发布B1任务。
希望各位能够好好熟悉和了解这些软件，⾸先必须掌握基础的⽤法，从⽽保证
接下来任务的顺利执⾏，在之后有空的时候可以深⼊研究。
推荐下载Ubuntu桌⾯版系统。你可以选择Ubuntu Kylin或者原版Ubuntu。麒麟
版⾃带的输⼊法⽐较好⽤，另外多了⼏个没⽤的软件。
⺴站在这⾥： http://ubuntu.org.cn/index_kylin
这个资源是以CentOS为基础的，不过⼤部分命令都没有差的，可以直接看这个
学。软件包管理那⼀部分可以不⽤看， CentOS是⽤yum的， Ubuntu⽤的是
apt， Ubuntu的更加实⽤⼀些。这个教程⽐较⻓，你可以先学会⼀些基础知识，
接下来慢慢看，对你理解Linux系统会有很⼤的好处。
这并不是⼀个必需的插件，但是我强烈建议你安装，关于这个插件的介绍可以
看这个:终极Shell
这是⼀个很简单易懂的git教程，边看边⽤，记住主要的操作即可。未来你们都
任务期限
资源以及提⽰
Ubuntu系统
⻦哥的Linux私房菜
oh-my-zsh
git教程
要通过这个来交任务的。
Sublime Text 3,相关教程： http://www.imooc.com/learn/333
Atom
RubyMine,需要激活，不过只要去⺴上找个激活码就可以了。另外在使⽤前需要
安装jdk，推荐直接去下个jdk8
⾸先去ruby.taobao.org，在“Ruby 源代码镜像”中找到ruby-2.2.2.tar.gz,下载过来
后⽤tar -zvxf ruby-2.2.2.tar.gz解压并cd到相应⺫录。
然后先⽤ ‘apt-get’ 安装下列软件包；
sudo apt-get install libssl-dev libreadline-dev
这两个包分别是⽤于编译openssl和readline的依赖包，没有这两个包那么编译
出来的软件将不能正常使⽤。
接下来运⾏：
./configure && make
确认编译成功后，运⾏ sudo make install 来安装。
运⾏ruby -v，如果输出了ruby的版本号代表安装成功。
⾸先，你需要先按照ruby.taobao.org上的指⽰将rubygem的源改成taobao源，
然后运⾏sudo gem install rails -V即可。
你可以到群共享⾥⾯下载Ruby语⾔的⼊⻔书籍。
⽂本编辑器
编译安装Ruby
安装Ruby on Rails
Ruby 基础
