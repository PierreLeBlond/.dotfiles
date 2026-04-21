

### Current behaviour

- cube texture levels are computed from texture.mipmaps.length + 1
- cube texture level 0 comes from texture.images

- compressed texture from dds loader follows a different schema :
    - texture.mipmaps is empty
    - texture.image (without the 's') has all levels and mipmaps

### But... After some claude talk

- Maybe I should switch to .ktx2 RGBA16F format, supercompressed ?
- And perhaps compressed format then if I want to show off 