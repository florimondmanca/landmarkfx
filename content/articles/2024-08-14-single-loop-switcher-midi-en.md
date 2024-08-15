---
title: Building a DIY single-loop MIDI switcher
date: 2024-08-14
category: Articles
url: midi-single-loop-switcher.html
save_as: midi-single-loop-switcher.html
tags: MIDI, 1590A
slug: loop1
lang: en
status: draft
---

Here's the "Loop1", a single-loop MIDI switching box I built. :-)

It is a compact true-bypass loop switching pedal controllable via MIDI.

The Loop1 is essentially an [Imp-3PDT](https://oscillatordevices.com/imp-midi/#Imp-3PDT) from Oscillator Devices boxed into a 1590A enclosure. Their shop sells fully-built effects centered around MIDI, but also "mods" that can be used to add MIDI to existing effects, or build your own effects and utilities like I did in this case.

I decided to build this because I was running out of loops on my MIDI loop switcher (also a gizmo from Oscillator Devices, their [HYDRA4](https://oscillatordevices.com/hydra/) which has 4 loops). I knew I may not always need a 5th loop, so having a MIDI single-loop switching module I could add or remove from my board would be handy. The only commercial offering I found was the One Control MIDI Solo, but it is stereo (didn't need that) and has a bulky 5-pin DIN connector -- I prefer the more compact [mini-MIDI](https://minimidi.world/) way which uses 3.5mm TRS connectors. Also going DIY is fun, so here I am!

### Wiring diagram

The Loop1 is basically a MIDI-controllable 3PDT bypass. When off, the Input signal goes straight to the Output signal. When enabled, the Input goes to a Send jack (often labelled "FX In" or "Board In" in a 3PDT wiring diagram), and the Return jack ("FX Out" or "Board Out") goes to the Output jack.

The true-bypass switching functionality is provided by the Imp-3PDT, which exposes the four ports for us to connect the Input/Send/Return/Output jacks to.

Then we should connect its +9V/GND pins to the DC jack, and its MIDI Sig/Ref pins to our MIDI jack. The Imp-3PDT uses the [type-A TRS MIDI standard](https://minimidi.world/#types), so Sig goes to Tip, Ring goes to Ref (I remember it like this: "Ring" and "Ref" both have an "R").

I went with a tiny veroboard for the LED wiring because the Imp-3PDTexpects an external CLR for the LED, and I needed to relay the 9V from the DC jack to both the LED's CLR and the Imp, and I suck a point-to-point wiring.

![](/static/loop1/wiring_diagram.svg)

### Build model

I like to draw a model in Inkscape to place drilling holes and make sure everything will fit inside the enclosure.

The Loop1 is no exception, especially given the amount of jacks and the use of the infamous 1590A. This box is only 90mm long, 38mm wide and 30mm high externally!

The jacks are placed at the bottom in an alternating fashion. Then I put the LED over them. The Imp-3PDT is on a wall between the Return/Output jacks and the DC jack, and the MIDI TRS jack goes on the other side.

Quite tight but there was still some margin for error and room for finally assembly inside the enclosure.

Also you can see how closed jacks wouldn't have fit, and how "standard" Alpha-type open jacks would have been much tighter. There is still a 21.5mm spacing between the audio jack ports, which means regular "pancake" patch cables will fit side to side.

![](/static/loop1/drawing.svg)

### Enclosure drilling

The Inkscape file has a "Drilling template" layer. Before drilling, apply masking tape to the enclosure. Then print the drilling template in real size and tape it on the enclosure, making sure to align the edges.

As for the actual drilling, first mark the holes with a punch and a hammer to prevent drill wandering. Then what I do is drill all the holes with a 4mm HSS drill bit. Only then I widen the holes to the required size with a step drill. The audio jacks required 10mm, and the LED bezel, MIDI jack and DC jack require 8mm. (Depending on your components of choice this may vary.)

### Assembly

Here goes the final wiring and assembly. I first soldered wires on all the ports of the Imp-3PDT, then mounted it onto the wall with velcro.

Then I prepared the LED veroboard, connecting the +9V and LED wires from the Imp-3PDT, and a third wire for the DC jack 9V. The third-hand tool was especially handy to hold the veroboard above the enclosure and keep the wire lengths reasonable.

I then mounted the LED onto the bezel, then the DC jack, and soldered the +9V wire from the LED vero to it.

Next came the ground wires. I soldered a single GND line going from the DC jack and circling through all the audio jack GND pins up to the Imp-3PDT.

With that done, I mounted the audio jacks GND pin down so that the signal pin is facing up. I connected the blue signal jacks from the Imp-3PDT to the jacks one by one, bending them in a uniform way for a fairly clean look.

The last step was the 3.5mm MIDI jack. I mounted it in the enclosure, then soldered the two wires from the Imp-3PDT to it, twisting them together for better looks. Green is Ref which goes to Ring (again, I remember with the R's), and black is Sig which goes to Tip, as per the type-A standard for MIDI over TRS.

That's it!

### Possible enhancements

This module works great as it is! I can toggle the loop on or off using MIDI CC messages I send from my MIDI controller. This way I could make a DIY delay pedal MIDI-switchable. (I was eventually able to move it to a loop of the HYDRA4 as I freed one thanks to another MIDI mod I'll write about in a future post. Now the Loop1 is unused but I know I can resort to it in the future should I need a 5th loop again.)

There are only two things I will add as enhancements.

First would be soldering a mini push-button to the Imp-3PDT. Then I'd have easier access to the functionality designed to be activated via an SPST switch soldered to the mounting pads I left unused. In particular setting the MIDI channel without MIDI CC requires me to short those pads manually for now.

Second thing is labelling the audio ports. Right now I remember the layout but at least labelling with the letters I, S, R and O would be better. I have some black StazOn solvent ink and alphabetical stamps I could use. Stamping gives a very definite DIY look as it's very hard to perfectly align the letters on entire words. But for single letters it could look nice enough.

### Wrap up

Here were some design notes about the Loop1. You can find this info in more concise form as well as the design files (wiring diagram, Inkscape model) on the [build page for the Loop1](/en/pages/builds/loop1.html).
