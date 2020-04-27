---
layout: tutorial_hands_on

title: 3 History and changes
zenodo_link: ''
questions:
- Which biological questions are addressed by the tutorial?
- Which bioinformatics techniques are important to know for this type of data?
objectives:
- Make your own repository, clone into your local computer, make a file, make some changes, status, add, commit push
time_estimation: 3H
key_points:
- The take-home messages
- They will appear at the end of the tutorial
contributors:
- tmuylder

---

# 1. Routine usage
As mentioned in the first chapter, there are three conceptual areas in Git. When we want to save a file from the development area on our computer to the commit repository, we'll always have to add it to the staging area first, before we can commit it. The usual routine looks like this: 

```
git add <file>
git commit -m "some text that explains what has changed"
```

These commands will subsequently add the file `<file>` to the staging area and then commit it to the commit repository. If we wouldn't pass along the `-m`-message parameter, Git would have opened your editor where you write the commit message. It's good practice to write a short, but powerful commit message that helps your future self to determine what has changed in this commit. 

Uptil now we kept track of our code locally on our computer. Imagine that your computer dies right now, we've lost everything. A bit less drastical, if you would just like to show your project to your colleagues or with the whole world, we need one more step. The last part of our routine usage would be to **push** the commit(s) to an online repository on GitHub. Here's how it looks like:
```
git push
```
With this command we can update our online repository on GitHub with the commits we have done on our computer locally. 

That's all you need to know: `add-commit-push`. 

![Git add, commit and push](../../images/conceptual_areas_push.png)

# 2. Create a new repository
There are two ways of initializing a new Git repository. The first option can be used if you're about to start a new project, the second option can be used when you already have some files in a project which you now want to start version controlling. 


## 2.1 Creating a repository from GitHub
Go to your GitHub homepage and click the '+' icon in the upper right corner. The following screen will pop up.

![pop-up screen](../../images/02-2-create-repository.PNG)

We already filled in a repository name and an optional description. You can choose to already publish your repository, however as this is a meaningless repository, we will choose not to. When you're about to start a new project, there are three things to consider:
- For a new repo, it's a good practice to initialize the repo with a README file. This file will eventually include a decscription about the repository and all of the code or files in it (e.g. information about the scripts, version, disclaimers, etc.)
- Adding an `.ignore` file is something we will cover later, however for now it suffices to know that the .ignore file will contain some code which tells git to exclude certain files which reside in your local folders from uploading to the external GitHub repo.
- Adding a license makes sense when your project becomes public. It defines under which license the content is made available.

In our case, we will initialize the repository with a README file and click 'Create repository', which will then look like this:

![initialize repository](../../images/02-3-create-readme-repository.PNG)

This is the home directory of a GitHub repository. From here we can already do a lot, like changing or uploading files. 

If you want to make a local copy of the repository, we have to **clone** it to our computer. Click on the green button 'Clone or download' and copy the link.  Within the Git Bash (or Terminal), navigate to the folder where you want to keep your project folder and type the following:
```
git clone <link>
```
with `<link>` being the link from GitHub. 

---

> ### {% icon hands_on %} Exercise 1
>
>  Create a new GitHub repository, give it a name and initialize it with a `README`-file. Upload [this file](https://drive.google.com/open?id=1O0Vjljc-e-3y9tOTBFLIwrp-1jHNfFbf) // [this file via website](../../../../assets/files/git-introduction/plot1.R) to the repository on GitHub. What is GitHub asking you to do? Which stage is ommitted when uploading a file directly to GitHub?  
> 
> Clone the repository to your computer. How many files are there in your local repository?
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    > Click on upload files and drag the file into the screen. GitHub is asking to add a commit message which defines the changes that you'll do to your repository. In this case we'll add the very brief *Upload R script* message. Notice that there is no staging area when you upload a file directly on GitHub. 
>    > 
>    > ![Upload R script](../../images/solution1.png)
>    > 
>    > Click on 'Commit changes' and find the two files: `README.md` and `example.R` in your repository. Now, we can find the clone link via the green 'Clone or download' button. In our Terminal we type the following command to start using the repository locally on our computer: 
>    > ```
>    > git clone <link>
>    > ```
>    > in which you change `<link>` to the link that you copied from GitHub. There should be two files in your local repository as well.   
>    > On a Windows computer we have a folder that contains the following files:
>    > ![windowsfolder](../../images/folder1.PNG)
>    > ``` 
>    > ```
>    > </details>
>
{: .hands_on}
---

# 3. Our first commit
Our local copy (clone) of the GitHub repository is now able to communicate with the GitHub repository. Every change within this repository is traceable, whether it is a new file or changes to a file. When you make changes in your local repo (e.g. create a new file), you have to add it to the staging area first (`git add`) and then commit the changes (`git commit`) before pushing it (`git push`) to your GitHub website repo. 


## 3.1 Staging a file
Let's add a new file to our folder. Download [this file](../../../../assets/plot2.R) and copy paste it in our project folder. It contains some R code for plotting a new figure.  

The first thing we'll have to do now is to stage the file into the staging area.  Remember that this is an intermediate area before committing the file to the repository. In a next section we will learn why this staging area can be useful. 

Now we have two options, depending on the situation:
  1. `git add <file>` : will add a **specific** file to the staging area
  2. `git add .` : will add **all** the changed or new files to the staging area

In this case, we can choose either of both options as we have only added one file. As this is a new file, `git add` will not only add it to the staging area, but it will also tell Git that it needs to keep track of changes that happen in this file. 

## 3.2 Committing
Our new file is now in the staging area, ready to be committed. For this we have to use the following command:
```
git commit -m "added plot2.R script"
```
We added a parameter `-m` (message) to the command followed by some text. This text informs our future selves of what changes were done. We make this message as explanatory as possible, yet as short as possible. If the `-m` parameter was not added, git will launch a text editor and ask to write a message. Some tips and general best practices in writing commit messages are described in [this link](https://chris.beams.io/posts/git-commit/). 

**Question**  
Which of the following commit messages would be most appropriate for a hypothetical commit made to our `README.md` file?
- “Update README file”
- “Added line ‘We use this repo as an example’ to README.md”
- “Added a description of the purpose of the README file”

**Question**  
What has happened after committing?
- We saved a version of the file which is now visible on GitHub.com
- We saved a version of the file which is now stored in our commit repository

## 3.3 Push commits to GitHub
Recall that when we added the first file on GitHub (exercise 1), it was immediately committed and showed up right away in the GitHub repository. Unfortunately, when we've changed some files locally and we committed them to our commit repository, GitHub doesn't know this yet. Hence, we have to do one final step: 
```
git push
```
Have a look on your GitHub repository and verify that the new file is now in your repository. 


---

> ### {% icon hands_on %} Exercise 1
>
>  Add a title to both files ("# Title plot 1" and "# Title plot 2"). Follow the steps here above to push your changes to our GitHub repository. 
> 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    > After adding the titles, use the following commands 
>    > ```
>    > git add .
>    > git commit -m "Added a title to both plot files"
>    > git push
>    > ```
>    > Here we used a `.` after `git add` because we want to add both changes to the staging area.  
>    > ``` 
>    > ```
>    > </details>
>
{: .hands_on}
---


## Status
At all times, git can tell you which files it's tracking and which files are ready to commit (we say that the changes are in a staging area). This being said, let's try some of these features.

`git status` is the command you'll use the most for its informative status description.
```
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```
The first sentence tells us that we're on the `master` branch, which is the default branch name in Git. More on branches later. The second sentence tells us that our local branch is exactly the same as our origin. This means that all of the files and folders within our local project are identical to the ones in the remote GitHub repo. Lastly, git tells us that there is nothing to commit, which makes sense as we didn't make any changes yet.

```
vim README.md
```
When you're in the editing tab, type `i` to insert text, type something like "this is an introduction to github" and save the changes by typing 'esc', then ':' and finally 'x'. You should be back in your folders now. Check the status again with `git status`.
```
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
```
This time, git tells us that there is one file that is untracked.

### exercise 
Imagine that we would have multiple files ready to commit, we would have to add the `-a` parameter, which stands for commit all changed files.

# 5. Your history (log)
In order to track all of your commits, enter `git log`. This will prompt all of the commits we made and will look something similar like this:
```
commit e2d7e9a0b461426bee6b3ffd7583237bc5671dc1
Author: tmuylder <tuurmuyldermans@gmail.com>
Date:   Wed Jan 01 01:23:45 2019 +0200

    make README file
```
`git log` lists all commits made to a repository in reverse chronological order. The listing for each commit starts with an identifier which is a unique code for each commit. If we push the commit to our Github repository (online) we will see the same (latest) identifier somewhere in the upper right corner. This is a verification for us so we know that the remote repository is up to date with the local repository. Besides the identifier, the commit’s author and date are given, and the log message Git was given when the commit was created.


**Extra options**
When the output of git log is too long to fit in your screen, git uses a program to split it into pages of the size of your screen. When this “pager” is called, you will notice that the last line in your screen is a :, instead of your usual prompt.
- To get out of the pager, press `Q`.
- To move to the next page, press `Spacebar`.
- To search for `some_word` in all pages, press `/` and type `some_word`. Navigate through matches pressing `N` (next).

To avoid having `git log` cover your entire terminal screen, you can limit the number of commits that Git lists by using `-N`, where `N` is the number of commits that you want to view. For example, if you only want information from the last commit you can use `git log -1`. Otherwise, if you want to reduce the quantity of information, using the `git log --oneline` command is also a good option.

You can also combine the `--oneline` option with others. One useful combination adds `--graph` to display the commit history as a text-based graph and `--decorate` to indicate which commits are associated with the current HEAD, the current branch master, or other Git references.

# 6. Push your changes to GitHub




## 2.2 Locally
Alternatively, you can create a repository from the Terminal itself. 

The first thing we have to do is make a new folder which will contain the files of the project in case you don't have one yet. In Git Bash (Windows) or in your Terminal (Mac, Linux), move to the project folder you just created or to the folder that contains the files of a project. 

- When you're in that folder, you have to type `git init` to initialize Git and it will keep track of your files.  
- Open GitHub.com, create a new repository and DO NOT initialize it with a README.md, .gitignore or license. You can add that later. 
- Go back to your Terminal and use the following commands to make a link between your local repository and the repository on GitHub.: 
  ```
  git remote add origin git@github.com:youraccount/repositoryname.git
  ```
- Add some content to the folder (e.g. add a file)
- Add it to the staging area, commit it and push it to GitHub with the following commands:
```
git add <file>
git commit -m "some text"
git push -u origin master
```

It is important to note that `git init` will keep track of all the subdirectories and their files that are in the folder. Thus, you don't need to create a git repository for each folder or subdirectory.  

If we use `ll` or `ls -a` we get a list of all files and directories, and we see now that a `.git` folder is now present. Git uses this special directory to store all the information about the project like the history of all commits. If we ever delete the `.git` sub-directory, we will lose the project’s history.

As a best practice, it's suggested to have a git repository for each project and they are separated in folders. Git repositories can interfere with each other if they are “nested”: the outer repository will try to version-control the inner repository. Therefore, it’s best to create each new Git repository in a separate directory.


























# Git push


If you were pushing changes from *master* locally to *master* on GitHub, you could just issue the command `git push` and let Git work out what needs to go where.

It’s always better to be explicit though. What’s more, you have multiple branches here, so you need to tell git where to push (i.e. back to the remote repository you cloned from, on GitHub) and what exactly to push (your new branch).

```
git push origin master
```




# 7. Git diff
Let's edit the `README.md` file. Use your editor (`vim`) and add another sentence to it so it looks something like this:
```
This is an introduction to github.
We use this repo as an example.  
```
To save your changes, type Esc followed by `:x`. The output will look something like this (note that the colors do not completely match, however are indicative):

```diff
diff --git a/hello.txt b/hello.txt
index ce01362..f23c541 100644
--- a/hello.txt
+++ b/hello.txt
@@ -1 +1,2 @@
- this is an introduction to github
+ This is an introduction to github.
+ We use this repo as an example.
```
In the first line, git tells which files it's comparing. In the second line, it gives the identifier of the two different edits???. The third and fourth line indicate that the a-version is the previous version and the b-version is the current version with edits. The fifth line indicates where edits were performed ???. Finally, in the last lines we can see the lines that were edited from a previous version with a `-` sign to the current version with a `+` sign. We call this line-based diffing.

You can check out the differences between files that are in the staged version with the `git diff --staged` command. Right now, it will give nothing in return. However, if we add the files to the staging area (`git add <file(s)>`) and enter the former command, we will see the same output as given here above.

**Extra options**
- Word-based diffing: `--color-words` allows you to highlight the changed words instead of lines.

# 8. Create a new branch
If we have a project with multiple parts, we can address each part separately by making a branch and make some changes in that branch. When we're happy about these edits, we can merge them back into the master branch which should be the reference branch.
```
git checkout -b new-branch
```
Git will tell you it switched to your new branch called 'new-branch'. If you want to change branches, just type `git checkout` followed by the name of the branch, e.g. `git checkout master`.

*Exercise*: make some changes in the README file and commit them. When you push your changes to GitHub, make sure to be explicit enough so it pushes the whole branch.

```
git push origin new-branch
```
Next time you want to push committed changes in new-branch, you won’t need to specify the branch - you can simply do git push, because now new-branch exists at both ends. However, it’s still a good idea to be explicit. That way you’ll be less likely to get a surprise you didn’t want, when the wrong thing gets pushed.

# Questions
Which command(s) below would save the changes of a new file `myfile.txt` that I just created in my local Git repository?
- Commit (1):
```
git commit -m "created new file: myfile.txt"
```
- Init & commit:
```
git init myfile.txt
git commit -m "created new file: myfile.txt"`
```
- Add & commit:
```
git add myfile.txt
git commit -m "created new file: myfile.txt"
```
- Commit (2):
```
git commit -m myfile.txt "created new file: myfile.txt"
```

# Exercise
Fork github repo from me, make a branch, make changes to my script, commit and push, make pull request.
I must have made some changes by the time they ask for pull request. So they have to fetch and merge (= pull) my changes in their code so it works for them and then pull request again.
