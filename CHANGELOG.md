# Changelog

Newest first. The app reads the same list from `version.json` and shows it under the version button, so keep the three in step: `version.json`, this file, and the `CHANGELOG` array inside `index.html`. The `release.sh` script does all three for you.

## v1.7.0

2026-08-20

* The ports panel now has a tray of the devices feeding that rack, grouped by kind, taking the tags and labels straight from the drawing.
* Drag a whole group onto a port to lay the run in from there, drag it onto a zone to fill the zone, or drag a single chip to peel one device off.
* Labels come from the naming on the drawing, so nothing gets retyped and the installer schedule matches the sheet.

## v1.6.0

2026-08-20

* Typical rack elevations. Racks built the same now print once, headed IDF1-IDF6, IDF8-IDF13, and the odd rack with an extra part gets its own page on its own.
* Copy this build to other racks clones the gear and the jumpers inside a rack into as many racks as you tick.
* Port zones. Set aside a run of ports with a name, a note and the device type it is reserved for, so the 2.5G ports say APs only and anything else landing there is flagged.
* Zones print as a legend on the rack page and get their own column on the patch schedule.

## v1.5.0

2026-08-20

* Patch schedules. A port can now say where the other end of its jumper goes, another rack item and a port on it, so the sheet names both ends instead of just what lands on the port.
* Patch straight through to... wires a switch into a patch panel one to one in a single go.
* Each rack prints its own patch schedule page: every jumper touching that rack, both ends with port numbers, what it carries, and a box to tick off.
* A port claimed by two jumpers is flagged, and a patch shows from both ends without being stored twice.

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
