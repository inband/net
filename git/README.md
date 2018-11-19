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

**git commit -m "*message*"**

 - saves the file/s that added to staging area
 - save a message

**git commit -m "*message*"**

 - adds and commits in same step


**git status**

 - show current status

**git push**

 - push to remote/master repository



