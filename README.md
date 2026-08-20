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
* Pick a cable run and both ends grow a white dot. Drag a dot anywhere around the outside of its device to say exactly where that end lands, one end at a time. Double click a dot to hand that end back to automatic, or use **Reset ends** in the panel to release both.
* Devices carry a quantity, so seven APs in one IDF is one box with a count on it rather than seven boxes to drag around.
* Named container boxes group related gear. A box called "Door 1" can hold the card reader, the strike, and the REX together.
* Tag bubbles on every device, auto numbered by family. Cameras come out C01, C02, C03. There is a **Renumber all tags** action when the job changes.
* Auto arrange, tidy connections, space across, space down, shrink to fit, and alignment tools for when the sheet gets busy.
* Undo, copy, paste, duplicate, and multi select.
* Find box in the toolbar for jumping to a tag on a large sheet.

**Device library**

Around fifty device types across eight families, each with its own color and tag prefix. The arrows button beside **Devices** at the top of the sidebar turns on reordering: drag a row to move it inside its section, drag a section heading to move the whole section, and put the gear you sell most at the top. The order is remembered on that machine and applies to every project, so it is a preference rather than something that travels with a drawing. **Reset order** puts the list back the way it shipped.


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

**Typical racks**

Thirteen IDFs built the same do not want thirteen identical elevation pages. Racks are matched on the gear itself, ignoring what each one links to on the drawing, and identical ones print once as a typical elevation headed `IDF1–IDF6, IDF8–IDF13`. Add one extra part to IDF7 and it drops out of the group onto its own page without anyone having to say so. The Rack tab tells you which racks the open one matches, and a tick box forces it onto its own page regardless.

To build them in the first place, **Copy this build to other racks** takes the open rack's gear, and any jumpers that stay inside it, into as many racks as you tick. Device links, port assignments and uplinks to another rack stay behind, since those are different in every rack that gets the copy.

Ports and jumpers always print per rack, never typical, because they are what differs.

**Closet numbering**

Two ways to number field devices, set under Sheet.

*Per kind* is the default: cameras come out C01, C02, APs come out AP01, each family counting on its own.

*One run per closet* follows the closet instead. Everything landing in IDF2 is numbered `I02-01` upward as a single run, laid out in blocks by kind, so twenty devices in that closet read I02-01 through I02-20 with the APs together, then the data drops, then the cameras, then the doors and sirens. The closet code is read off the cabling, so re-homing a device to another IDF renumbers it into that closet on its own. Block order comes from the device catalog rather than your sidebar order, so the same drawing numbers the same way on any machine.

Switching back to per kind clears the closet tags rather than leaving them stranded.

**Dragging devices in from the drawing**

The ports panel opens with a tray of whatever feeds that rack, grouped by kind and carrying the tags and labels the drawing already worked out: `Wireless AP  8  AP01–AP08`. Drag the group onto a port and the whole run lays in from there, so eight APs land on panel ports 09 to 16 in one go. Drag onto a zone instead and it fills that zone. Drag a single chip to peel one device off onto one port.

Nothing is retyped, so the port list says what the drawing says. Rename a device on the sheet and drag it in again and the new name comes with it. Chips grey out once placed, so what is left to do is obvious, and a jumper already patched to a port stays put when a device is dropped on it.

**Port zones**

A run of ports can be set aside for something. If four of the switches push 2.5G and the APs want them, zone ports 1 to 8 as `2.5G, APs only`, restrict them to Wireless AP, and add a note for the installer. Panels take zones the same way, so `01–12 Dock side` and `13–24 Aisle side` show where things land.

Zones colour the port list, print as a legend on the rack page, and get their own column on the patch schedule so the tech sees the reservation next to the jumper. Assign a camera to an AP-only run and the port turns red and the panel says what went wrong.

**Patch schedules for the crew**

Port assignment says what lands on a port. A patch says where the other end of that jumper goes, so the sheet a tech works from names both ends: *switch SFP1 into fiber enclosure 01*, not just "fiber".

Open a rack item's **Ports** and each row gets a target: another item in any rack, and a port on it. **Patch straight through to…** wires a switch into a panel one to one in a single go, which is how most of them get built. A port claimed by two jumpers is flagged in red. The patch is stored once and read from both ends, so opening the far item shows the same jumper rather than letting you type a second copy of it.

Each rack then prints its own **patch schedule** page: every jumper touching that rack, both ends with port numbers, what it carries, and a box to tick off. A run between two racks appears on both pages, since either tech might be the one making it. Turn the pages off in Sheet settings if a job does not need them.

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
* Company branding and your sidebar order live here too, alongside the projects. They are per machine settings, so they do not ride along in an export.
* Clearing site data or browser storage for the file wipes saved projects.
* A different browser, a different computer, or an incognito window will not see your projects.

### Backup folder

Browser storage alone is not somewhere to keep work you care about, so open **Projects** and hit **Choose where to keep them**. Pick a spot once, on your machine or a network drive, and the app makes its own folder there and looks after it:

```
Documents/                        wherever you pointed it
  Riser Builder/
    read me.txt                   what these files are, and how to restore one
    Saves/
      acme_warehouse.topology.json
      riverside_clinic.topology.json
```

From then on every save rewrites that project's file in `Saves`. Linking the folder writes every project you already have, not just the open one. Pick the `Riser Builder` folder itself later and it uses it as is rather than nesting a second one inside.

Those files are the record copy. They are the same format **Import** reads, so recovering a drawing is opening the app and importing the file, on any machine. They are plain text, so copying `Riser Builder` to a backup drive is enough.

Two things worth knowing about how browsers handle this:

* Folder permission does not always survive closing the browser. When it does not, the Projects panel says so and a **Reconnect folder** button puts it back. Nothing is written until you do, and the app tells you rather than failing quietly.
* On start the app asks the browser to mark its storage permanent, which stops the browser quietly clearing projects when the disk gets tight. Whether that is granted is shown in the same panel.

Until it is set up, the toolbar carries a **no copy on this computer** marker that opens the panel. **Export file** still works for a one off copy.

Chrome and Edge support writing to a folder. If the browser cannot, the app says so and leaves you with **Export file**.

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
