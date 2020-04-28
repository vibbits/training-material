---
layout: tutorial_hands_on

title: 6 Forks
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


# 1. Collaborating to an open-source project

## 1.1 Introduction
Version control really comes into its own when we begin to collaborate with other people. We already have most of the machinery we need to do this; the only thing missing is to copy changes from one repository to another.

Systems like Git allow us to move work between any two repositories. In practice, though, it’s easiest to use one copy as a central hub, and to keep it on the web rather than on someone’s laptop. Most programmers use hosting services like GitHub, Bitbucket or GitLab to hold those master copies; we’ll explore the pros and cons of this in the final section of this lesson.

Two words that you'll often hear people say when discussing git are "fork" and "clone". They are similar, however not interchangeable. The clone operation is built into git, whereas forking is an operation which is used by a certain git workflow, made popular by GitHub: the Fork & Pull Workflow.

The difference between forking and cloning is really a difference in intent and purpose:
* The fork & pull model lets anyone fork an existing repository and push changes to their personal fork without requiring access be granted to the source repository. The changes must then be pulled into the source repository by the project maintainer. This model reduces the amount of friction for new contributors and is popular with open source projects because it allows people to work independently without upfront coordination.
* The forked repository is mostly static. It exists in order to allow you to publish work for code review purposes. You don't do active development in your forked repository (in fact, you can't; because it doesn't exist on your computer, it exists on GitHub's server in the cloud).
* The cloned repository is your active repo. It is where you do all your work. But other people generally don't have access to your personal cloned repo, because it's on your laptop. So that's why you have the forked repo, so you can push changes to it for others to see and review

![Sketch of forks, locals and clones](../images/fork-clone-representation.PNG)

Two important terms in this phylosophy are:
- `upstream`: generally refers to the original repo that you have forked
- `origin`: is your fork: your own repo on GitHub  
When a repo is cloned, it has a default remote called `origin` that points to your fork on GitHub, not the original repo it was forked from.
To keep track of the original repo, you need to add another remote named `upstream`.

## 1.2 Fork a repository
Visit the following website: https://github.com/evildmp/afraid-to-commit/. You can do various things there, including browsing through all the code and files since the repository has been published publicly.  
Hit the Fork button & notice a few moments later that you’ll have your own copy, on GitHub, of everything in that repository, and from now on you’ll do your work on your copy of it. It refreshes instantaneously and on the upper left you can see `your-github-account/afraid-to-commit`. Now, your copy is at the GitHub (remote) repository `https://github.com/<your-github-account>/afraid-to-commit/`.

You will typically do this for any Git project you want to contribute to. It’s good for you because it means you don’t have to sign up for access to a central repository to be permitted to work on it, and even better for the maintainers because they certainly don’t want to be managing a small army of volunteers on top of all their other jobs.

## 1.3 Create a new branch & edit
Don’t edit the `master` (default) branch of the repository. It’s much better to edit the file in a new branch, leaving the `master` branch clean and untouched:

There are two ways of doing this: locally (after cloning) or on the GitHub website (graphically). We will show the second way here:
1. Click the button: 'Branch: master'
2. In 'Find or create a branch...' enter `add-my-name`
3. Hit 'Create branch': add-my-name

As you may have noticed on GitHub, a repository can have numerous branches within it. Branches are ways of organising work on a project: you can have a branch for a new feature, for trying out something new, for exploring an issue - anything at all.

Just as virtualenvs are disposable, so are branches in Git. You can have too many branches, but don’t hesitate to create new ones; it costs almost nothing.

It’s a good policy to create a new branch for every new bit of work you start doing, even if it’s a very small one. It’s especially useful to create a new branch for every new feature you start work on.

Now, let's make an edit on one of the files in the Github repository (note: make sure the branch is the branch you just created):
1. Find the attendees_and_learners.rst file
2. Hit the Edit button
3. Add your name on the bottom of the list (just your name, you will add other information later) to the appropriate place in the file.
4. Enter some meaningful text in the 'Commit changes' section below, and save by clicking the green 'Commit changes'-button.

Now your copy of the file, the one that belongs to your fork of the project, has been changed; it’s reflected right away on GitHub. If you managed to mis-spell your name, or want to correct what you entered, you can simply edit it again.

What you have done now is make some changes, in a new branch, in your own fork of the repository. You can see them there in the file.

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

**Some additional comments**
* GitHub will notify the owner of the forked repo (by email and on the site, and will show the changes you’re proposing to make). It’ll tell whether they can be merged in automatically, and the owner can reject, or accept, or defer a decision on, or comment on, the pull request.

* GitHub can automatically merge your contribution into the upstream repository if the repo hasn’t changed too much since you forked it. If the owner wants to accept it but GitHub can’t do it automatically, it will have to be done manually (we will cover this later).

* Once they’re merged, your contributions will become a part of [https://github.com/evildmp/afraid-to-commit](https://github.com/evildmp/afraid-to-commit). And this is the basic lifecycle of a contribution using git: *fork > (branch >) edit > commit > pull request > merge*.

**Question**  
What would be the commands/verbs if we want to edit the repo locally? Hint: we need two additional tasks in the workflow. Do this. Clone the forked repo locally, switch to the branch you just created, edit the `attendees_and_learners.rst` file (e.g. add the date), commit and push your changes to your forked repo (origin - your-branch).

## 1.5 Incorporate upstream changes into your master
In the meantime, other people may have made their own forks, edits, commits, and pull requests, and the owner may have merged those too - other people’s names may now be in the list of attendees. Your own version of afraid-to-commit, *downstream* from the owner's original repo, doesn’t yet know about those.

You need to merge any *upstream* changes into your version, and you can do this with a pull request on GitHub too. This time though you will need to switch the bases of the comparison around, because the changes will be coming from the *upstream* version to yours.

Hit 'Pull Request' and switch the project base and branch around so the merge happens from the *upstream* version to yours. The approach is identical as described above. For the sake of completeness, we will here explain how to do it locally.

1. List the current configured remote repository for your fork  
  `git remote -v`  
2. Specify the remote *upstream* repository from where we need to sync.   
  `git remote add upstream git://github.com/evildmp/afraid-to-commit.git`  
  You will use `upstream` to **fetch from the original repo** (in order to keep your local copy in sync with the project you want to contribute to).
3. Verify the new upstream repository you've specified with `git remote -v`
4. Update/sync your fork with the *upstream* by  
  `git fetch upstream`  

**Note**:
* `git fetch` alone would fetch from `origin` by default, which is not what is needed here.
* You will use `origin` to **pull and push** since you can contribute to your own repository. You can do this without parameters because `origin` is used by default.
```
git pull  
git push
```
Note that here instead of `git pull`, we could have done `git fetch` followed by `git merge`. The pull operation does two things: it fetches updates from your GitHub fork (origin), and merges them.

However, be warned that occasionally `git pull` won’t always work in the way you expect, and doing things the explicit way helps make what you are doing clearer. `git fetch` followed by `git merge` is generally the safer option.

You will contribute back to the  `upstream` repo by making a **pull request**.


# Exercise
Fork github repo from vibbits, make a branch, make changes to my script, commit and push, make pull request.
I must have made some changes by the time they ask for pull request. So they have to fetch and merge (= pull) my changes in their code so it works for them and then pull request again.