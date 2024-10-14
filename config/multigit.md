**check git remove by this command**

```git remote -v```

**Add second github remote**

```git remote add github https://github.com/organization/repo.git```

**check remote again**

```git remote -v```

**You can also remove old remote**

```git remote remove origin```
**(change origin name according to you old remote-name)**

**From Now You should git pull/push with name of remotes:**
```
git pull <remote-name> <branchname>
git pull github stag
```

**Changes Upstrem Branch for New Remote**

```git branch --set-upstream-to=github/master main```