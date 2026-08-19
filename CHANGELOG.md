# Changelog

Newest first. The app reads the same list from `version.json` and shows it under the version button, so keep the three in step: `version.json`, this file, and the `CHANGELOG` array inside `index.html`. The `release.sh` script does all three for you.

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
