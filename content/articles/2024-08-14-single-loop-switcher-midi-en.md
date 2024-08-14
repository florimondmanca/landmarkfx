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

It is a compact (1590A-type) module with mini-TRS MIDI input that can be used to switch a pedal using MIDI. It uses a relay so the switching is true-bypass.

I built it using an [Imp-3PDT](https://oscillatordevices.com/imp-midi/#Imp-3PDT) by Oscillator Devices. This shop sells fully-built effects centered around MIDI, but also small modules that can be used to add MIDI to existing effects. In this case I basically boxed an Imp-3PDT and got this handy utility pedal!

I decided to build this because I was running out of loops on my MIDI loop switcher (also a gizmo by Oscillator Devices, their [HYDRA4](https://oscillatordevices.com/hydra/) which has 4 loops). I knew I may not always need a 5th loop, so having a single-loop MIDI switching module I could add or remove from my board would be handy. The only commercial offering I found was the One Control Solo, which is stereo (didn't need that) and has a bulky 5-pin DIN connector -- I prefer the more compact [mini-MIDI](https://minimidi.world/) way which uses 3.5mm TRS connectors.

The Loop1 is a pretty tight build. I managed to box it into 1590A with some careful planning. Fitting in this box required compact jacks: Lumberg jacks for the Input, Send, Return and Output, 3.5mm TRS jack for the MIDI input, and a Lumberg DC jack.

You can find more info and the design files (Inkscape drawing) on the [build page for the Loop1](/en/pages/builds/loop1.html).

