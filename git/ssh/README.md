# Connect to github using ssh 

Create a public/private key using ssh-keygen

 - go to https://github.com/settings/keys
 - add your public key

Edit **.git/config** url section 

```
nat@ubuntu-16:~/Documents/net$ cat .git/config 
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = git@github.com:inband/net.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master

```
Could use the follwing instead(not tested)

```
git remote add origin git@github.com:inband/net.git
git remote -v
```


Add user and email to global config
**git config user.email** *email_address* 
**git config user.name** *username* 


Edit global config file **~/.gitconfig**
 - put in your own github username and email  

```
nat@ubuntu-16:~/Documents/net$ cat ~/.gitconfig 
[user]
	email = 
	name = 

```

Add to ssh config file 

```
Host github.com
        User 
        IdentityFile ~/.ssh/nats_lab
```

