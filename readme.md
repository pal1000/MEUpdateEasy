### Easy launcher for Intel ME Firmware update tool
This script slightly reduces the complexity of the task of updating Intel Management Engine firmware or related AMT/TXE/SPS when the manufacturer of the system fails to update it with security patches like [NTEL-SA-00086](https://security-center.intel.com/advisory.aspx?intelid=INTEL-SA-00086&languageid=en-fr).
### Step by step patching of Intel ME vulnerabilities (standard)
- Check if you are vulnerable by running NTEL-SA-00086 assessment tool available for download on the link above. If you are, take note of your Intel ME/AMT/TXE/SPS firmware version reported by the tool and continue with next step. This is needed in case you get to the advanced phase.
- Check if your motherboard manufacturer provides firmware/BIOS update if your system is custom-build or the manufacturer of your system (OEM) otherwise (ex: Dell, Lenovo, Acer, Asus, LG, etc). If no firmware / BIOS update is available, mostly on aging systems, the next steps in the advanced section will help you patch it without OEM or motherboard manufacturer assistance.
### Step by step patching of Intel ME vulnerabilities (advanced)
To patch the Intel ME firmware we need 4 pieces of software:
- Up-to-date Intel MEI or SOL driver. Depends on your system. Look in Device Manager - System devices. Corporate users that actively use ME features need to install/update both driver and software. MEI/SOL drivers and software are available at [win-raid forums](https://www.win-raid.com/t596f39-Intel-Management-Engine-Drivers-Firmware-amp-System-Tools.html)
- This script. It makes the firmware update easy, requiring a simple double-click. No Run As Admin is required, elevation request via UAC is done automatically. On execution this script only asks for the firmware filename. Usually a .bin filename. Note that if you copy-paste the firmware filename you need to manually add the extension too.
- The updated firmware. Here the ME firmware version reported by Intel vulnerability assessment tool comes into play. From that version we must extract its branch. It is usually the first 2 numbers from the version string. Some ME firmware branches have multiple variants. You have to identify the correct one for your system. Again Intel vulnerability scanner can help with that as well. A detailed step-by step process along with the firmware catalog is available at win-raid forums.
- The firmware update tool for your ME firmware branch is also available at win-raid forums.

This script and firmware update tool must be on the same folder. To ease things up the firmware filename should be placed there too.


On corporate environment the ME keys should also be renewed see the win-raid forum thread from above.
