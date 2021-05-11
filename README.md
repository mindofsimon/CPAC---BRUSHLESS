# CPAC-BRUSHLESS
**CPAC** 2020/2021 Project (Daniele Leonzio, Simone Mariani, Martino Schgor) - **POLIMI**

## PURPOSE
Welcome to **BRUSHLESS**

## GENERAL INFORMATIONS
You can check out our power point presentation [slides](https://docs.google.com/presentation/d/1ybYcjDjga3YgYBNOZjIyuSXWl-OYxFCdy7jCowFl5Yg/edit?usp=sharing)
To run is required to have both [Processing](https://processing.org/download/) and [SuperCollider](https://supercollider.github.io/download) installed on your machines and to have a *LEAP MOTION* sensor.

## HOW TO USE
1. download the zip folder from github
2. extract all files
3. **image generation**
   - go inside CPC_GAN folder
   - run CPC_GAN (you can do it on *GoogleColab*)
   - to save time you can avoid doing training and use our pre-saved checkpoints for both Generator and Discriminator, in this case you can upload to *GoogleColab* G-2.ckpt and D-2.ckpt and execute just **last 2 cell blocks**
   - download the generated image and move it into *BRUSHLESS_def* folder
4. **run scripts**
   - inside *BRUSHLESS_def* folder open *BRUSHLESS_def.pde* and connect your *LEAP MOTION* sensor
   - inside *brushless_sonification* folder open *sonification_SC.scd*
   - run the Processing script and execute all blocks from SuperCollider script
5. **enjoy!**
   - now you can move your hand in front of the *LEAP MOTION* sensor and start playing around!
