This is a simple script that will add a new circle next to water status with the weight from player's inventory.
this is customized for my server but it's very easy to change.

line 47 is the circle's color
line 48 the icon in the circle (from https://fontawesome.com/)

line 43, 44 is to make the weight from 0-25 to 0-100
If you have set the maximum player's weight to 25 (25000g) you dont need to change anything.
If you have it to 20 (20000g) you must change the line 43
from:
currentWeight = currentWeight * 4
to
currentWeight = currentWeight * 5

Make sure you will start this script after trew_hud_ui

I hope you will understand how to do it. 

This is my first time i public a script
I didn't did all this by my self, i read the tutorial from original trew_hud_ui about how to add extra status.
https://forum.fivem.net/t/release-trew-hud-ui-a-lightweight-hud-for-esx-vrp-and-vrpex/890303
