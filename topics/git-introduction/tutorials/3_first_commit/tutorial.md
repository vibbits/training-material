---
layout: tutorial_hands_on

title: 3 First commit
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
As mentioned in the first chapter, there are three conceptual areas in Git: the development area, the staging area and the commit repository. The routine usage is depicted in the figure below. When we want to save a file from the development area on our computer to the commit repository, we'll always have to add it to the staging area first, before we can commit it. The usual routine looks like this: 

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

<center><img src="../../images/conceptual_areas_push.png" /></center>


There are two ways of **initializing a new Git repository**:
- Clone a GitHub repository (from GitHub): see Section 2
- Initialize Git on a folder on your computer: see Section 4   
Both options will work fine and depends on your preferences or maybe the situation of the project. The first option can be used if you're about to start a new project, the second option can be used when you already have some files in a project which you now want to start version controlling. 



# 2. Create a new repository from GitHub

Go to your GitHub homepage and click the '+' icon in the upper right corner. The following screen will pop up.


<center><img src="../../images/02-2-create-repository.PNG" /></center>


We already filled in a repository name and an optional description. You can choose to already publish your repository, however as this is a meaningless repository, we will choose not to. When you're about to start a new project, there are three things to consider:
- For a new repo, it's a good practice to initialize the repo with a README file. This file will eventually include a decscription about the repository and all of the code or files in it (e.g. information about the scripts, version, disclaimers, etc.)
- Adding an `.ignore` file is something we will cover later, however for now it suffices to know that the .ignore file will contain some code which tells git to exclude certain files which reside in your local folders from uploading to the external GitHub repo.
- Adding a license makes sense when your project becomes public. It defines under which license the content is made available.

In our case, we will initialize the repository with a README file and click 'Create repository', which will then look like this:

<center><img src="../../images/02-3-create-readme-repository.PNG" /></center>

This is the home directory of a GitHub repository. From here we can already do a lot, like changing or uploading files. 

If you want to make a local copy of the repository, we have to **clone** it to our computer. Click on the green button 'Clone or download' and copy the link.  Within the Git Bash (or Terminal), navigate to the folder where you want to keep your project folder and type the following:
```
git clone <link>
```
with `<link>` being the link from GitHub. 

---

> ### {% icon hands_on %} Exercise 1
>
>  Create a new GitHub repository, give it a name and initialize it with a `README`-file. Upload [this file](../../../../assets/files/git-introduction/plot1.R) to the repository on GitHub. What is GitHub asking you to do? Which stage is ommitted when uploading a file directly to GitHub?  
> 
> Clone the repository to your computer. How many files are there in your local repository?
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    > Click on upload files and drag the file into the screen. GitHub is asking to add a commit message which defines the changes that you'll do to your repository. In this case we'll add the very brief *Upload R script* message. Notice that there is no staging area when you upload a file directly on GitHub. 
>    > 
>    > <center><img src="../../images/solution1.PNG"/></center>
>    > 
>    > Click on 'Commit changes' and find the two files: `README.md` and `example.R` in your repository. Now, we can find the clone link via the green 'Clone or download' button. In our Terminal we type the following command to start using the repository locally on our computer: 
>    > ```
>    > git clone <link>
>    > ```
>    > in which you change `<link>` to the link that you copied from GitHub. There should be two files in your local repository as well.   
>    > On a Windows computer we have a folder that contains the following files:
>    > ![windowsfolder](../../images/folder1.PNG)
>    > </details>
>
{: .hands_on}
---

# 3. Our first commit
Our local copy (clone) of the GitHub repository is now able to communicate with the GitHub repository. Every change within this repository is traceable, whether it is a new file or changes to a file. When you make changes in your local repo (e.g. create a new file), you have to add the file to the staging area first (`git add`) and then commit it (`git commit`) before pushing it (`git push`) to your GitHub website repo. 


## 3.1 Staging
Let's add a new file to our folder. Download [this file](../../../../assets/files/git-introduction/plot2.R) and copy paste it in our project folder. It contains some R code for plotting a new figure.  

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

---
> ### {% icon question %} Question
> 
>  Which of the following commit messages would be most appropriate for a hypothetical commit made to our `README.md` file?
>   - “Update README file”
>   - “Added line ‘We use this repo as an example’ to README.md”
>   - “Added purpose description to the README file”
> > ### {% icon solution %} Solution
> >
> > One can argue on the appropriatness of commit messages as it is subjective. In this case however, the third options seems most ideal. It's both not too generic and not too specific. 
> >
> {: .solution}
>
{: .question}

---

---

> ### {% icon question %} Question
> 
> What has happened after committing?
>   - We saved a version of the file which is now visible on GitHub.com
>   - We saved a version of the file which is now stored in our commit repository
>
> > ### {% icon solution %} Solution
> >
> > We've been working locally uptil now and didn't push the commits to the GitHub repository, hence it's still in our commit repository. 
> >
> {: .solution}
>
{: .question}

---


## 3.3 Push commits to GitHub
Recall that when we added the first file on GitHub (exercise 1), it was immediately committed and showed up right away in the GitHub repository. Unfortunately, when we've changed some files locally and we commit them to our commit repository, GitHub doesn't know this yet. Hence, we have to do one final step: 
```
git push
```
Have a look on your GitHub repository and verify that the new file is now in your repository. 


## 3.4 Stage-commit-push
We've learned how to make a GitHub repository, clone it to our computer, add a file, commit it and push it back to GitHub. This is everything you need to know for a routine usage of Git(Hub) on one of your projects. In order to grasp this concept a bit better, we'll repeat it by making changes on both files in the next exercise. 


---

> ### {% icon hands_on %} Exercise 2
>
>  Add a title to both files ("# Title plot 1" and "# Title plot 2"). You can choose how you do this: e.g. open the files in a text editor and add the line on top of the file. Follow the steps here above to push your changes to our GitHub repository. 
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
>    > </details>
>
{: .hands_on}
---




# 4. Create a new repository from your computer
As discussed here above, you can also create a repository from your computer. The command that we use for this is:
```
git init
```

The first thing we have to do is to make a new folder which will contain the files of the project in case you don't have one yet. In Git Bash (Windows) or in your Terminal (Mac, Linux), move to the project folder you just created or to the folder that contains the files of a project. 

- When you're in that folder, you have to type `git init` to initialize a Git repository.  
- Open GitHub.com, create a new repository and DO NOT initialize it with a README.md, .gitignore or license. You can add that later. 
- Go back to your Terminal and use the following commands to make a link between your local repository and the repository on GitHub: 
  ```
  git remote add origin https://github.com/<username>/<repository>.git
  ```
  Notice that this link can also be found from the green 'Clone or download' button on GitHub.
- Add the file(s) in your folder to the staging area, commit it and push it to GitHub with the following commands:
```
git add <file>
git commit -m "some text"
git push -u origin master
```

It is important to note that `git init` will keep track of all the subdirectories and their files that are in the folder. Thus, you don't need to create a git repository for each folder or subdirectory.  

As a best practice, it's suggested to have a git repository for each project and they are separated in folders. Git repositories can interfere with each other if they are “nested”: the outer repository will try to version-control the inner repository. Therefore, it’s best to create each new Git repository in a separate directory.

If we use `ll` or `ls -a` we get a list of all files and directories, and we see that a `.git` folder is now present. Git uses this special directory to store all the information about the project like the history of all commits. If we ever delete the `.git` sub-directory, we will lose the project’s history.


Before starting with the next exercise we also want to stress the importance of not uploading data to GitHub. It's good practice to have links to data, however not the data itself. GitHub is not your next cloud storage instance. 

---

> ### {% icon hands_on %} Exercise 3
>
>  Find a folder on your computer with some files that you want to version control, initialize Git on that folder and make it (privately) available on GitHub. 
> 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    > See the steps in Section 4.  
>    > </details>
>
{: .hands_on}
---


# 5. The strength of the staging area
Now you're probably wondering why it's useful to have that many steps to save a file (add, commit, push). We will give a practical example based on the figure below: 

<center><img src="../../images/staging_area.png" /></center>

Imagine that you're working on a project with multiple Python scripts and you're working on all of them. In this case your folder in your development area contains the files  `scriptA.py`, `scriptB.py` and `scriptC.py`. The changes that you made in script A and script C are somehow related, but script B is not. It's good practice to make commits in which changes that are related to each other are bundled. Hence, in this case we want to make one commit with the changes from file A and C. Now we can simply add scripts A and C to the staging area and commit it. The changes in script B will remain unsaved until we commit the changes in a separate commit. 

It's always better to have more commits; in case you want to remove part of your work in a later stage, or you want to start your work again from a specific commit. 