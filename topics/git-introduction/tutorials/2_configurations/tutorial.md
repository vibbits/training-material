---
layout: tutorial_hands_on

title: 2 Configurations 
zenodo_link: ''
questions:
- How to get started? 
objectives:
- Understand different level of configurations and know how to change them
- Make your own git command
time_estimation: 15m
contributors:
- tmuylder

---


# 1. Getting started
As mentioned in the first chapter, we will first introduce Git in a terminal session. Linux and Mac users can open a terminal directly, Windows users have to open the 'Git Bash' program which will act like a normal Linux terminal. 

If we want to use git from the command line, we always start with typing  `git` followed by a verb defining a more specific command. These commands can be anything like staging, committing, pushing, etc. If we want to have an overview of the most common Git commands we can enter `git --help`.

Before we can get started, we have to personalize a couple of configurations (e.g. we need to tell git who we are). Git comes with a configuration file that allows us to control all aspects of how Git looks and operates. There are three different levels on which we can do configurations, for example we could set configurations on a specific project (in one folder) or we could set them on a more global level where the configurations are applicable for all our projects. We will only edit the global configurations file here which is fine for pretty much all cases. 

We can have a look at our global config file with the following command:
```
git config --global --list
```

However, if this is the first time it will result in an failure, telling us that this file does not exist. If we just run the following commands, Git will create the configuration file automatically and add resp. our GitHub username and the email address of our account.

```
git config --global user.name "yourgithubusername"
git config --global user.email "your_email@domain.com"
```

With these settings we can already get started, however passing on information from and to GitHub in this manner is not really secure. Using the SSH protocol, we can connect and authenticate to remote servers and services in a secure way. With SSH keys, we can connect to GitHub without supplying our username or password at each visit. If you want to create one, follow the brief instructions below or find them at [GitHub](https://help.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys). SSH keys exist of a private key and a public key. The private key must stay secured on your computer at all times, the public key can be shared with third-party softwares to connect to them. 

1. List all the files (using Git Bash) to see if existing SSH keys are present. 

```
ls -al ~/.ssh
```
If there is a public SSH key present (file ending in `.pub`) we're all set and can continue to step 3, otherwise we will now generate a public key.

2. The following will create a new ssh key, using the provided email as a label.
```
ssh-keygen -t ed25519 -C "your_email@domain.com"
```
When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.
Then it will ask us to type a secure passphrase, press Enter to skip this step. As long as no-one other than you has access to the key, you do not require a passphrase. 

Now we have our SSH keys, we can let them be managed by the `ssh-agent`. Ensure the ssh-agent is running with:
```
eval `ssh-agent -s`
```

Add your SSH private key to the ssh-agent.
```
ssh-add ~/.ssh/id_ed25519
```

3. Lastly, we need to add the public key to GitHub. Copy paste the content of the public key file manually or with: 
```
clip < ~/.ssh/id_ed25519.pub
```
Then, go to GitHub, click on your profile picture and go to settings. In the user settings sidebar, click **SSH and GPG keys** and select **New SSH key**. Choose a descriptive title (e.g. personal computer) and paste your key into the "Key" field and save your changes by clicking on **Add SSH key** and confirming with your password. 


Another thing we can edit in the configuration file is the editor. An editor is the program we want Git to use when we have to add a message or solve conflicts. During this course we will ommit the usage of editors as much as possible, though it does not mean that something might go wrong and we need to interact with our editor. 
```
git config --global core.editor <editor>
```
in which we replace `<editor>` with `vim`, `notepad`, `emacs`, `atom`, `sublime` or any other editor you prefer.  

The next chapter is considered further reading material and will be discussed later in the course, however since it is related to the configurations file, we have mentioned it here. 

# 2. Aliases

The configuration file is also a place where we can make our own aliases. An alias is a new command tailored to your wishes. It often consists of an existing Git command (e.g. `git log`) followed by a bunch of variables. This omits that we have to type a long command the whole time. Here are some useful aliases for a structured history overview:

```
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.oneline "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.mylog1 "log --pretty=format:'%h %s [%an]' --graph"
git config --global alias.mylog2 "log --pretty=format:'%Cgreen%h%Creset %ai | %s %Cblue[%an] %Cred%d' --date=short -n 10 --color"
git config --global alias.mylog3 "log --decorate --pretty='format:%C(auto) %h %d %s %Cgreen(%cr by %cn)%Creset' --graph --all"
```
Once they are set, you can use them whenever you like. E.g.: running `git hist` gives us the same result as `git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short`. 


If at some point we are not happy any more about an alias, we can delete it with the following command:
```
git config --global --unset alias.<command>
```

Let's go to the [next session](https://material.bits.vib.be/topics/git-introduction/tutorials/3_first_commit/tutorial.html)!