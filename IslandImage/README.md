# Island Image

Puts a picture on your iPhone's Dynamic Island using a Live Activity.
Built on GitHub (no Mac needed) and installed from Windows with Sideloadly.

## One-time setup

1. **Make a GitHub account** at github.com if you don't have one.
2. **Create a new repository** (the green "New" button). Name it `IslandImage`.
   Choose **Public** — public repos get free macOS build minutes.
3. **Upload this folder's contents.** On the empty repo page click
   "uploading an existing file", then drag in everything inside this folder
   (`App`, `Shared`, `Widget`, `.github`, `project.yml`, `README.md`) and click
   "Commit changes".
   - Windows hides folders starting with a dot. If `.github` doesn't show,
     turn on File Explorer > View > Show > Hidden items.
   - If drag-and-drop skips `.github`, install **GitHub Desktop**
     (desktop.github.com) and publish the folder from there instead.
4. **Install Sideloadly** on your PC from sideloadly.io.
   Also install **iTunes from apple.com** (not the Microsoft Store version) —
   Sideloadly needs its iPhone drivers.

## Every build

1. On GitHub, open the **Actions** tab. A "Build IPA" run starts each time
   you change a file. (You can also click "Run workflow".)
2. Wait for the green check (about 5–10 minutes).
3. Open the run, scroll to **Artifacts**, download `IslandImage-ipa`, and
   unzip it to get `IslandImage.ipa`.
4. Plug your iPhone into the PC, open Sideloadly, drag the `.ipa` in,
   enter your Apple ID, and click **Start**.
5. On the iPhone, the first time only:
   - Settings > General > VPN & Device Management > trust your Apple ID.
   - Settings > Privacy & Security > Developer Mode > On (phone restarts).
6. Open **Island Image** and tap **Start**.

Free Apple IDs expire sideloaded apps after **7 days** — just repeat step 4.

## Using your own picture

Replace `Shared/Assets.xcassets/IslandImage.imageset/island.png` with your own
image (keep the name `island.png`). Square images with a transparent or simple
background look best — it's shown in a small circle. On GitHub, open that
folder, click "Add file > Upload files", upload your `island.png`, and commit.
A new build starts automatically.

## Limits (set by Apple)

- iOS ends Live Activities after about 8 hours. Open the app and tap Start again.
- If music, a timer, or navigation is running, your image may shrink to a dot
  or be hidden.
