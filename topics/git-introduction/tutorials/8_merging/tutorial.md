---
layout: tutorial_hands_on

title: 8 Merging and errors
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


# 4. Merge conflict
When the GitHub repository has diverged from your local copy, e.g. a collaborator edited a file to which you were also working, and you realize that after staging and committing your changes can't be pushed to GitHub. The following error message is probably displayed:
```
To github.com:tmuylder/github-tutorials
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:tmuylder/github-tutorials'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
GitHub proposes to pull the remote repository to your local repository first before pushing yours to GitHub. However, if you do this, you get the following conflict message:
```
CONFLICT (add/add): Merge conflict in conflictfile.txt
Auto-merging conflictfile.txt
Automatic merge failed; fix conflicts and then commit the result.
```
You get CONFLICT (add/add): Merge conflict in ... conflicts because the files are in fact not the same. You can see the difference using the `git diff` command, for example:
```
git diff branch1 branch2 -- path/to/file
```
where branch1 and branch2 are the names of the branches you want to compare, e.g. `git diff master origin/master -- ./conflictfile.txt`

Or, an easier way to see the difference, right after the failed `git merge` or `git pull` when you are in the conflicted state, you can simply run `git diff` without parameters, it will reveal the conflicted regions. This can, however, be a long list. When you type `git merge branch1`, git's output will propose several things. It will say that we're in the midst of a merging process. To save files that haven't been committed you can do this first. To abort the merging process, you can go for: `git merge --abort`.

To resolve such conflict, you have to decide which branch has the right content. You can do that by checking out the file from the appropriate branch, for example:
```
git checkout name_of_branch path/to/file
```
Sometimes the right content is a mix of the two files. In that case you have to resolve manually, possibly by studying the differences using the `git diff` command, as in the examples above.

To see the beginning of the merge conflict in your file, search the file (with your text editor) for the conflict marker <<<<<<<. When you open the file in your text editor, you'll see the changes from the HEAD or base branch after the line <<<<<<< HEAD. Next, you'll see =======, which divides your changes from the changes in the other branch, followed by >>>>>>> BRANCH-NAME.

Delete the conflict markers <<<<<<<, =======, >>>>>>> and make the changes you want in the final merge. In this example, both changes are incorporated into the final merge:

Add or stage your changes.
```
git add .
```
Commit your changes with a comment.
```
git commit -m "Resolved merge conflict."
```

The long-term solution is to avoid making conflicting changes to the same paths in different branches, which is typically a task sharing / communication issue between collaborators.



















# Changes & conflicts

# 2. Undo changes
There are numerous ways to undo changes in Git, where it all depends on what stage your finding yourself. A much more elaborate tutorial can be found [here](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/).
## 2.1 Before the staging area
Let's edit our `hamming_distance.py` file once more. Let's say we start counting from 1 (edit the fifth line) and save the file again. Check the file's status and verify that the changes are not staged for commit. Here git already tells you what you can do to undo your changes.
```
git restore hamming_distance.py
```
Alternatively, we could have used `git checkout HEAD hamming_distance.py`. Similarly, we could have used `git checkout <identifier> hamming_distance.py` to rewind to a specific version. (! it's important to fill in the identifier or HEAD)
## 2.2 Changes in the staging area
Let's edit our `hamming_distance.py` file again as described above. This time, add the changes in the file to the staging area, by using the `git add hamming_distance.py` command. Check that the file is in the right status. Again, git tells us what to do to undo our staged changes.
```
git restore --staged hamming_distance.py
```
By using `git status` we can see that the file is ready to be staged, however with `vim` we can see that the distance is still `1`. Use git restore as explained in §2.1 to undo the changes.

The fact that files can be reverted one by one tends to change the way people organize their work. If everything is in one large document, it’s hard (but not impossible) to undo changes to the introduction without also undoing changes made later to the conclusion. If the introduction and conclusion are stored in separate files, on the other hand, moving backward and forward in time becomes much easier.
## 2.3 Recovering older versions of a file
**Exercise 1**
We made changes to our `hamming_distance.py` Python script that we have been working on for weeks, and the modifications we made this morning ruined the script and it no longer runs. We've  spent ~ 1hr trying to fix it, with no luck…

Luckily, we've been keeping track of the project’s versions using Git! Which commands below will let us recover the last committed version of our `hamming_distance.py` script?
1. `git checkout HEAD`
2. `git checkout HEAD hamming_distance.py`
3. `git checkout HEAD~1 hamming_distance.py`
4. `git checkout <unique ID of last commit> hamming_distance.py`
5. Both 2 and 4

The answer is (5): Both 2 and 4.

The `checkout` command restores files from the repository, overwriting the files in your working directory. Answers 2 and 4 both restore the latest version in the repository of the file `hamming_distance.py`. Answer 2 uses `HEAD` to indicate the latest, whereas answer 4 uses the unique ID of the last commit, which is what `HEAD` means.

Answer 3 gets the version of `hamming_distance.py` from the commit before `HEAD`, which is NOT what we wanted.

Answer 1 can be dangerous! Without a filename, `git checkout` will restore all files in the current directory (and all directories below it) to their state at the commit specified. This command will restore `hamming_distance.py` to the latest commit version, but it will also restore any other files that are changed to that version, erasing any changes you may have made to those files! As discussed above, you are left in a detached `HEAD` state, and you don’t want to be there.

## 2.4 Changes after pushing to project repository
We'll describe this situation by means of an exercise. Mimic the situation that you've made some changes to the code of a project but all of your changes were crap... Edit the `hamming_distance.py` file, add it to the staging area and commit the change. Now, push the commit to the project repository.



**Exercise 2**
Jennifer is collaborating on her Python script with her colleagues and realizes her last commit to the project’s repository contained an error and she wants to undo it. `git revert [erroneous commit ID]` will create a new commit that reverses Jennifer’s erroneous commit. Therefore `git revert` is different to `git checkout [commit ID]` because `git checkout` returns the files within the local repository to a previous state, whereas `git revert` reverses changes committed to the local and project repositories.
Below are the right steps and explanations for Jennifer to use git revert, what is the missing command?

```
git log # Look at the git history of the project to find the commit ID

Copy the ID (the first few characters of the ID, e.g. 0b1d055).

git revert [commit ID]

Type in the new commit message.

Save and close
# so this doesn't works
638  git add hamming_distance.py
639  git commit -m "added last line hamming distance"
640  git status
641  git push origin master
642  git log -3
643  git revert 20d1de8
644  git log -3
645  vim hamming_distance.py
646  git status
647  vim hamming_distance.py
648  history
```

**Exercise 3**
What is the output of the last command in
```
cd planets
echo "Venus is beautiful and full of love" > venus.txt
git add venus.txt
echo "Venus is too hot to be suitable as a base" >> venus.txt
git commit -m "Comment on Venus as an unsuitable base"
git checkout HEAD venus.txt
cat venus.txt #this will print the contents of venus.txt to the screen
```
1. `Venus is too hot to be suitable as a base`
2. `Venus is beautiful and full of love`
3. `Venus is beautiful and full of love`
`Venus is too hot to be suitable as a base`
4. Some kind of error because you have changed venus.txt without committing the changes.

The answer is 2.

The command `git add venus.txt` places the current version of `venus.txt` into the staging area. The changes to the file from the second `echo` command are only applied to the working copy, not the version in the staging area.

So, when `git commit -m "Comment on Venus as an unsuitable base"` is executed, the version of `venus.txt` committed to the repository is the one from the staging area and has only one line.

At this time, the working copy still has the second line (and git status will show that the file is modified). However, `git checkout HEAD venus.txt` replaces the working copy with the most recently committed version of `venus.txt`.

# 3. Getting more information from old versions
Exploring history is an important part of Git, and often it is a challenge to find the right commit ID, especially if the commit is from several months ago. If you have a project with many files and lots of changes in a code (e.g. `hamming_distance.py`), you need some tricks to recover older versions.

`git log <file>` will help to narrow down the `git log` command to the file we're interested in. However, if you need to scroll through the changes of different commits, you need something else. `git log --patch <file>` will give a long list of output, and you should be able to see both commit messages and the difference between each commit. 