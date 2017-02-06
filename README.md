# Overlay-Cursor-Image
Mac utility that draws another cursor under your normal one. Useful for VNC.

## Why
I'm toying with using a Cardboard VR headset as my computer display. That involves VNC, but the VNC client does not draw the
host computer's pointer. This makes it essentially impossible to use, which is a shame.

## What
Since the Mac's built-in VNC server does not send the cursor, we'll add our own cursor, which *will* be seen on the VNC client.

## How
1. Launch Overlay Cursor Image on Mac.
2. Use Mac normally or over VNC.
3. Quit Overlay Cursor Image to return to normal.

## Issues
* It doesn't follow the cursor very smoothly right now. I think there are ways to use lower-level drawing routines to improve performance.
* Cursor does not update location during ⌘-Tab task switching
* Cursor probably does not update during full-screen apps like games. This is not likely to be fixed.
