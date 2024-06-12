---
title: Building a modded Fuzz Factory
date: 2024-06-05
---


The Fuzz Factory is a legendary Fuzz guitar pedal, incredibly versatile and sensitive. It is most notably known for being embedded into Matthew Bellamy's guitars. Bellamy uses guitar-mounted knobs to control certain parameters of the Fuzz Factory and achieve those "squeals" characteristic of this _Plug in Baby_ intros.

The thing is, not everybody can afford (or even wants to rock) a specialised guitar to achieve those squeals or explore the feedback abilities of the Fuzz Factory.

As I was planning to build a DIY Fuzz Factory using Musikding's [The Factory](https://www.musikding.de/The-Factory-germanium-fuzz-kit) kit, I wondered if it was possible to figure out which knobs Bellamy uses -- and mod the Factory kit to control those using an **expression pedal**. As it turns out, this is indeed possible.

The Fuzz Factory also lends itself to other interesting mods.

So after 3 months of research and planning, I have built a modded clone of the Fuzz Factory which I named the **Fuzz Forge**. It features a Tone control, a FAT mod through socketed capacitors, an Expression input for the Comp knob, and a "Stabilize" footswitch to easily engage or disengage oscillations.

INSERT PHOTO

Let's go through an overview of the pedal and then details of each mod.

## Build overview

The Fuzz Forge is a modded Fuzz Factory built on top of the [Factory kit](https://www.musikding.de/The-Factory-germanium-fuzz-kit) from Musikding.

It is built into a black [Gorva Design C65](https://gorvadesign.com/collections/custom-parts/products/c65) enclosure. This is similar to a 125B enclosure but has a great textured paint finish and more room inside thanks to its 

I designed a custom faceplate for it and got it manufactured by [Tweakable Parts](https://tweakable-parts.com) who provides a laser engraving and cutting service.

Due to the offboard 5 potentiometers and various mods, the inside is full of wires. I managed to keep it fairly tidy by using solid wires and wiring the components with the pots mounted on the faceplate.

## STABILIZE mod

I'll explain this mod first because it is linked to the Expression input mod.

On the Fuzz Factory, the Stab control starves the pedal by reducing its power supply voltage, from 9V (Stab maxed out) down to approx 1V (Stab at min).

For some reason, this reduced input power supply is what makes the oscillations in the circuit _possible_:

* If Stab is at max, no combination of the other controls can trigger oscillations. (In this state the Fuzz Factory can achieve regular fuzz sounds reminiscent of the Fuzz Face or even the Big Muff, thanks to the FAT mod I'll describe below.)
* If Stab is below max, _some_ combinations of the other controls _might_ trigger oscillations -- but not all of them. For example, maxing the Comp knob would never trigger oscillations even though Stab is below max.

Matt Bellamy's guitars with onboard Fuzz Factory expose two knobs, one of them is the Stab knob. This allows him to effectively put the Fuzz Factory in oscillation at will using his hands.

What I did was put the Stab knob on a 3PDT footswitch wired as a regular 3PDT bypass, which I called "Stabilize":

* When the 3PDT in engaged (LED on), the Stab knob is bypassed and the pedal receives 9V power, effectively acting as if Stab was maxed out.
* When the 3PDT is disengaged (LED off), the Stab knob is reintroduced into the circuit.

INSERT SCHEMATIC HERE

Now, if we set the STAB knob lower than max so that it _can_ trigger oscillations (depending on the other controls), we can trigger the oscillatory state at will by operating the footswitch!

As a result the Fuzz Forge has two footswitches: one for engaging the effect, and another for controlling the oscillatory state.

## Expression input mod

When the STABILITY footswitch is released with the STAB control lowered, the Fuzz Factory is in an oscillatory state -- it _can_ oscillate, but not always.

The intense interaction between the various controls of the Fuzz Factory is what makes it quite daunting.

From my observations here are the high-level principles that define the existence, pitch and character of the oscillations.

* As seen previously, when STAB is maxed out, no oscillations can happen.
* If STAB is lowered, but COMP is maxed out, no oscillations happen either.
* If STAB is set too low, oscillations disappear -- or rather, their frequency is too low to be heard or sound musical.
* If COMP is set lower, the oscillation threshold is controlled by GATE: if GATE is lower than the threshold, oscillations occur, and if it is higher, oscillations disappear.
* The pitch (and range of pitches) of the oscillations is controlled by the combination of GATE, COMP, DRIVE and STAB.

The last point is the most complex one to grasp, and I can't provide a comprehensive detail of how these 4 settings determine the pitch and the range of possible oscillation pitches.

But I have found an empirical tuning method which gives me satisfactory results:

* First, set GATE and COMP to min, STAB at max, and DRIVE to a medium level (I use 10 [^0]).

[^0]: Setting levels are expressed as hours on a clock: 7 is 7 o'clock which is min, 12 is noon which is middle, 5 is 5 o'clock which is max.

## Approaching the Fuzz Factory

The Fuzz Factory is a deceptively simple circuit -- I'm not sure I understand how so few components can produce such a wide range of sounds.

But we can build an intuitive understanding of the controls of the Fuzz Factory. I used settings demos of the Fuzz Factory such as [this oscillation demo](https://www.youtube.com/watch?v=_S8xRiOqXtc) to help me see what each setting does.

On the original as well as on Musikding's kit, the controls are as follows: Volume, Gate, Comp, Drive, Stab.

The Volume control is a regular master volume control. It's uses a potentiometer 500k as a voltage divider to define how much of the signal goes through the circuit output vs how much is sent to ground.

Next we can look at Stab -- which stands for _Stability_. This control changes the VCC input of the pedal. When Stab is at max, the pedal receives a standard 9V power supply. If we reduce Stab, the pedal receives a lesser power supply. The specifics of the 
