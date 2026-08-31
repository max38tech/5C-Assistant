# 5C Assistant (Kiosk Mode)

A modern, standalone AI assistant built to run on repurposed iPhone 5c hardware using a jailbroken iOS 10.3.3 environment. 

This repository contains a native iOS application designed to run in Kiosk/Guided Access mode. By building on top of a jailbroken iOS system, we gain free, highly-optimized access to the device's proprietary Wi-Fi, 4G Baseband, Battery Management, and Audio drivers, allowing the AI to function completely untethered.

## Features
- **Cyberpunk UI:** A terminal-inspired interface mimicking our original bare-metal proof-of-concept.
- **Push-to-Talk (PTT):** Direct hardware integration for audio streaming.
- **Cloud-Native CI/CD:** Since the target environment is often Linux, this repository utilizes GitHub Actions to compile the `XcodeGen` project into a `.ipa` file using cloud macOS runners automatically on every commit.

## Installation
1. Restore your iPhone 5c to iOS 10.3.3.
2. Jailbreak the device using `totallynotspyware.lol` or `h3lix` (untethered).
3. Install **AppSync Unified** from Cydia (cydia.akemi.ai) to allow the installation of unsigned `.ipa` files.
4. Download the latest `Antigravity5C-Jailbreak.ipa` from the GitHub Actions Artifacts tab on this repository.
5. Install the `.ipa` onto your device using Filza or AppSync.
