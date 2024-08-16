---
title: Adding MIDI switching to the Friedman BE-OD Deluxe
date: 2024-08-20
slug: midi-beod-deluxe
category: Articles
url: midi-beod-deluxe.html
save_as: midi-beod-deluxe.html
tags: MIDI, Mods
lang: en
status: draft
---

Build page: [MIDI Switching Mod for Friedman BE-OD Deluxe][0].

[0]: /en/pages/builds/midi-beod-dlx.html

---

The **Friedman BE-OD Deluxe** is a great 2-channel Marshall-esque preamp pedal which has been on my ampless pedalboard for a while.

Contrary to the more expensive IR-X from the same manufacturer, it doesn't have any **remote switching** capability. I have been looking at this as I've been adding MIDI to my pedalboard.

A Korean gear maker named BigRig did offer an EXT mod for controlling the bypass and channel using a dual footswitch, so at least remote switching proved to be possible. But the mod relied on a custom PCB they only offered for a bit, and no design files were made available,.

So I came up with a **custom mod** which relies on an [Oscillator Devices Goblin-3PDT](https://oscillatordevices.com/goblin-midi/#Goblin-3PDT) and some custom-designed daughterboard PCBs. I am releasing the KiCAD files for these as well as other design files under **CC BY-SA 4.0**.

In this post I'll cover what the mod does, how it works, and how to install it if you'd like to mod your BE-OD Deluxe as well.

### Preliminary disclaimer

I designed this mod as a hobbyist and not at all as a professional electronics engineer (I'm a software engineer).

I wouldn't consider this mod exactly easy -- there's more to it than soldering a few wires. The 3PDTs soldered to the main PCB with 6-pin headers need to be replaced. This can be a bit of a pain even with a good quality desoldering pump. I took the lazy way which ended up not as clean as it could have been (I'll explain both ways).

I wouldn't consider the mod perfect either. The MIDI switching works wonders, and the SPSTs make the pedal nicer too, IMO. But the mod resulted in a squeal on the high-gain green channel when plugging a guitar directly in -- almost similar to the notorious squeal of a Fuzz Factory -- which disappears when inserting a buffer in-between. This could be due to a lack of ground plane on my daughterboard PCBs, or to some missing power supply circuitry on them, or to the long wires I used in my build -- or a combination of all this, not sure. Truth is, this was my very first PCB design, and interfacing with a high-gain pedal probably wasn't the easiest first project!

With this out of the way, let's take a look!

### Mod overview

The mod consists in **making the Bypass and Channel footswitches controllable via MIDI**. With it you can send MIDI CC messages to the BE-OD Deluxe to bypass/engage the pedal and toggle the blue/green channel.

There is plenty of room inside the enclosure between the two footswitches, which made it possible to insert the Goblin-3PDT there.

<figure>
    <img src="/static/midi-beod-dlx/stock.jpg" loading="lazy">
    <figcaption>Guts shot of a stock Friedman BE-OD Deluxe pedal. (Photo: strategicguitar.com)</figcaption>
</figure>

The MIDI switching functionality is entirely provided by the **Goblin-3PDT**.

The mod requires drilling a hole for a **MIDI IN** jack. Optionally we can also install a **MIDI THRU** jack because the Goblin-3PDT has MIDI THRU, which I did.

It also requires **replacing the latching 3PDTs** and their breakout boards with momentary SPST switches.

Additional circuitry is required to make the Goblin-3PDT toggle the **LEDs** on the BE-OD Deluxe, because the latter toggles the positive pin of the LEDs while the Goblin is only able to toggle a negative pin to ground. Thanks to the help of Uwe from Oscillator Devices, I came up with a MOSFET-based solution. It could be implemented on veroboard, but given the profile of this pedal I went with custom PCBs for a cleaner look.

Lastly, the mod requires a fair bit of **off-board wiring** -- about twenty different wires! -- since we're using most of the many pins of the Goblin-3PDT. For a cleaner result and ease of disassembly I went with **pin connectors** on the custom daughterboards, using pin headers and JST connectors I had at hand.

Here's how it looks in the end:

<figure>
    <img src="/static/midi-beod-dlx/modded.jpg" loading="lazy">
    <figcaption>My Friedman BE-OD Deluxe pedal after installing the MIDI mod. (Photo: Florimond Manca)</figcaption>
</figure>

In a later part I'll explain how to install the mod if you'd like, but first I wanted to cover how it works in some detail. While this may be simple circuitry, as a hobbyist I was very happy to come up with a working solution. So if you're a hobbyist as well, I hope you learn some interesting basics with what follows.

### Designing the mod

The main design endeavour for the mod was figuring out how to interface the BE-OD Deluxe with the Goblin-3PDT.

#### Pin analysis

The BE-OD Deluxe footswitches connect to the main PCB with 6-pin headers on two ports:

1. **Bypass**: the 6 pins are `(JI, FI, GND, LED, FO, JO)`. A 3PDT footswitch and breakout board provides the true-bypass behavior. It toggles between connecting `JI` to `JO` (pedal bypassed), and connecting `JI` to `FI` and `FO` to `JO` (pedal engaged). The `LED` pin connects to the positive pin of the LED. It is pulled to `GND` when the pedal is bypassed (in this case both pins of the LED are grounded so it is off), and left open when engaged (one pin is grounded and the other receives current through the CLR, so it lights up).
2. **Channel**: the 6 pins are `(JO_A, LED_B, GND, LED_A, JO_B, JO)`, where A refers to the blue channel and B to the green channel, and `JO` connected to the `JO` on the Bypass port. So this port actually toggles between sending of channel A or B to the output jack. (The BE-OD Deluxe is basically two differently-voiced copies of the same circuit in one pedal.) The LED pins work the same way as the Bypass LED: grounded when off, open when lit up.

On the other hand, the Goblin-3PDT module has two relay-based true-bypass switching ports named Port 1 and Port 2. Each port can be switched using MIDI CC messages, or physically by a momentary normally-open SPST footswitch that pulls the `SW1/2` pin to `GND`.

<figure>
    <img src="/static/midi-beod-dlx/goblin-3pdt.svg" loading="lazy">
    <figcaption>Board diagram of the Goblin-3PDT. (Credit: Oscillator Devices)</figcaption>
</figure>

#### Audio switching

Interfacing "Bypass" and Port 1 is fairly straight-forward. Both work as true-bypass for the input/output jack signals and the BE-OD Deluxe circuit, although the pins aren't in the exact same order.

"Channel" can be toggled by Port 2, using the true-bypass circuitry in a creative way to get an SPDT behavior: by connecting `JO_A -> JIN2`, `JO_B -> FXOUT2` and `JO -> JOUT2`, we effectively toggle `JO` between receiving `JO_A` or `JO_B`.

#### LED switching

Toggling the LEDs could not be done directly by the Goblin-3PDT. Its `LED` pins are open when the corresponding Port is OFF, and pulled to `GND` when it is ON. But the BE-OD Deluxe LED pins expect the contrary. They should be pulled to `GND` for the LED to be off, and be open for the LED to light up.

As it turns out, we can solve this by using [n-MOSFET transistors as switches](https://www.electronics-tutorials.ws/transistor/tran_7.html). This was my first time using these so here's what I understood about n-MOSFETs. This type of transistor has 3 pins: Drain, Gate and Source.  If the voltage between Gate and Source is above a threshold named `Vgs_th`, current can flow between Drain and Source. If it is below that threshold, then current cannot flow which is as if Drain and Source were disconnected. The value of `Vgs_th` depends on the specific model of transistor. I used 2N7000 which is spec'd to have `Vgs_th` of around 3V. A BS170 would also work.

So, if we connect things like so:

* Connect Source to `GND`.
* Connect Drain to a `LED` pin on the BE-OD Deluxe.
* Connect Gate to a pull-up resistor from +9V on one side (actually I use a voltage divider because I like to power the BE-OD Deluxe with 18V), and to the Goblin `LED` pin on the other side.

Then we get this behavior:

| Goblin Port | Goblin `LED` pin | Gate voltage | MOSFET state | BE-OD `LED` pin | LED state |
|---|---|---|---|---|---|
| **OFF** | (Open) | 9V (exceeds `Vgs_th`) | ON | `GND` | **OFF** |
| **ON** | `GND` | `GND` (below `Vgs_th`) | OFF | (Open) | **ON** |

Which is exactly what we need!

For the Bypass port, we use one such n-MOSFET to convert the Goblin `(Open)/GND` LED signal of the Goblin to a `GND/(Open)` signal for the Bypass LED.

The Channel port has a dual blue/green LED, so I used two cascading n-MOSFETs, inverting the signal twice. After the first n-MOSFET we get a `GND/(Open)` signal we can connect to `LED_B`. After the second n-MOSFET we get an `(Open)/GND` signal we can connect to `LED_A`. (I guess I could have used only one n-MOSFET and connect `LED_A` to the Goblin `LED` pin directly?)

#### Mounting and wiring

The Goblin-3PDT is meant to be mounted on an enclosure using two screws through its two mounting holes.

I put the drill holes on the back of the enclosure to avoid messing with the front faceplate:

<figure>
    <img src="/static/midi-beod-dlx/back.jpg" loading="lazy">
    <figcaption>The MIDI-modded Friedman BE-OD Deluxe shown face down. (Photo: Florimond Manca)</figcaption>
</figure>

But this meant the backplate wouldn't be free anymore when opening up the pedal.

So I figured it was best if wires were long enough to lay the backplate flat when opening up the pedal, but also if they could be disconnected if we need to remove the backplate completely for maintenance or otherwise.

For this I soldered pin headers on the Goblin and wired everything up using JST connectors. (Other types of connectors such as Molex could work. These are what Friedman used for the input/output/DC jacks. Dupont connectors are too high though.)

If you have a crimping tool (which I don't) then be sure to cut the wires to length; I find the pre-crimped ones I had at hand were definitely too long.

<figure>
    <img src="/static/midi-beod-dlx/hinge.jpg" loading="lazy">
    <figcaption>View of the MIDI-modded Friedman BE-OD Deluxe with the backplate removed and laid flat on desk. Wires to the Goblin-3PDT can be disconnected thanks to JST connectors. (Photo: Florimond Manca)</figcaption>
</figure>

#### Inkscape drawing

As always, I rely heavily on a real-size Inkscape drawing to prepare the drill template and place components to make sure everything will fit.

For this one I drew the footprint of the PCBs, footswitches, jacks, and even wires with colors corresponding to the Goblin-3PDT docs to reduce the risk of mistakes.

<figure>
    <img src="/static/midi-beod-dlx/drawing.png" loading="lazy">
    <figcaption>Inkscape drawing for the mod. <a href="/static/midi-beod-dlx/drawing.svg">Download the SVG</a> (440 kB). License: CC BY-SA 4.0.</figcaption>
</figure>

### Possible improvements

### Installing the mod

If you'd like to install the mod yourself, I prepared some documentation which you can download here: [Documentation for the Friedman BE-OD Deluxe MIDI Switching mod]().

The cost of materials will be roughly 60€, shipping fees excluded.

You'll need a Goblin-3PDT from Oscillator Devices with accompanying screw set, two momentary SPST footswitches, two 3.5mm TRS jacks, wires, and optionally pin headers and connectors.

You'll also need the LED switching circuit, which requires three n-MOSFETs (2N7000 or BS170 works) and four 10K resistors.

* One option is to build it yourself on veroboard or another method. You can use the KiCAD circuit schematic available for download in the [build page][0]. Then you'll need to adapt the installation guide which supposes using the custom daughterboards I designed.
* Alternatively, I still have 5 copies of the custom daughterboard PCBs at the time of writing. Please get in touch at info[@]landmarkfx.fr if you'd like to get one (I can ship from France).
* Last, you can order the PCBs from an on-demand PCB manufacturer using the KiCAD PCB files available for download in the [build page][0] (released under CC BY-SA 4.0). FYI, I ordered my copies from AISLER.net. They accept KiCAD files directly. I found them to provide good EU-based service. They don't do multi-design panels though yet the daughterboards come as a pair (Bypass / Channel). So you'll need to make two orders, which comes with an upfront job fee of 2 x 10€.
