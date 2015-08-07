Android emulator setup
======================

### SDK

Download here: https://developer.android.com/sdk/

Do not need Android Studio; click 'Other download options'

### Launch

Unzip the file, and run command in terminal:

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

File located at: android-sdk-macosx/extras/intel/Hardware_Accelerated_Execution_Manager/IntelHAXM_1.1.1_for_10_9_and_above.dmg

#### Create AVD

AVD = Android Virtual Device

- Tools > Manage AVDs
- Create
- Enter a name (eg: Android Version - Device, 4.4.2-Nexus5)
- Device: The nexus ones are quite good
- Target: The version of Android you want installed
- CPU: Intel Atom (x86)
- Skin: No skin
- RAM: 2014
- VM Heap: 64
- Internal Storage: 1024
- SD Card Size: 1024
- Use Host GPU: Yes
