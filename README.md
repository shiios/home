# home
error:
1.git push -u origin master
To git@github.com:******/Demo.git
! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:******/Demo.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Merge the remote changes (e.g. 'git pull')
hint: before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

reso:
有如下几种解决方法：

1.使用强制push的方法：

$ git push -u origin master -f

这样会使远程修改丢失，一般是不可取的，尤其是多人协作开发的时候。

2.push前先将远程repository修改pull下来

$ git pull origin master

$ git push -u origin master

3.若不想merge远程和本地修改，可以先创建新的分支：

$ git branch [name]

然后push

$ git push -u origin [name]


链接本地项目到github:
通过cd命令进入你要上传的工程中
执行git init
再执行git add .(这里面小数点代表的是上传所用的文件)
在执行git commit -m "first commit"
再执行git remote add origin https://github.com/shiios/home.git(项目初建链接)
再执行git pull
再执行git pull origin master
最后执行git push -u origin master
注意：若有报错，依照上述error提示进行强制提交。
