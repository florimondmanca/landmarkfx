---
title: My DIY pedal building workflow
date: 2024-06-12
---

As a DIY pedal builder who started in July 2023, I've been enjoying the craft and in this post I would like to share my usual workflow.

## Deciding a project

The first step is to decide what I would like to build.

This choice may be motivated by different reasons.

In the beginning of my pedal building journey, I would be guided by my **desire to learn**. I would start with simple projects such as a premade kit for a boost or buffer pedal.

Later this choice would be guided by **actual needs** that I cannot fulfill with existing medium-priced pedals. I landed on this after buying a kit for a Green Russian Big Muff and never getting to actually build it because I didn't actually need a Big Muff for my playing. Besides, EHX's Green Russian reissue made this particular flavor available again for aruond 80€, which is the price of materials for a DIY pedal with high quality components and enclosure.

When I figure I _need_ a certain type of pedal, I would first look at second-hand options for commercial pedals, taking into the **added value** of making one DIY given considerations on price and quality. My noise gate pedal is a good example: I first built a PCB Guitar Mania "No-Noise" kit, but it had some imperfections. Instead of building a more advanced kit such as PedalPCB's Muzzle, I went with the TC Electronic Sentry. It is one of the best Noise Gate pedals out there it seems, and can be found second-hand for just a little more than the raw materials for the Muzzle. It didn't actually make sense to build one myself.

Another aspect guiding the choice of which pedal to build is **modding**. If there is a widely available circuit or pedal, but I would like to twist it slightly (or more heavily) in ways that cannot be found on the market, then that would be a good candidate for a DIY build. This was the case for my modded Fuzz Factory.

## Planning and design

Once I decided on a pedal I'd like to build, I go into a planning and design phase.

I almost always use **kits** at least for the basic PCB and components. There are many excellent kits and they make it very practical to assemble a pedal without needing to chase for components. At some point in the future I might go into designing my own PCBs, but not having a specialized electrical engineering background makes it less likely.

If I implement **mods**, I need to figure out what they are and how to implement them. This has me sitting down with pen and paper making drawings of the mod. For example, I built a Phase 90 clone with the famous "[R28 mod]()" and made drawings to understand which resistor should be put on a toggleswitch and how.

Mods can span weeks or months in this design phase, especially when it comes to finding the most appropriate components taking into account their price and availability. I might find a more advanced solution but decide it's not worth it if it depends on a rare, expensive or fragile component.

What I spend time on next is making a **printable model** of the pedal. I use **Inkscape** to draw a **1:1 blueprint** of the pedal. I draw the enclosure at scale, **drilling locations** and components such as potentiometers, PCBs, jacks and footswitches. This has become a crucial step as I went into tighter builds with more components, customized assemblies and mods while keeping the pedal in a practical format (e.g. 125B at most). I can later **print** this blueprint when drilling the enclosure.

### Drilling the enclosure

My printable model is an Inkscape file with multiple layers. One of the layer is called "**Drilling template**".

This template shows the location of **holes** I should drill and what **size** the drill bit should be for that hole. For example, most potentiometers require an 8mm mounting hole, so I would draw a dot and an 8mm-radius circle around it to materialize that.

When it comes to actually drilling the enclosure, I don't have a column drill but use a heavy-duted manual drill that has an extra handle for stability, a 5mm drill bit and a step drill.

I struggled with precision of the drilling in the beginning but I figured out why. I would try to drill the enclosure only with the step drill. What works _much better_ is to first drill holes with a regular drill bit that's smaller than any hole I want to make -- I use 5mm as most holes are typically 6mm or higher. _Then_ use the step drill to widen the hole to the desired size.
