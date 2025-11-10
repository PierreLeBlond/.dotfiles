---

kanban-plugin: board

---

## Notes

- [ ] Tile in 64x64 - outline 3px
- [ ] Player in 128x128
- [ ] from https://github.com/godotengine/godot/issues/103184#issuecomment-2677185757,
    audio in web export will loop only if playback type is stream, but stream does not work well on low end devices


## Todo

- [ ] Add small movement animation (wind, leafs, etc)
- [ ] Add details to tilesheets (leafs, foliage, mushrooms, etc)
- [ ] Make level size to music length
- [ ] Add custom url
- [ ] DEPLOY ON ITCH.IO
- [ ] Add build version number
- [ ] Name input on victory screen
- [ ] Make own virtual keyboard


## Bugs

- [ ] Deactivate player collision layer on portal entering
- [ ] Maybe do not wall jump when pressing against the wall to avoid unwanted jumps ? Especially on short obstacles that aren't really walls
- [ ] Sound bug on whooshes ?
- [ ] From SilentWolf to Talo


## Done

- [ ] Remove animation player warnings
- [ ] Combo note as a music staff following the player
- [ ] Handle audio track volume separatly
- [ ] Rename to brass in space
- [ ] Improve HUD elements and theme
- [ ] Jumping close to soubalien in tutorial stuck animation
- [ ] Camera position on race checkpoint load
- [ ] Remove bones warning
- [ ] Improve flute intro music
- [ ] Reduce corner correction vector size
- [ ] Remove note counter flash at start
- [ ] Corner corrector from left is off -> due to tileset collision box not taking all tile width ?
- [ ] More camera speed on switch, like on capture
- [ ] Combo note effect duration not matching combo duration
- [ ] Add effect on note as soon as they are collected, like white flash
- [ ] Synchronize note animation with music beats
- [ ] Add animation to note counter
- [ ] Activate whirl&pinch always or at least within the cone to avoid sprite jump
- [ ] quicker transition to muffled sound in, maybe add whoosh sound ?
- [ ] Refactor combo note logic, handle duration from a top level component
- [ ] Bug when switching between walk and run
- [ ] Music starts too late on web export
- [ ] Sometime, jump on corner takes you into the air, without vertical deceleration -> canceled jump state is completely wrong
- [ ] parallax background tilemap boundaris shows on race introduction
- [ ] Remove life as soon as ray captured (or death_zone touch, or else)
- [ ] Start whirl and pinch from ray state
- [ ] Reload checkpoint when run out of lives
- [ ] Replace state nodes by full script
- [ ] Improve ray capture physics and animation
- [ ] soubalien capture camera does not follow player on y
- [ ] The third life is always shown even if live < 3
- [ ] Avoid the need to jump camera to player each time we load a checkpoint (may be related to camera offset). Could do the same for circle transition.
- [ ] parallax background with zoom
- [ ] On start, fly animation delay does not work on first two button
- [ ] There is still some jittering with player decelration and camera follow
- [ ] Add virtual keyboard for controller and text input
- [ ] mobile name field keyboard
- [ ] Sometime jump just after (or before ?) reaching the ground does not work
- [ ] Improve music
- [ ] Make it possible to combo all notes
- [ ] Add combo to score + visuals
- [ ] preload musics
- [ ] Reduce bundle size
- [ ] Combo circle is stretch
- [ ] Add mobile menu button
- [ ] Stick countdown
- [ ] Show when heart goes down
- [ ] Display mutiple hearth rather than only one with number
- [ ] Show mobile button only when relevant in tutorial
- [ ] tutorial escape pause text
- [ ] surprise animation on soubalien intro
- [ ] Wall jump even if no direction, compare with celeste, but it seems to work already
- [ ] mobile main menu lag
- [ ] Wall jump while facing back
- [ ] Right click on score name ?
- [ ] Note bounce in rythm
- [ ] control mobile
- [ ] Export project in production mode
- [ ] When falling from cliff, sometime falling straight, sometime gracefully
- [ ] music not looping before race
- [ ] player/soubalien layer order
- [ ] Add bottom space on tutorial + controls
- [ ] Start timer on race
- [ ] Loading score
- [ ] corner corrector 1px rounding off
- [ ] Improve wall jump + animation seems off
- [ ] Form validation on score submit
- [ ] Add wallrun and long jump to tutorial
- [ ] Checkpoint and retry
- [ ] Run by default, walk with ctrl
- [ ] After wall run, give a small jump
- [ ] animation bug on jump peak
- [ ] Finish camera manager
- [ ] Flashes between scene transitions
- [ ] tutorial viewport size
- [ ] offset camera to keep player on the left of the screen
- [ ] override camera area meanqhile the player is jumping on the first cloud
- [ ] Main menu text active
- [ ] Disabled button style
- [ ] Reduce size of package (images ?)
- [ ] Cancelled jump while on wall, scale gravity
- [ ] Fix animation squash and stretsch
- [ ] Implement custom camera smoothing to avoid jittering
- [ ] Increase player outline
- [ ] Add strat to be captured be still take the portal if properly aligned
- [ ] tutorial endzone error
- [ ] Death and restart panels
- [ ] On death, cutscene camera target is off
- [ ] Change resolution to 1920x1080
- [ ] Run decceleration factor
- [ ] Replace end zone by portals
- [ ] Bigger dynamic jump height
- [ ] Remove vertical acceleration when entering the ray
- [ ] Stop player immediatly when move cancel
- [ ] On death transition, deactivate all other potential camera transition
- [ ] Cone correct angles
- [ ] Use godot deadzone camera system
- [ ] Soubacoupe stops before player is actually taken by the ray
- [ ] Tutorial: Camera drag limits does not reset when player go back to checkpoint
- [ ] Add bottom limit to cutscene camera


## Aborted

- [ ] Add camera shake on player trip
- [ ] Remove first race whoosh




%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false,false]}
```
%%