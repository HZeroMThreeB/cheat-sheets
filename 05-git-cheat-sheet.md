# git cheat sheet

```
mkdir <git-dir>
git init <git-dir>

```
- or

```
cd <git-dir>
git init
```
# configuring user

```
git config --global user.name "user"
git config --global user.email "user@mail.com"
git status
```
# create your original files/codes/&c

```
git add .

git status

git commit -m '<commit>'
```

# NEVER use "main"/"master" branch

- so:

```
git checkout -b branch_01

git branch

git add . # all files

git status

git commit -m '<commit>'

git log
```

# UPDATING MASTER

```
git checkout master

git merge <branch>
```

# DELETING A BRANCH

```
git branch -d <branch>

git branch -D <branch> # to force
```

# REMOTE ADD CONTENT

```
git remote add origin git@github.com:user/dir.git

git push -u origin master
```