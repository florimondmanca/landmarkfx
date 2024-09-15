---
title: Echo Play (PedalPCB Hydra Delay w/ Mods)
slug: builds/echo-play
url: builds/echo-play.html
save_as: builds/echo-play.html
lang: en
status: hidden
---

<img src="/static/echo-play/topview.jpg" alt="Top view">

### Overview

The "Echo Play" is my build of the PedalPCB [Hydra Delay](https://www.pedalpcb.com/product/pcb238/). This is a 4-head tape echo delay based on the Spin FV-1 chip. Can be compared to Catalinbread Echorec or Dawner Prince Boonar. Built in a 125B enclosure with top-mounted jacks.

It features JST connectors for easy disassembly, Lumberg jacks (audio, DC), and a custom decal.

It has several mods compared to the stock Hydra Delay build:

* Adjustable delay time range using the [FV-1 clock module](https://www.pedalpcb.com/product/fv1x/)
* Mix knob uses 10kA (log) instead of 10kB (linear) for more usability, as per [this post](https://forum.pedalpcb.com/threads/hydra-delay.6788/).
* Relay-based switching w/ remote control via MIDI using the [Oscillator Devices Imp-3PDT](https://oscillatordevices.com/imp-midi/#Imp-3PDT).

### Build notes

- First time SMD soldering for the FV-1 chip. I followed [this step-by-step tutorial](https://www.youtube.com/watch?v=_FFNZu4l2CA).
- Definitely recommend the Clock module! It's inexpensive and can be used to tune the delay time range. I use it to define what value the "noon" position is.
- All connections to/from the main PCB use JST-XH connectors to make disassembly possible and easier. Easier if you use pre-crimped wires. Some hard-soldered wires remaining as the the Imp pin spacing is not standard 2.54mm.
- I built a **first iteration** in Oct 2023. It had a "momentary oscillation" mod on a footswitch (short pins 1 and 3 of the Swell pot), and sub-par drilling. The **second iteration** was done in Aug 2024. I moved the circuit to a beige enclosure ; did better on the drilling ; used prettier black aluminum knobs and a beautiful green LED ("transparent diffused" LED from RetroAmplis) ; added the custom decal ; dropped the oscillation footswitch (didn't use it) ; cleaned the PCB with isopropyl alcohol for a cleaner and more durable result -- a best practice I'll apply from now on ; replaced the 3PDT with the MIDI switching module.
- Decal was designed in Inkscape and printed on a laser jet transparent shipping label sheet, as per [Pougnet Pedals' technique](https://www.youtube.com/watch?v=GZ_sWkzxgdk), finished with two layers of clear coat.
- Inkscape drawing was invaluable to fit all the components inside the 125B box. The clock module sits on top of the SPST where the Imp-3PDT is soldered, with little clearance from the main PCB.

### Cost of materials

| Part | Price (approx) | Vendor |
|---|---|---|
| 1x Hydra Delay kit | 65€ | Musikding.de |
| 1x Clock module kit | 4€ | - | 
| 1x 125B Enclosure | 10€ | RetroAmplis |
| Lumberg jacks (2x KLBM-3, 1x NEB/J21C), green LED | 7€ | - |
| 5x black aluminum knobs | 8€ | Banzai Music (SKU 60084) |
| Imp-3PDT, 3.5mm TRS socket, SPST footswitch | 35€ | Oscillator Devices |
| Shipping fees | 15€ |
| **TOTAL** | ~ 140€ |

### Pictures

<img loading="lazy" src="/static/echo-play/topview.jpg" alt="Top view">

<img loading="lazy" src="/static/echo-play/sideview.jpg" alt="Side view">

<img loading="lazy" src="/static/echo-play/guts.jpg" alt="Guts shot">

### Downloads

* <a href="/static/echo-play/drawing.svg" download="echo-play.svg">Inkscape drawing</a> (includes a drilling template)

### License

Drawings and schematics released under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
