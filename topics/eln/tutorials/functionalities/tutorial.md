---
layout: tutorial_hands_on

title: "01 ELN Functionalities"

questions:
  - "How to use ELN?"

objectives:
  - "how to document in ELN"
  - "where can I find my data in ELN?"

time_estimation: "60m"
key_points:

contributors:
  - chdeb
---
# Login
When launching the application (Windows: double-click the **E-notebook 2014 client** icon – Citrix: click on the ELN 2014 icon and open the .ica file, Citrix Workspace will launch the application), you will see the following login window:

In order to login on ELN, you need a **valid VIB account**. The VIB username usually has a format like: *firstname lastname*. More information on [https://help.vib.be](https://help.vib.be) or mail eln@vib.be.  

When clicking on **Connect** the application will retrieve your data. The **Work Offline** option is only available with the client installation and will allow you to make adjustments to the data in your Offline folder.

> Note: when launching the application for the first time, a download of all collections will start, this usually takes 1 or 2 minutes.

# Layout
The layout is resembling to Microsoft Office. It has 3 main parts; the ribbon with options on top, the navigation and history area on the left and the working area on the right.

The default starting point is the Home location, this gives an overview of all data in the navigation area on the left and any modified experiments since one month on the right.
In the Audit Trail (bottom left) you can find the history of the object selected above. This history allow you to access previous versions of an experiment and retrieve a file in order to bring it back to the present. Every version has a timestamp and operator (= user that pressed the save button). Previous versions of an experiment can**t be modified, only the last version is adjustable.
Navigating to your colleagues or Home can be done with the orange icons in the upper left corner. Next to the navigation buttons you find the Save button. When saving you can add annotations as well.
# Ribbon
The Ribbon is where you can find the options corresponding with your selection (navigation area or section). By default, there are three tabs: Home, View and Data. Sections have specific tabs in the ribbon, e.g. Document, Image, Text, Table, Property List, etc. An example can be found below (Text):

# Project, Notebook, Experiment
There are 3 basic levels to organize your data: Project, Notebook and Experiment (see icons below). You can see them as folders with a certain hierarchy. Only an experiment contains files. To add one of the levels click on the icon in the **Home** tab in the ribbon. 

# Sections
An experiment consists of sections, every section is a file or page. To add a section, select the icon in the **Home** tab in the ribbon. Some sections are hidden behind the **Other** button.
You can add sections automatically by drag and dropping them into your experiment. E-Notebook will recognize Word, Excel and PowerPoint files, PDF documents and images. GraphPad Prism files are not native to E-Notebook and will result in an Ancillary data section, this will happen with any other file type that is not native to the program.
## General Page
Creating a new experiment will give you a blank experiment with only one section, by default this is the General page. This is an example of a General Page:

Every lab group has a slightly different version of this General page. The universal parts of this section are the **General Information** and the **Reference to experiment** field. In the first field you have the option to enter general properties of your experiment such as start date, project, etc. Adding extra properties is available in the **Property List** tab in the ribbon.

Adding a reference to your experiment can be very useful to link similar experiment to each other or make a series of experiments. This refence can be any experiment within your group. To add a reference, click on the option in the **Home** tab in the ribbon.

As last there are 3 or 4 text boxes to add keywords, aim of experiment, results, specifications or a conclusion.
## Microsoft Office sections
Three MS Office applications are supported in the E-Notebook software: Word, Excel and PowerPoint. All other MS Office files can be uploaded using the Ancillary Data section.

For the supported application you can add files using the corresponding section. This will initially display a (print) preview of the file, double-clicking the preview will launch the MS Office application to make adjustments. All other options are displayed in the ribbon:

## Images
Using the Image section in E-Notebook will allow you to import one (1) image file. All common image extensions are supported, camera brand specific files (e.g. RAW or DNG) can be uploaded using a non-file-specific section. Next to the image file itself you can add a title and notes.

## PDF files and Captured Image
Using the PDF section in E-Notebook will allow you to import 1 PDF file. Next to the PDF file itself you can add a description, date and a document name.

## Ancillary Data (a.k.a. Binder)
This non-file-specific section will save 1 file. In order to open the file , you must double-clicking on it, this will launch the according application outside ELN. Closing the external application again (e.g. after making adjustments) will result in this window:

Click **Continue** to save your changes and re-upload the new file in ELN or click **Cancel** to ignore the changes.
## Supplementary Data Management (SDM)
Files imported in this section will be saved on an internal network drive linked to ELN. This means that files in SDM won**t be accessible outside of your research center or university network. Files in the SDM section are not limited to the file size limit of 30 MB. 
Next to the default list of sections, there are some lab-specific sections for PCR or Western Blot. To add one of these lab-specific sections, click on the **Other** icon and select your section.

# Sharing data and linking experiments
## Access rights for others
To grant a colleague access to your data, you simple select the object and click on the View tab in the ribbon. In the Properties field you click on Security. A new window will appear (left picture). The inherited privileges are default settings, you’re not able to modify this. The assigned privileges on the other hand can be modified by clicking ‘Grant’.

By filtering on user group or user you can select the group/person (right picture). The type of privilege can be: read, read and write, full control. You can define this in the next window.

Removing the privilege can de done by selecting the person or group and click on ‘Remove’. For both granting or removing access privileges there is no notification system, you have to tell them yourself.
## Experiment shortcuts
When a colleague granted you access to a project/notebook/experiment you can place a link to this object in your own ELN. This makes navigating to this object easier and allows you to group all your collaborations within your own ELN hierarchy. To create such a shortcut, follow these steps:
1. Select the object of interest
2. Right click – Copy
3. Navigate to your own ELN
4. Right-click on the location you want the link to appear
5. Select Paste Reference

> Note: shortcuts can be removed, the original data however is not deleted. 
## Templates
Templates can be created by every user and can be shared with your colleagues. To create a template, follow this procedure:

1.	navigate to ‘User Configuration’ – ‘Templates’
2.	create new experiment
3.	build your new default experiment/template by adding information/sections
4.	save your template

Next time you want to create a new experiment, you will have the option to create a blank or template experiment. 
## Search
The collection search can be used for users, projects, notebooks and experiments. No content can be found with the search box in the upper right corner.
The Advanced Search option can find experiment content. You can find it in ‘Quick Links’ above the navigation pane.


