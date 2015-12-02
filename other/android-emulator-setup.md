Setup Android
=============

Used to emulate and build the android app

The following instructions are tailored for Mac OSX, however they could be translated for other OS'

### SDK

Download here: https://developer.android.com/sdk/

Do not need Android Studio, just the SDK Tools. Found under 'Other Download Options'

### Launch

Unzip the file in a sensible location, and run this within terminal:

`android-sdk-macosx/tools/android`

### Install packages

- Tools > Android SDK Tools
- Tools > Android SDK Platform-tools
- Tools > Android SDK Build-tools
- Extras > Intel x86 Emulator Accelerator

For each Android X.X version you want installed, select;

- SDK Platform
- Intel x86 Atom System Image

Then hit 'Install packages' button

### Install accelerator

File located at: `android-sdk-macosx/extras/intel/Hardware_Accelerated_Execution_Manager/IntelHAXM_1.1.1_for_10_9_and_above.dmg`

#### Create AVD

AVD = Android Virtual Device

- Tools > Manage AVDs
- Create
- Device: The nexus ones are quite good
- Target: The version of Android you want installed
- AVD Name: Anything you like
  - Recommended format: {{version}}-{{device}}
  - eg: 4.4.2-Nexus5
- CPU: Intel Atom (x86)
- Skin: No skin
- RAM: 2048
- VM Heap: 64
- Internal Storage: 1024
- SD Card Size: 1024
- Use Host GPU: Yes
