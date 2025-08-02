---

kanban-plugin: board

---

## Notes

- [ ] Tile in 64x64 - outline 5px
- [ ] Player in 128x128


## Todo

- [ ] Replace state nodes by full script
- [ ] surprise animation on soubalien intro
- [ ] Add indication on where is the chasing enemy
- [ ] Improve wall jump + animation seems off
- [ ] Add option to fixed camera follow


## Bugs

- [ ] There is still some jittering with player decelration and camera follow
- [ ] When falling from cliff, sometime falling straight, sometime gracefully
- [ ] Wall jump while facing back
- [ ] parallax background tilemap boundaris shows on race introduction


## Done

- [ ] soubalien capture camera does not follow player on y
- [ ] parallax background with zoom
- [ ] Wall jump even if no direction, compare with celeste, but it seems to work already
- [ ] corner corrector 1px rounding off
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