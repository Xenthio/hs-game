# Setting up Git

You can download git for windows [here](https://git-scm.com/downloads).

## Creating your own repository

Fork map base by clicking [here](https://github.com/mapbase-source/source-sdk-2013/fork).
Keep the url of the repo handy

Open up the terminal or command prompt of your choice.

Type ```git clone <REPO-LINK>``` 
###### (EXAMPLE: ```git clone https://github.com/xenthio/source-sdk-2013```)

## Committing and Pushing Changes

For the people who have never used git, i'll quickly go over this.
whenever you make a change (or whenever you feel like it) you should commit and push the change (upload it to the repo)
Do this by typing

```git add path/to/file.txt```
###### adds the file to the commit, do ```git add .``` to add all changed files

```git commit -m "Change Message"```
###### commits the files, the message can be anything, e.g "Cleaned up code" or "Squashed some bugs", makes it easy to tell which commit changed what.

```git push```
###### upload all previous commits to the repo.

## Merging the main Repo with yours
When ever an update is pushed for mapbase you can merge the changes into your repo
First push whatever changes you've made to your repo since your last push before doing this.

head over to the terminal and type

```git fetch upstream```
###### gets all commits from the mapbase master branch into a temporary branch

```git checkout master```
###### go's back to the normal master branch of your repo

```git merge upstream/master```
###### merges the master branch with the mapbase master branch
