# Topology Builder

A single file browser app for drawing low voltage and network riser diagrams, then handing the client a clean PDF.

Built for real field work: you type in what is going where, drag to link it, arrange it however the job actually looks, and print. No install, no server, no account. Open the HTML file and go.

## Quick start

1. Download `topology-builder.html`
2. Double click it, or drag it into Chrome or Edge
3. Build the diagram
4. Hit **Print to PDF**

That is the whole setup. The file works offline once loaded. It also runs fine off a USB stick on a jobsite laptop.

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

**Sheet and title block**

Project title, company branding with a logo upload, revision letter, and a proper title block for a deliverable that looks like a submittal instead of a sketch.

**Projects and revisions**

Multiple saved projects with an index, plus labeled revisions per project. Save a revision before a scope change so you can show the client what moved.

**Import and export**

JSON export and import for the full project, so a drawing travels between machines or gets checked into a job folder.

## Where the data lives

Projects are stored in the browser using IndexedDB, under the database `riser-builder`. That means:

* Data stays on the machine that made it. Nothing is uploaded anywhere.
* Clearing site data or browser storage for the file wipes saved projects.
* A different browser, a different computer, or an incognito window will not see your projects.

So for anything you care about, use **Export file** to drop a JSON copy into the job folder. Treat IndexedDB as the working copy and the JSON as the record copy.

## Browser support

Built and tested against Chromium browsers, meaning Chrome and Edge. Print to PDF uses the browser print dialog, so pick "Save as PDF" as the destination and turn on background graphics for the colors to come through.

Two fonts, Archivo Narrow and IBM Plex Mono, load from Google Fonts. With no internet the app still runs, it just falls back to system fonts.

## Repo layout

```
topology-builder.html   the entire application
README.md
LICENSE
.gitignore
```

One file on purpose. No build step, no dependencies to install, nothing to break six months from now when you need to reopen an old drawing.

## Editing it

Open `topology-builder.html` in an editor. The structure runs top to bottom:

* CSS in the `<style>` block at the top
* `FAM` and `DEV` near line 418, the device families and the device catalog
* `MEDIA` just after, the cable types
* Rendering and drag logic in the middle
* Storage, projects, and revisions near the bottom

Adding a device type is one line in `DEV`: a key, a display name, a tag prefix, a family, and a glyph.

## Roadmap ideas

* Print scaling presets for 11x17
* Port level detail on switches
* Floor plan underlay
* Direct BOM export shaped for the estimating template
