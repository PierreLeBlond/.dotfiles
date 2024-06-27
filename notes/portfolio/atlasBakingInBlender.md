---
blender-version: 3.3
---

# Atlas Baking In Blender

Let's bake multiple objects material information in one texture !

![Your scene](./images/scene.png)

Let's say you have a scene with two objects and a sun.

## Unwrap

![Add uv slot](./images/uv.png)

For each objects, add a new uv slot, and set it active.  
Select all objects, switch to *Edit mode*, press *u* and choose *Lightmap Pack*.

![Uv editor result](./images/uv-editor.png)

Uvs should not overlap.

## Configure materials

![Shader editor](./images/shader.png)

In each object materials, add an *Image Texture* node, bound to a new image.

## Bake

In *Render Properties > Bake*, choose what you want to bake.  
Properly configure the *Margin* option, the size should be less than the spaces between islands in your uv map.

Also, looks like the denoiser introduce some artefacts at edges, investigation is required.

Make sure you selected all the objects, as well as the *Image Texture* node within the shader editor.

Press the bake button.

![Map result](./images/map-final.png)
![render result](./images/final.png)