# git

Install git

```
apt install git -y
```

**git clone** *url*

 - copy repository and store locally

```
nat@ubuntu-16:~/Documents$ git clone https://github.com/inband/net.git
Cloning into 'net'...
remote: Enumerating objects: 158, done.
remote: Counting objects: 100% (158/158), done.
remote: Compressing objects: 100% (127/127), done.
remote: Total 158 (delta 59), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (158/158), 32.24 KiB | 0 bytes/s, done.
Resolving deltas: 100% (59/59), done.
Checking connectivity... done. 
```

**git add** *filename*
 
 - add a file to staging area
 - * adds **all** modified files
 - include file/s in next revision

**git commit -m** "*message*"

 - saves the file/s that added to staging area
 - save a message

**git commit -am** "*message*"

 - adds and commits in same step


**git status**

 - show current status

```
nat@ubuntu-16:~/Documents/net$ git add *
nat@ubuntu-16:~/Documents/net$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   git/README.md
nat@ubuntu-16:~/Documents/net$ git commit -m "Git update"
[master 511cfb9] Git update
 1 file changed, 50 insertions(+)
 create mode 100644 git/README.md
```

**git push**

 - push to remote/master repository

```
nat@ubuntu-16:~/Documents/net$ git push

Counting objects: 4, done.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 764 bytes | 0 bytes/s, done.
Total 4 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To git@github.com:inband/net.git
   1ac5bd8..511cfb9  master -> master

```


```
nat@ubuntu-16:~/Documents/net$ git commit -am "Git update" && git push
```
