# Getting this onto GitHub

This folder is already a git repository with two commits on `main`. It just needs a remote and a push.

## Step 1: create the empty repo

Go to https://github.com/new

* Owner: `wallacematthew1997`
* Repository name: `topology-builder`
* Visibility: **Private**
* Leave "Add a README", ".gitignore", and "license" all UNCHECKED. The repo must be empty.

Click **Create repository**.

## Step 2: push

Open a terminal in this folder and run:

```
git remote add origin https://github.com/wallacematthew1997/topology-builder.git
git push -u origin main
```

If a remote named `origin` already exists, use this instead of the first line:

```
git remote set-url origin https://github.com/wallacematthew1997/topology-builder.git
```

If you would rather use the GitHub CLI and have it installed and logged in, steps one and two collapse into one command:

```
gh repo create topology-builder --private --source=. --remote=origin --push
```

## No terminal handy

Create the empty private repo as in step one, then use the GitHub web uploader at
`https://github.com/wallacematthew1997/topology-builder/upload/main` and drag in
`topology-builder.html`, `README.md`, `LICENSE`, and `.gitignore`. You lose the local
commit history that way, but the code lands.
