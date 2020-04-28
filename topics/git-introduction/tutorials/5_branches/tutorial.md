---
layout: tutorial_hands_on

title: 5 Branches
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
- contributor1
- contributor2

---

# 1. 

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

