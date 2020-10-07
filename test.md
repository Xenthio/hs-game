# Setting up Git

Download Git:
- Windows: Download and install [Git for Windows](https://git-scm.com/downloads).
- Mac: type ```git``` in terminal, if git isn't installed already, it will prompt you to install it. Git can also be installed with [Homebrew](https://brew.sh).
- Linux: If it isn't installed already, install git using your distro's [Package Manager](https://www.debian.org/doc/manuals/aptitude/pr01s02.en.html).

## Forking the main repository

Fork the mapbase repository by clicking [here](https://github.com/mapbase-source/source-sdk-2013/fork).
Keep the url of the repo handy

Open up the terminal or command prompt of your choice.

Type ```git clone <REPO-LINK>``` 
###### Clones the repo to your computer. (EXAMPLE: ```git clone https://github.com/xenthio/source-sdk-2013```)

This will clone to a folder in your command lines current directory, you can move this folder after.

## Committing and Pushing Changes

For the people who have never used git, i'll quickly go over this.
Whenever you make a change (or whenever you feel like it) you should commit and push the change (upload it to the repo).

Do this by changing to your repo's directory and typing:

```git add path/to/file.txt```
###### Adds the file to the commit, do ```git add .``` to add all changed files.

```git commit -m "Change Message"```
###### Commits the files, the message can be anything, e.g "Cleaned up code" or "Squashed some bugs", makes it easy to tell which commit changed what.

```git push```
###### Upload all commits you just made to the repo.

## Merging the main Repo with yours
When ever an update is pushed for mapbase you can merge the changes into your repo.
First push whatever changes you've made to your repo since your last push before doing this.

Head over to the terminal, change to your repo's directory and type:

```git fetch upstream```
###### Gets all commits from the mapbase master branch into a temporary branch.

```git checkout master```
###### Go's back to the normal master branch of your repo.

```git merge upstream/master```
###### Merges the master branch with the mapbase master branch.
