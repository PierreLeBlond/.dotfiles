---

kanban-plugin: board

---

## Notes

- [ ] Tile in 64x64 - outline 5px
- [ ] Player in 128x128
- [ ] from https://github.com/godotengine/godot/issues/103184#issuecomment-2677185757,
    audio in web export will loop only if playback type is stream


## Todo

- [ ] Replace state nodes by full script
- [ ] Improve music


## Bugs

- [ ] parallax background tilemap boundaris shows on race introduction
- [ ] Sometime jump just after (or before ?) reaching the ground does not work
- [ ] On start, fly animation delay does not work on first two button
- [ ] Sometime, jump on corner takes you into the air, without vertical deceleration
- [ ] mobile name field keyboard


## Done

- [ ] soubalien capture camera does not follow player on y
- [ ] parallax background with zoom
- [ ] There is still some jittering with player decelration and camera follow
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




%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false]}
```
%%