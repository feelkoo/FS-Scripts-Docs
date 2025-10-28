# FS Loading Screen

Modern loadscreen with a dynamic progress bar and built-in music player.

- Listens for `onClientResourceStart` and sends progress to the NUI (`app/app.js`).
- Plays `assets/music.mp3` with a slider and mouse-wheel volume control.
- Uses `loadscreen_manual_shutdown "yes"` and `loadscreen_cursor 'yes'` for full control.
