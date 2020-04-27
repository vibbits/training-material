---
layout: tutorial_hands_on

title: 4 History & status
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
