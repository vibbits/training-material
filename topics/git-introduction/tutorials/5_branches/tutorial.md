---
layout: tutorial_hands_on

title: 5 Branches and merging
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

# 1. What's a branch?
The idea of branching is that we can create a copy of the project in which we can add a new feature. This branch is a completely separate version of your project and lives next to your original version. If the new feature is working properly we can merge it back into the project. It's a great way of testing new changes in some code when you're not sure whether it will work, and in the meanwhile not messing up the code that you already have. 

<center><img src="../../images/branching.png" /></center>

The original repository is always called the *master* branch. If we would make a new branch, we can name it however we like (e.g. *new-feature*). 


There are two ways of doing this: locally or on the GitHub website. We will first show you the latter and afterwards how to do it locally. 

A repository can have numerous branches. Branches are ways of organising work on a project: you can have a branch for a new feature, for trying out something new, for exploring an issue - anything at all.

It’s a good practice to create a new branch for every new bit of work you start doing, even if it’s a very small one. It’s especially useful to create a new branch for every new feature you start work on. Branches are of course disposable, you can always remove them. 


# 2. Branching on GitHub
The easiest way is to make a new branch on GitHub. 
1. Click the button: 'Branch: master'
2. In 'Find or create a branch...' type `new-feature`
3. Click 'Create branch': new-feature

<center><img src="../../images/newbranch-github.png" /></center>

GitHub will now display in that button that it is on `Branch: new-feature`. It's very important to understand that any changes that happen in this branch, will not be visible in the master branch. 

---

> ### {% icon hands_on %} Exercise 5
>
>  Edit the `plot2.R` file again, however make sure you're in the *new-feature* branch. Add the following lines that will make a new plot. These lines will allow us to investigate the relation between the weight, horsepower and miles per gallon variables of `mtcars` dataset in R. 
> 
> ```R
> # Install requirements & plotting of 3D scatterplot: weight, dis
> install.packages("scatterplot3d")
> library(scatterplot3d)
> attach(mtcars)
> scatterplot3d(wt,hp,mpg, pch=16, highlight.3d=TRUE,
>               type="h", main="3D Scatterplot")
> ```
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    > Edit the file `plot2.R` by clicking on the pencil icon and add the following lines: 
>    > 
>    > <center><img src="../../images/solution5.png" /></center>
>    > Commit your changes with a useful commit message and save by clicking the green 'Commit changes'-button.
>    > 
>    > </details>
>
{: .hands_on}
---

Switch back to your *master* branch and have a look to the `plot2.R`-file. It shouldn't contain the changes that we just made. 


# 3. Merging branches on GitHub
Before exploring how we make branches on our computer locally, we'll merge the changes in the *new-feature* branch into the *master* branch. 

Whether you're on the *master* or *new-feature* branch, doesn't matter. In both cases you should see the following yellow screen. Alternatively, go to 'Pull requests' and find it there. 

<center><img src="../../images/pull-request-pre.png" /></center>

Click on 'compare & pull requests'. A new screen pops-up with the following information.
<center><img src="../../images/pull-request-1.png" /></center>

- The pull request should be interpreted as a request to pull the new branch and all of its changes into the master branch.   
- The base where it would be pulled towards is `base: master`. The branch where the changes are deriving from is `compare: new-feature`.   
- Note that GitHub checks the compatibility of the branches: in this case there are no conflicting edits and the branches can be merged together.   
- Give a descriptive title text and if appropriate some additional comment. 

Underneath the pull request related information, GitHub also gives you a summary of the changes that were done. 
<center><img src="../../images/pull-request-2.png" /></center>

- Each commit that's done in the branch *new-feature* (i.e. only added these 7 lines in this case)
- Display of the file and a visual representation of what changed in that commit. 

Click on 'Create pull request'. 

Finally, the last screen pops up in which you verify the merging commit and you give your consent to GitHub to merge both branches by clicking 'Merge pull request'.
<center><img src="../../images/pull-request-3.png" /></center>

It might be possible that in a project with several people, you're not authorized to make changes to the *master* branch. In this case you'll always have to work in a separate branch and someone else will get this last message. He or she will then decide whether this pull request should be merged. 

# 4. Branching locally
Besides the possibility of making branches on GitHub, we can also do it locally on our computer. 

As we've made changes to the repository on GitHub, we'll start with pulling the changes into our local repository. Use `git pull` in your project folder. 
 
There is always an indication in the Terminal or Git Bash of which branch we're in (i.e. '(master)'). Here are the most important commands related to making branches and switching between different branches:
1. `git checkout -b <new-branch>`: will create a new branch and move into this branch. 
2. `git branch <new-branch>`: will create a new branch, but will remain in the current branch (i.e. the *master* branch in this case)
3. With `git checkout <branch>` we will switch from one branch to the other. 
4. Listing all the existing branches is possible with `git branch -a`:

Let's start with listing all the existing branches (4). 
```
* master
remotes/origin/HEAD -> origin/master
remotes/origin/master
remotes/origin/new-feature
```
The first branch is our local master branch in which we're working at the moment (as denoted by the asterisk \*). The three others relate to the branches that exist remotely on GitHub. If we want to work on the branch *new-feature* we will have to import it first with: `git checkout new-feature` (3). Git will understand that there is a remote branch with the same name and you want to work on this one. 

**Note** that if you use `git checkout -b new-feature` (2), you would have created a new branch with the same name as the remote branch. This is error prone and will lead to problems! 

# 4.1 Example workflow

**1. Make a new branch:**
```
git checkout -b <new-branch>
```
Git will make a new branch with the name `<new-branch>` and tell you it switched to the new branch. If you want to change branches, just type `git checkout` followed by the name of the branch, e.g. `git checkout master`.

**2. Make the necessary changes:**
  - Add  a new file
  - Add new code to an existing file

**3. Stage changes:**  
Use the following  command to simply add all the new or changed files. 
```
git add .
```
 
**4. Commit staging area:**  
Commit all the staged files with:
```
git commit -m "some useful commit message"
```

**5. Push commits to GitHub:**
```
git push origin <new-branch>
```  
  or alternatively:
```
git push --set-upstream origin <new-branch>
```
The `git push` command is now a bit longer. The first time we want to publish a new local branch on a remote repository (GitHub), we need to be explicit and tell Git to add the `<new-branch>` to the origin. In Git, the "origin" is used to refer to the GitHub original repository's URL and makes it much easier to talk about. 

Next time you want to push your commits from *new-branch*, you won’t need to be explicit - you can simply do `git push`, because now *new-branch* exists on GitHub and both branches know how to commmunicate with each other. However, it’s still a good idea to be explicit. That way it'll be less likely to push something to the wrong branch.


---

> ### {% icon hands_on %} Exercise 6
>
>  Make a new branch and make sure you're in the branch. Edit the README.md file to the following text. 
> 
> ```
> # Downstream data-analysis R
> This repository contains all the scripts for the downstream data analysis of my project.
> ```
> 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  
>    >  ```
>    >  git checkout -b readme
>    >  ```
>    >  Do the necessary changes
>    >  ```
>    >  git add README.md
>    >  git commit -m "changed README file completely"
>    >  git push origin readme
>    >  ```
>    >  Find the new branch in your GitHub repository. 
>    > </details>
>
{: .hands_on}
---













## 1.4 Make a pull request
When you’re ready to have your changes incorporated into the original/official/canonical repository, you do this by making a **Pull Request**.

* Go back to `https://github.com/<your github account>/afraid-to-commit`.  
  You’ll see that GitHub has noted your recent changes, and now offers various buttons to allow you to compare them with the original or make a pull request.
* Hit Compare & pull request.  
  This will show you a compare view, from which you can make your pull request.

When preparing for a pull request, GitHub will show you what’s being compared:
```
evildmp:master ... <your github account>:add-my-name
```
On the left is the **base** for the comparison, the upstream fork and branch. On the right is the **head**, our fork and branch, that you want to compare with it. A pull request goes from the **head** to the **base** - from right to left. You can simply change the repositories or branches by clicking them and scrolling through the options.

Below of the comparing section, you can find a section where you can edit the message of the pull request. Underneath that, there is a section which, similarly to `git diff` summarizes the differences between the two repo's that are being compared.

If you're happy with it, simply click the green 'Create pull request'-button. (you don't need to do this, though this would be a first pull request to an open-source community project)


# 3. Merges
1. Confirm the receiving branch
Execute `git status` to ensure that HEAD is pointing to the correct merge-receiving branch. If needed, execute `git checkout <receiving>` to switch to the receiving branch. Usually, this would be `git checkout master`.

2. Fetch the latest remote commits
Make sure the receiving branch and the merging branch are up-to-date with the latest remote changes. Execute `git fetch (upstream?)` to pull the latest remote commits. Once the fetch is completed ensure the master branch has the latest updates by executing `git pull`.

3. Merging
Once the previously discussed "preparing to merge" steps have been taken a merge can be initiated by executing `git merge <branch name>` where `<branch name>` is the name of the branch that will be merged into the receiving branch.

* Fast-forward merge  
A fast-forward merge can occur when there is a linear path from the current branch tip to the target branch. This could be the case if the master branch did not change while you changed your branch. Instead of “actually” merging the branches, all Git has to do to integrate the histories is move (i.e., “fast forward”) the current branch tip up to the target branch tip. This effectively combines the histories, since all of the commits reachable from the target branch are now available through the current one. For example, a fast forward merge of some-feature into master would look something like the following: (make image on slides)  

Find out what the differences are with the command:
```
git diff master..<new-branch>
```
First, move your HEAD to the master branch with `git checkout master`. Now simply merge them with the following command:
```
git merge <new-branch>
```
Git will now tell us it performed a fast-forward merge and summarizes the changes that happened within the repository. After merging, you can delete the branch with `git branch -d <new-branch>`

**Extra:**  
In the event that you require a merge commit during a fast forward merge for record keeping purposes you can execute `git merge` with the `--no-ff` option.
```
git merge --no-ff <new-branch>
```
This command merges the specified branch into the current branch, but always generates a merge commit (even if it was a fast-forward merge). This is useful for documenting all merges that occur in your repository.

* Three-way merge  
The above, is however not possible if the branches have diverged. When there is not a linear path to the target branch, Git has no choice but to combine them via a 3-way merge. 3-way merges use a dedicated commit to tie together the two histories. The nomenclature comes from the fact that Git uses three commits to generate the merge commit: the two branch tips and their common ancestor.

While you can use either of these merge strategies, many developers like to use fast-forward merges (facilitated through rebasing) for small features or bug fixes, while reserving 3-way merges for the integration of longer-running features. In the latter case, the resulting merge commit serves as a symbolic joining of the two branches.

```
git merge --squash <new-branch>
```

* Rebasing

