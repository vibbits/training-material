---
layout: tutorial_hands_on

title: 9 GitHub Actions
zenodo_link: ''
questions:
- How to create automations in your GitHub repositories (e.g. testing)?
objectives:
- Find workflow templates for your project
- Explain how the workflow file is constructed
- Creating workflows that automate a variety of processes 
time_estimation: 20m
#key_points:
#- Initializing Git on a current project which uses R in Rstudio
#- Exploit the core utilities of Git within Rstudio
contributors:
- tmuylder

---

# 1. Introduction

GitHub Actions provide versatile and powerful automation processes in our repositories. It enables us to include Continuous Integration (CI) and Continuous Deployment (CD) capabilities in our project. CI/CD are concepts in software development representing the idea of continuously testing changes in the code, checking for proper functionality and pushing the changes into production mode (e.g. new release). Another possibility is creating an automated task with scripts from your repository, for example on each day at a given time we want to run a script that extracts data and creates a new plot. 


# 2. Steps

- Download the project folder & all its files
- Initialize git on this repository
- Create new empty GitHub repository and follow the steps to link the local repository with the new GitHub repository.
- Click on **Actions** and select set up a workflow yourself.
- Edit the default workflow `main.yml` file. 
    - Give it an appropriate name.
    - We only want to launch the workflow when we push changes to the *main* branch (remove the pull_request part and workflow dispatch)
    - Now we can define the jobs, such as the build process, leave ubuntu. The steps represent a sequence of tasks that we will run as part of the job. 
    - We will give each step a name and define its `uses` or what it needs to `run`. 

- Add secrets
    - Go to repository settings, find in the left bar *secrets* 
