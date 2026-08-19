# Getting this onto GitHub, and turning on the app

Do these once. After that, releasing a new version is one command.

## Step 1: create the repo

Go to https://github.com/new

* Owner: `wallacematthew1997`
* Repository name: `topology-builder`
* Visibility: **Public**
* Leave "Add a README", ".gitignore", and "license" all UNCHECKED. The repo has to start empty.

Public matters here. GitHub Pages hosts the app, and the update check reads a file from it. On a private repo neither works without a token.

## Step 2: push

Open a terminal in this folder:

```
git remote add origin https://github.com/wallacematthew1997/topology-builder.git
git push -u origin main
```

If `origin` already exists, swap the first line for:

```
git remote set-url origin https://github.com/wallacematthew1997/topology-builder.git
```

## Step 3: turn on GitHub Pages

1. Go to `https://github.com/wallacematthew1997/topology-builder/settings/pages`
2. Under **Build and deployment**, set Source to **Deploy from a branch**
3. Branch: `main`, folder: `/ (root)`
4. Save

Give it a minute or two. The app then lives at:

**https://wallacematthew1997.github.io/topology-builder/**

## Step 4: install it

Open that address in Chrome or Edge. Click the install icon at the right end of the address bar, or open the version button in the app toolbar and hit **Install app**.

You now have Riser Builder in your Start menu with its own window and icon, working offline.

## Releasing a new version later

```
./release.sh 1.2.0 "Fixed the cable schedule totals" "Added conduit fill column"
git push && git push --tags
```

That updates the version everywhere, writes the changelog, commits, and tags. Pages redeploys on its own. Next time you click the version button in the app, the update is there.

## If the update check says it cannot reach the server

* Confirm `https://wallacematthew1997.github.io/topology-builder/version.json` opens in a browser
* If it 404s, Pages is not on yet, or the deploy has not finished, or the repo is private
* The app itself keeps working offline either way, the check is the only thing that needs a connection
