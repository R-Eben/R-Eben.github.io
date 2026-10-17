---
layout: default
type: project
title: AERO Motor & Inverter
date: 2025-11-01
course: AERO Formula SAE Electric · Inverter project lead
summary: >-
  Setup and configuration of a Cascadia Motion PM100 inverter and Emrax 228 motor for UVM's
  Formula SAE Electric car: firmware, wiring harnesses, motor calibration,
  telemetry, and CAN control.
thumbnail: /projects/aero-inverter/thumbnail.png 
permalink: /projects/aero-inverter/
---

AERO (the Alternative Energy Racing Organization) is UVM's Formula SAE Electric team. I joined at the end of the fall 2025 semester and went straight to work on the drivetrain: getting a Cascadia Motion PM100 inverter to drive an Emrax 228 medium voltage motor. In 2026 the team got the car's wheels spinning for competition for the first time since before the pandemic. For the 2026–27 season I will be leading the inverter project. The team will be acquiring a new inverter, a DTI HV-550, and I will be leading the setup and configuration of this new inverter with our old motor. I will also be helping with the construction of the new battery pack for this year. 

<figure>
  <video controls preload="metadata" playsinline>
    <source src="first_motor_spin.mp4" type="video/mp4">
  </video>
  <figcaption>The motor's first spin on the PM100. The reactions show how much of a milestone this was for the team!</figcaption>
</figure>

## What I worked on

**Firmware.** I flashed the inverter's firmware. The PM100 ships with firmware builds for different groups of motors, and our motor type needed a different build than the one installed. Finding and fixing that mismatch was the first step to getting the motor to run at all.

**Wiring harnesses.** I helped build the wiring harnesses that connect the inverter to the rest of the car.

**Motor calibration.** Before a permanent-magnet motor can be driven well, the inverter needs to know exactly where the rotor's magnets are relative to the resolver, the sensor that reports shaft angle. For the PM100, this required manual calibration by spinning the motor up to a high speed and measuring the back-EMF it produces as it coasts back down. The inverter calculates the angle between the back-EMF and the resolver reading, and calibration means adjusting the inverter's Gamma Adjust parameter until that angle reads 90°.

**Telemetry.** For most of our testing, the inverter was plugged into my laptop. While the motor was running, I monitored the inverter's live telemetry, including input voltage, phase voltages, VSM states, relay pin outputs, and fault codes, to ensure that everything was being done safely and as expected.

**CAN control.** Early tests ran the inverter in analog mode, where a simple voltage sets the torque request. To integrate it with the rest of the car, we switched to CAN mode, where torque commands and status information travel as messages on the car's CAN bus. I helped configure the messages going to and from the inverter.

**Documentation.** I also wrote some documentation for the inverter setup and motor calibration, to make the process much easier for future members.

## Challenges

The biggest challenge was actually making first connection to the inverter and flashing it with the correct firmware for the first time. Until we were able to do that, the inverter was basically a black box that wasn't receiving or transmitting any signals to help us do any troubleshooting. The CAN was also fairly difficult to configure, as there was some issue with oversaturation of the CAN line. 

<figure>
  <video controls preload="metadata" playsinline>
    <source src="wheels_spinning.mp4" type="video/mp4">
  </video>
  <figcaption>The car's wheels spinning under power at the 2026 competition.</figcaption>
</figure>
