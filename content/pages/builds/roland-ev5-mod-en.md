---
title: Roland EV-5 Jack and Polarity Mod
slug: builds/roland-ev5-mod
url: builds/roland-ev5-mod.html
save_as: builds/roland-ev5-mod.html
lang: en
status: hidden
---

<img src="/static/roland-ev5-mod/topview.jpg" alt="Top view">

### Overview

The Roland EV-5 is a 10k linear expression pedal. It's fairly cheap and mostly plastic, but I found it lightweight enough and sturdy enough for a live pedalboard usage.

It only has two pitfalls:

1. A long hard-wired cable, which means you can't plug a shorter cable to make things tidy on a pedalboard.
2. No polarity switch, which means it may or may not work with some pedals.

There's a lot of room inside the pedal, so we can mod it to install a TRS jack socket and a DPDT polarity switch.

### Materials

For this mod you'll need

* A TRS jack socket. Open or closed both work.
* A DPDT toggleswitch of your liking.
* Some wire

Mine were leftover parts from kits bought at Musikding.de, but you can find these at any online electronics store. Others in Europe include Banzai Music, RetroAmplis, etc.

Total cost should be less than 10€.

### Wiring schematic for polarity switch

TODO

### Steps

1. Undo the 7 screws at the back of the pedal and remove the backplate.
2. Use plyers to free the TRS cable from its holding tab.
3. Cut the TRS cable so you have rougly 10cm to work with inside the pedal. We'll connect the wires in this cable to the polarity switch.
4. Drill a 10mm hole for the jack socket. I drilled mine in the top side, but you may also want to install the jack on the side. Mark the hole location using a center punch, then drill. I used a metal drill bit at fairly high speed for a clean hole.
5. Drill a 6mm hole for the polarity switch.
6. Strip the TRS cable rubber envelope far enough so that the red, white and ground wires stick for about 5cm. Cut the ground strands to 1cm and twist them together.
7. Solder the toggleswitch. Solder the red (tip) and white (ring) wires to the center pins. Solder a red wire from the top of the tip lug to the bottom of the ring lug, and vice versa. At the same time, solder another red and white wire at the top lugs. These will go to the jack socket.
8. Solder the new red and white wires to the jack socket, as well as the twisted ground wires.
9. Mount the sockets and note which side of the toggleswitch corresponds to Normal (tip active) and Reverse (ring active) polarity. Use a digital multimeter. In normal polarity, Heel should connect Tip to Sleeve, and Toe should connect Ring to Sleeve. And vice versa in reverse polarity.
10. You're done!

### Pictures

### Downloads

* <a href="/static/roland-ev5-mod/drawing.svg" download="roland-ev5-mod.svg">Inkscape drawing</a> (includes a drilling template)

### License

Drawings and schematics released under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
