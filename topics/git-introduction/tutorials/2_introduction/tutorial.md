---
layout: tutorial_hands_on

title: 2 Configurations 
zenodo_link: ''
questions:
- Which biological questions are addressed by the tutorial?
- Which bioinformatics techniques are important to know for this type of data?
objectives:
- The learning objectives are the goals of the tutorial
- They will be informed by your audience and will communicate to them and to yourself
  what you should focus on during the course
- They are single sentences describing what a learner should be able to do once they
  have completed the tutorial
- You can use Bloom's Taxonomy to write effective learning objectives
time_estimation: 3H
key_points:
- The take-home messages
- They will appear at the end of the tutorial
contributors:
- tmuylder

---


# 1. Getting started
As mentioned in the first chapter, we will first introduce Git in a terminal session. Linux and Mac users can open a terminal directly, Windows users have to open the 'Git Bash' program which will act like a normal Linux terminal. 

If you want to use git from the command line, you always start with typing  `git` followed by a verb defining a more specific command. These commands can be anything like staging, committing, pushing, etc. Git sums the common commands which you can use in different situations by entering `git --help`.

Before we dive in, we have to personalize some of the configurations (e.g. we need to tell git who we are, which text editor we want to use, etc.). Git comes with a configuration file that lets you get and set configuration variables that control all aspects of how Git looks and operates.

Let's start with telling Git who we are:
```
git config --global user.name "yourgithubusername"
git config --global user.email "your_email@domain.com"
```
Here we tell git to configure the global configuration file and add our GitHub username and e-mail of our account. Git actually has three levels of configuration files. On the lowest level, there is the local version for individual repositories where you can change settings for a specific project. On a higher level, we define the user-specific settings for all the repositories as we did here. Hence, we only have to perform this step once. Lastly, the system settings are defined under system settings, however are out of scope of this tutorial.

We can have a look at our global config file with the following command:
```
git config --list
```

Another thing we can edit in the configuration file is the editor. An editor is the program we want Git to use when we have to add a message or solve conflicts. During this course we will ommit the usage of editors as it sometimes drags us too far of topic, however, we'll define it anyway:
```
git config --global core.editor <editor>
```
in which we replace `<editor>` with `vim`, `emacs`, `atom` or any other editor you prefer.  `Vim` is often the default editor. If you haven’t used Vim before, here are the basics:  
- Open the editor with the following command `vim <file>` with <file> the name of the file you want to edit
- Type `i` to insert text in the file
- If you want to save your changes and quit: press Esc then type `:wq` or `:x` and hit Return.
- Exit a session without saving your changes: press Esc then type `:q!` and hit Return. 
 
The second and third chapter of this section are not important for the rest of the course. We can therefore skip them for the time being. 

# 2. SSH keys
Using the SSH protocol, you can connect and authenticate to remote servers and services in a secure way.
With SSH keys, you can connect to GitHub without supplying your username or password at each visit. If you want to create one, follow the brief instructions below or find them at [GitHub](https://help.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys).

Check whether you already have any existing SSH keys by opening Git Bash and type `ls -al ~/.ssh` and check whether there are files in the directory, e.g. a \*`.pub` file (with \* being any kind of precedent). If this is not the case, we'll make one first. If it is the case, yet it hasn't been linked with GitHub we'll do that in the second step.

**Make an SSH-key**

Paste the text below, substituting in your GitHub email address.
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
This creates a new ssh key, using the provided email as a label. If prompted, choose the default location to save your keys. And lastly, at the prompt, type a secure passphrase. 

Next, in order to securily save your passphrases, you can add the passphrases to your SSH key. Use your `ssh-agent` to securely save your passphrase so you don't have to reenter it. Start the `ssh-agent` in the background using the command below.
```
eval $(ssh-agent -s)
```
If it returns something like `Agent pid` and some number, you're good to go. Now, add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_rsa in the command with the name of your private key file.
```
ssh-add ~/.ssh/id_rsa
```
**Add the SSH-key to your GitHub account**

After adding a new SSH key to your GitHub account, you can reconfigure any local repositories to use SSH.
1. Copy the public SSH key (the one that ends with `.pub`).
2. Go to your GitHub account and on the upper right, click settings.
3. In the user settings sidebar, click 'SSH and GPG keys'
4. Add a 'New SSH Key'
5. In the 'Title' field you can describe for what purpose this SSH key serves. In the 'Key' field, enter the copied public SSH key.
6. Confirm by clicking 'Add SSH key' and entering your GitHub password.



# 3. Aliases
The configuration file is also a place where we can make our own aliases. An alias is a tailored command to your wishes. Here are some useful aliases for a structured history overview:
```
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.mylog "log --pretty=format:'%h %s [%an]' --graph"
git config --global alias.histcol "log --pretty=format:'%Cgreen%h%Creset %ai | %s %Cblue[%an] %Cred%d' --date=short -n 10 --color"
git config --global alias.llog "log --decorate --pretty='format:%C(auto) %h %d %s %Cgreen(%cr by %cn)%Creset' --graph --all"
```

If at some point, you're not happy any more about an alias, you can delete it with the following command:
```
git config --global --unset alias.<command>
```
