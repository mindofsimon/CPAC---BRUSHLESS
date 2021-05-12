# CPAC-BRUSHLESS
**CPAC** 2020/2021 Project (Daniele Leonzio, Simone Mariani, Martino Schgor) - **POLIMI**

## PURPOSE
Welcome to **BRUSHLESS**!

BRUSHLESS is one of the projects for the 2020/2021 *Creative Programming and Computing* course at the *Music and Acoustic Engineering* master at *Politecnico di Milano*.

The main purpose of this project is to realize virtual paintings by generating an artwork and then paint over it in a cool way through the use of a particle system.

The paintings are generated by us through a GAN (Generative Adversarial Network).

After the generation, the image is then painted just by moving a hand in front of a sensor!

The hand movement, should drive the particles in order to give to the user the feeling of giving a real brush stroke.

In addition, we added some sound effects to immerse the user way more into the experience (some of them are also controlled by hand movement).

Also, the user can select among 5 different effects related to the interactions between the particles.


## GENERAL INFORMATIONS
You can check out our power point presentation [slides](https://docs.google.com/presentation/d/1ybYcjDjga3YgYBNOZjIyuSXWl-OYxFCdy7jCowFl5Yg/edit?usp=sharing).

To run is required to have both [Processing](https://processing.org/download/) and [SuperCollider](https://supercollider.github.io/download) installed on your machines and to have a [*LEAP MOTION*](https://www.ultraleap.com/) sensor.

Processing will handle the particle system and the interaction with the sensor.

SuperCollider will instead manage the sound effects.

The communication between the two sides is implemented via **OSC** (Open Sound Control) Protocol

To have a better experience we recommend to run Processing on one machine and SuperCollider on another.

## HOW TO USE
1. download the zip folder from github
2. extract all files
3. **image generation**
   - go inside CPC_GAN folder
   - run CPC_GAN (you can do it on *GoogleColab*)
   - to run the script you need a kaggle account and downlaod your .json file from kaggle
   - to save time you can avoid doing training and use our pre-saved checkpoints for both Generator and Discriminator, in this case you can upload to *GoogleColab* G-2.ckpt and D-2.ckpt. In this way you need just to run all the function declarations, create the two models and then you can create as many images you want with the last cell block.
   - download the generated image and move it into *BRUSHLESS_def* folder
4. **run scripts**
   - inside *BRUSHLESS_def* folder open *BRUSHLESS_def.pde* and connect your *LEAP MOTION* sensor
   - inside *brushless_sonification* folder open *sonification_SC.scd*
   - set the IP addresses of the machines on which you're running Processing and SuperCollider (or just set both addresses at 127.0.0.1 if you run both on localhost)
   - set the desired particle system effect
   - run the Processing script and execute all blocks from SuperCollider script
5. **enjoy!**
   - now you can move your hand in front of the *LEAP MOTION* sensor and start playing around!
   - use earphones (or stereo audio anyway) for a better experience
