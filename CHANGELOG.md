# Changelog

Newest first. The app reads the same list from `version.json` and shows it under the version button, so keep the three in step: `version.json`, this file, and the `CHANGELOG` array inside `index.html`. The `release.sh` script does all three for you.

## v1.4.0

2026-08-20

* The backup now gets its own folder. Pick where to keep it once and the app makes a Riser Builder folder there, with a Saves folder inside holding one .json per project.
* A read me goes in beside it explaining what the files are and how to load one back.
* Pointing it at the Riser Builder folder itself no longer nests a second one inside.

## v1.3.0

2026-08-19

* Backup folder: pick a folder once in Projects and every save also writes a plain .json copy of the project there, so your work is not trapped in browser storage.
* Linking a folder writes every project you already have, not just the open one.
* The toolbar says when there is no copy on the computer yet, and Projects says when the folder needs permission again.
* The app now asks the browser to keep its storage permanently, so projects are not cleared when the disk gets tight.
* Autosave no longer waits for a first manual save, so a new drawing cannot be lost by closing the tab.

## v1.2.0

2026-08-19

* Reorder the device sidebar: the arrows button beside Devices lets you drag rows inside a section, or drag a section heading to move the whole block. The order is remembered on this machine.
* Cable ends place by hand: pick a run and drag the white dot at either end anywhere around the outside of its device. Double click a dot, or Reset ends, puts it back on automatic.

## v1.1.1

2026-08-19

* Removed the device and cable run totals from the top of the riser diagram page in the PDF.

## v1.1.0

2026-08-19

* Installs as a real app with its own window, taskbar icon, and offline use.
* Version button in the toolbar with a one click update check.
* Built in changelog so you can see what changed before updating.
* Update now button pulls the new build and reloads, no file swapping.
* Drawings and saved projects survive an update untouched.

## v1.0.0

2026-08-11

* First release.
* Drag to link devices, then place them freely.
* MDF to IDF to device hierarchy with auto numbered tag bubbles.
* Named container boxes and per device quantity counts.
* Rack elevations, device schedule, and cable schedule with CSV export.
* Projects and revisions saved locally, JSON export and import.
* Title block, cover sheet, company branding, and print to PDF.
