---
layout: tutorial_hands_on

title: 6 Forks
zenodo_link: ''
questions:
- How to collaborate on a(n existing) project
objectives:
- Understand and being able to apply GitHubs Fork & pull workflow
- Pull upstream commits to a forked repository
time_estimation: 30m
contributors:
- tmuylder

---


# 1. Introduction
In this chapter we will discuss a strategy for collaborating on projects. These strategies are especially useful when we do not have authorisation to change the content of someone else's project, even though we still have a useful edit/suggestion in mind.  

Imagine that you're starting a project with some colleagues and you want to version control the project. If it were to be a document where each of you needs to write part of it, you could simply start a Google Doc. For coding purposes the situation is a bit more complex. There might be a base version of the code already to which you need to add separate parts, however you always need to test whether your part is working together with the rest of the code. 

For this purpose, GitHub encourages the Fork & Pull workflow. Basically one **forks** a central repository, making it a personal forked repository. This repository can constantly be up to date with the central repository by merging those upstream changes in your personal forked repository.  

After you forked a repository, it will appear as a new repository in your GitHub account. The next step would be to **clone** the repository locally so you can work on the project from your computer. It's always a good idea to make changes in a **new branch** and keep the *main* branch clean. Hence, after cloning the repository, you could make a new branch. Editing the files, staging, committing and pushing your changes remains the same and they will appear in your new personal forked repository. 

When you are happy about your changes, when all the commits are pushed to your forked repository, these changes can be merged back into the central repository by creating a **pull request**. The main author can now decide whether he/she is happy about your suggestions and can include (part of) them. This workflow leaves the central repository untouched untill the moment you want to incorporate changes.

---

![Representation of forking & pulling](../../images/fork_pull.png)

---


Two important terms in this fork & pull workflow are:
- `upstream`: generally refers to the original repository that you have forked
- `origin`: is your fork: your own repository on GitHub  

As mentioned in section 4.4, the "origin" is used to refer to the GitHub original repository's URL. This also lasts here. The remote `origin` refers to your fork on GitHub, not the original repository it was forked from. 

To summarize the above, the Fork & Pull workflow consists of the following steps:
1. Fork
2. Clone
3. Branch
4. Stage-commit-push
5. Pull request

# 2. Fork
Let's explore GitHub first. GitHub is like the Facebook of programmers. You can see someone's account, what that person has been working on, find new projects (relatable to a Facebook page), etc. Exploring new repositories is possible by clicking on the 'Explore' button in the navigation bar. Searching a specific repository or searching for an account, on the other hand, is possible by simply typing it in the search bar in the navigation bar. 

---
<center><img src="../../images/nav-bar.PNG" /></center>

---

Search for the VIB Bioinformatics Core account 'vibbits' and find the repository 'fork-repository'. This repository was made specifically for learning the concept of forking. Do this by clicking the fork button in the upper right corner.

---
<center><img src="../../images/fork-button.PNG" /></center>
---


The repository has been successfully forked if you see something similar to the figure below. The icon represents a fork, followed by your GitHub account name and the name of the repository. The second line tells us that the upstream repository is the 'vibbits/forked-repository'. 

---

<center><img src="../../images/forked-repository.PNG" /></center>
---


# 3. Changes
Clone this repository locally, make a branch (e.g. name it *yourname*) and do some edits in that branch. Add your name, accountname or initials and the date to the `participants.txt` file. For this exercise we will only edit the `participants.txt` file. The flow here remains the same: stage-commit-push. After these changes took place, we will have a similar situation 

---

<center><img src="../../images/edited-forked-repository.PNG" /></center>
---


In normal circumstances it is possible that the upstream repository has changed in the meantime. The indicator would then note that there are new commits in the upstream (`1 commit behind vibbits:main`), while the branch/repository itself is one commit ahead.  

---

<center><img src="../../images/forked-repository-ahead.PNG" /></center>
---

This does not (really) affect the pull request. In any case, the following step is to create a pull request.

# 4. Pull request
The two repositories have diverged during the previous steps. Now its time to create a pull request between these repositories. After clicking the **Pull request** a new screen pops up that looks very similar to the one seen in Chapter 5 (Branching & merging). Note that moste developers do not really appreciate it if you try to merge your changes straight into the *main* branch. Usually, they would write some suggestions as to how we can collaborate on a project preferably. Let's assume that the developers of this repository expect you to merge changes into the *dev* branch, than it would look something like this:

---

<center><img src="../../images/forked-pull-request.PNG" /></center>
---

GitHub tells us:
- It compared the main branch of the forked repository (in my case *tmuylder/fork-repository*) with the upstream (base) repository *vibbits/fork-repository*. 
- It's able to merge these two branches without any conflicting errors
- It summarizes the changes that have been done in the branch that will be merged into the upstream.  

If all seems good, we can create the pull request. In the case that there are any conflicting errors, they will need to be solved first. Afterwards we only need to add a message that accompanies the pull request. 

A brief overview of the pull request is given in the following screen which either allows you to merge the pull request into the upstream repository yourself or which requests the maintainer of the upstream repository to review and merge the pull request. In the latter case, the maintainer will thereafter receive a notification showing the pull request. An overview of all pending pull requests where you are involved in, are consultable on the [pull requests](https://github.com/pulls) tab of the navigation bar.   


# 5. Overview
This is the easiest collaboration you'll probably do in a lifetime. To briefly summarize, the steps that we took were: *fork > edit > pull request (> merge)*. As mentioned before this is only possible if the upstream repository didn't change (too much). If this were to be the case, there might be one additional step in which you have to solve conflicts in the pull request. 

If your changes were a bit more complex and needed to be performed on your local computer, the steps would extent to:

To briefly summarize, the steps that we took were: *fork > clone(> branch > edit-stage-commit-push > pull request (> merge)*. 
What if the upstream repository changed while you were working on your local repository? In this case a pull request should be done in which the receiving branch is your forked repository. Hence, the order of the branches as depicted in the figure above would be swapped.    



---

> ### {% icon hands_on %} Exercise 
>
> Merge upstream changes in your forked repository. This approach is useful if you are working on a project that is prone to lots of changes and you need to keep up to date. 
> Note: This exercise is only possible to be performed if the repository `vibbits/fork-repository` has changed after you forked it.  
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    > You need to merge any upstream changes into your version, and you can do this with a pull request on GitHub too. This time though you will need to switch the bases of the  comparison around, because the changes will be coming from the upstream version to yours. First find the following notification in your repository and click on pull request:  
>    > <center><img src="../../images/Exercise-fork-1.PNG" /></center>
>    > In my case, the order is not how it's supposed to be and the message reads: "There isn't anything to compare. vibbits:main is up to date with all commits from tmuylder:main.". Click on *switching the base* in order to insert the changes from the upstream in your forked repository.  
>    > 
>    > A message similar to the following will allow to create a pull request and subsequently merge the changes into your forked repository. 
>    > 
>    > 
>    > <center><img src="../../images/Exercise-fork-2.PNG" /></center>
>    > 
>    > 
>    > </details>
> 
{: .hands_on}

---
 

Let's continue with the [next session](https://material.bits.vib.be/topics/git-introduction/tutorials/7_gitignore/tutorial.html)!
