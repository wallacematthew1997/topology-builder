# Riser Builder

An app for drawing low voltage and network riser diagrams, then handing the client a clean PDF.

Built for real field work: you type in what is going where, drag to link it, arrange it however the job actually looks, and print. Still one HTML file under the hood, so nothing can rot.

**Live app: https://wallacematthew1997.github.io/topology-builder/**

## Install it

1. Open https://wallacematthew1997.github.io/topology-builder/ in Chrome or Edge
2. Click the install icon in the address bar, or use the **Install app** button inside the version panel
3. It lands in your Start menu and taskbar with its own icon and its own window, no browser chrome

Once installed it works with no internet. Everything it needs is cached on the machine.

### Or just run the file

Save the page as `topology-builder.html` and double click it. Works offline, runs off a USB stick, emails fine. You give up one click updates, since a file cannot replace itself, but the app will still tell you when a new version is out and download it for you.

## Updates

The toolbar shows the version you are running. Click it.

* It checks for a newer release and shows you exactly what changed before you commit to anything
* A yellow dot on the version button means something new is waiting
* **Update now** pulls the new build and reloads, one click, done
* Your saved projects, drawings, and company branding are untouched by an update

Full history is in [CHANGELOG.md](CHANGELOG.md).

## What it does

**Diagram**

* Drag from a device to another device to create a link, then place the boxes wherever you want. Linking and layout are separate steps, so the drawing does not fight you.
* Devices carry a quantity, so seven APs in one IDF is one box with a count on it rather than seven boxes to drag around.
* Named container boxes group related gear. A box called "Door 1" can hold the card reader, the strike, and the REX together.
* Tag bubbles on every device, auto numbered by family. Cameras come out C01, C02, C03. There is a **Renumber all tags** action when the job changes.
* Auto arrange, tidy connections, space across, space down, shrink to fit, and alignment tools for when the sheet gets busy.
* Undo, copy, paste, duplicate, and multi select.
* Find box in the toolbar for jumping to a tag on a large sheet.

**Device library**

Around fifty device types across eight families, each with its own color and tag prefix:

| Family | Examples |
| --- | --- |
| Infrastructure | MDF, IDF, rack, patch panel, fiber enclosure, demarc |
| Network | firewall, gateway, core switch, PoE switch, AP, server, wireless bridge, data drop |
| Video and audio | NVR, camera, PTZ, monitor, intercom, speaker, amplifier |
| Access control | access panel, card reader, door, strike or mag lock, REX motion, push to exit |
| Alarm | alarm panel, keypad, motion, door contact, glass break, siren |
| Power | UPS, PDU, power supply |
| Audio video | encoder, switcher, control station, mixer, microphone, projector |
| Other | custom device, for anything not in the list |

**Cable media**

Links are typed, and each media type draws with its own color, weight, and dash pattern: Cat6, Cat6A, Cat5e, single mode fiber, multimode fiber, RG59 coax, 18/2, 22/4, composite, wireless, SDI, HDMI, XLR, and power.

**Rack elevations**

A rack view for laying out MDF and IDF gear by RU, with rack unit presets and fill checking.

**Schedules**

Device schedule and cable schedule generate off the drawing, so the counts on the list always match the picture. CSV export for both when the estimator wants numbers instead of a drawing.

**Sheet, cover, and title block**

Project title, company branding with a logo upload, revision letter, and a proper title block, so the deliverable looks like a submittal instead of a sketch. A cover tab builds a title page to go in front of the drawing set.

**Projects and revisions**

Multiple saved projects with an index, plus labeled revisions per project. Save a revision before a scope change so you can show the client what moved.

**Import and export**

JSON export and import for the full project, so a drawing travels between machines or gets checked into a job folder.

## Keyboard shortcuts

| Keys | Action |
| --- | --- |
| Ctrl+C / Ctrl+V | Copy and paste devices, including into another project |
| Ctrl+Z | Undo |
| Ctrl+F | Find by tag |
| Delete / Backspace | Remove the selection |
| Arrow keys | Nudge, hold Shift for one pixel |
| Mouse wheel | Zoom |
| Drag empty space | Pan |

## Where the data lives

Projects are stored in the browser using IndexedDB, under the database `riser-builder`. That means:

* Data stays on the machine that made it. Nothing is uploaded anywhere.
* Clearing site data or browser storage for the file wipes saved projects.
* A different browser, a different computer, or an incognito window will not see your projects.

So for anything you care about, use **Export file** to drop a JSON copy into the job folder. Treat IndexedDB as the working copy and the JSON as the record copy.

## Browser support

Built and tested against Chromium browsers, meaning Chrome and Edge. Those are also the two that support installing it as an app. Print to PDF uses the browser print dialog, so pick "Save as PDF" as the destination and turn on background graphics for the colors to come through.

Two fonts, Archivo Narrow and IBM Plex Mono, load from Google Fonts and then get cached for offline use. If they never load the app still runs, it just falls back to system fonts.

## Repo layout

```
index.html              the entire application, one file
sw.js                   offline cache worker
manifest.webmanifest    makes it installable
version.json            what the update check reads
icons/                  app icons
CHANGELOG.md            release history
release.sh              cut a new version in one command
```

The app is deliberately one file. No build step, no dependencies to install, nothing to break six months from now when you need to reopen an old drawing. The other files exist only to make it installable and updatable.

## Publishing a new version

```
./release.sh 1.2.0 "What changed" "Another thing that changed"
git push && git push --tags
```

That bumps the version in `index.html`, `sw.js`, and `version.json`, writes the entry into `CHANGELOG.md` and into the app's built in changelog, commits, and tags. GitHub Pages redeploys within a minute or two, and every installed copy sees the update on its next check.

## Editing it

Open `index.html` in an editor. The structure runs top to bottom:

* CSS in the `<style>` block at the top
* `FAM` and `DEV` near line 418, the device families and the device catalog
* `MEDIA` just after, the cable types
* Rendering and drag logic in the middle
* Storage, projects, and revisions near the bottom
* Version, changelog, and the updater at the very bottom

Adding a device type is one line in `DEV`: a key, a display name, a tag prefix, a family, and a glyph.

## Roadmap ideas

* Print scaling presets for 11x17
* Port level detail on switches
* Floor plan underlay
* Direct BOM export shaped for the estimating template
* Optional sync so the same project opens on the office machine and the truck laptop
