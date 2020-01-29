---
layout: tutorial_hands_on

title: "01 Installation and support"

questions:
  - "How to install ELN?"

objectives:
  - "how to install and launch ELN"
  - "where can I find support?"

time_estimation: "5m"
key_points:

contributors:
  - chdeb
---
# Installation
## Windows
> Requirements to install E-Notebook 2014: 
> 1. Microsoft Windows
> 2. MS Office, Adobe Reader (or similar)
> 3. ChemBioDraw (optional - see STEP 2)
> 4. Valid VIB login credentials. Check your login and password on [https://storefront.vib.be/](https://storefront.vib.be/).

**STEP 1: E-Notebook 2014**

1. Browse to [https://eln.vib.be/clickonce/](https://eln.vib.be/clickonce/)
2. Click “Install” and open the file
3. After the installation, the software is automatically launched and the login window appears
4. Log in with your VIB credentials (see requirements)
5. Close E-Notebook after successful launch: File - Exit or 'X' in the right upper corner
6. Generate a shortcut on the desktop (right click - Send to - Desktop): All Programs - PerkinElmer - E-Notebook 2014 Client
7. Install ChemBioDraw (STEP 2)

**STEP 2: ChemBioDraw**
Note: In case you only reinstall the ELN client, you don't have to reinstall the ChemBioDraw component
1. Download the ChemBioDraw installation file from the same website as E-Notebook 2014: [https://eln.vib.be/clickonce](https://eln.vib.be/clickonce)
2. Start the installation
3. Install ChemBioDraw ActiveX component in suggested destination
4. Follow the installation wizard instructions
5. Click on “Install” and subsequently on "Finish"

> Why use ELN throught Citrix on Windows? 
Some older Windows versions cause problems with the E-Notebook 2014 Client installation.

**STEP 1: Citrix Workspace app**
1. Browse to [http://www.citrix.com www.citrix.com] 
2. Click on Download
3. Select Citrix Workspace app from the list of possible downloads
4. Download and install Citrix Workspace app

**STEP 2: Launch ELN online**
1. Browse to [https://storefront.vib.be](https://storefront.vib.be)
2. Login with your VIB credentials
3. Launch the ELN application by clicking on the icon
4. If your browser asks to download and open an .ica file, please agree
5. Citrix Workspace will open en launch the application

## MacOS, Linux, mobile devices
**STEP 1: Citrix Workspace app**
1. Browse to [https://www.citrix.com www.citrix.com] 
2. Click on Download
3. Select Citrix Workspace app from the list of possible downloads
4. Download and install Citrix Workspace app
5. After the installation on Linux execute the following command:
```
sudo cp -a /usr/share/ca-certificates/mozilla/DigiCert_Assured_ID_ Root_ CA.crt /opt/Citrix/ICAClient/keystore/cacerts/
```

**STEP 2: Launch ELN online**
1. Browse to [https://storefront.vib.be](https://storefront.vib.be)
2. Login with your VIB credentials
3. Launch the ELN application by clicking on the icon
4. If your browser asks to download and open an .ica file, please agree
5. Citrix Workspace will open en launch the application

# Support
- Call us at +32 (0)9 248 16 15
- Mail us at eln@vib.be