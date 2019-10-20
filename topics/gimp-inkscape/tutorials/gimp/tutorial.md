---
layout: tutorial_hands_on

title: "02 GIMP"
questions:
  - "What is GIMP?"
objectives:
  - "Learn how to use the software"
  - "What image file types can I import and export"
  - "How can I get my image publication-ready?"
time_estimation: "90m"
contributors:
  - chdeb 
---
# What is GIMP?
GIMP is short for **GNU Image Manipulation Program**. It is a free and Open-source, cross-platform image editor available for GNU/Linux, MacOS and Windows operating systems. During this training we will use **GIMP 2.10** on Windows. To download the most recent version for your OS, browse to the [GIMP Download page](https://www.gimp.org/downloads/).
## External training material
- [GIMP Manual page](https://www.gimp.org/docs/).
- [GIMP 2.10 Basics on YouTube](https://www.youtube.com/watch?v=2EPIUyFJ4ag)
- [Nick Saporito GIMP Tutorials](https://www.youtube.com/playlist?list=PLynG8gQD-n8Dl23X0o1HFu_5PmBl79niz)

## User Interface
GIMP has a 'Single-window' mode, this allows you to switch from multiple windows (for e.g. multiple monitors) to a single window. When the 'Single-window' mode is disabled, you have separate windows for toolboxes, view area and dockable dialogs. When enabled you have one window with all tools, options and dockable dialogs attached to the central view area. For beginners, we would advise the 'Single-window' enabled.
On the left panel you have the 'Toolbox' (if not present: **Windows - Toolbox** or press **Ctrl + B**) and underneath the 'Tool Options' dialog. Selecting a tool will result in a different Tool Option bar. Every tool has his own set of parameters and functions, best to keep them close to each other. 
On the right-hand panel you can find other 'dockable dialogs'. These are easy to move, remove and re-introduce if necessary. To get a list of all 'dockable dialog' go to **Windows – Dockable Dialogs - ...** . If you want a full screen view of your image select **Windows – Hide Docks**. 

## Import data and image properties
To import an image: **File – Open**
When you select an image (any file type) in the import window, you get a preview and information on the right side. Click **Open** and the image(s) will be displayed in the middle box at zoom level 100% (1 pixel image = 1 pixel screen) or fitted to your windows. To zoom use Ctrl + mouse scroll up or down. Multiple images in GIMP are displayed in different tabs on top of the View Area.
Before you export your image, make sure it has the right resolution and pixel density. **Image - Image Properties** will give you all the information your image holds. This information can be very useful when you open an image from an unknown source.

## Selection
Rectangular selection has several options and shortcut keys. The first icons in the tool options are the selection modes: add to selection (Shift), subtract from selection (Ctrl) and intersect with selection (Shift+Ctrl). More options are: feathering edges, rounding of the corners, expand from center, lock aspect ratio, size and position and if necessary to highlight the selection). The Ellipse selection tool has more or less the same options.
There are other selection tools available: Free Selection, Select by Color, Fuzzy Selection, Scissor Selection, Foreground Selection. Those tools have different tool options and are only used in specific cases.

## Transforming
There are several ways to transform your image or selection; rotating, scaling, shearing and flipping. You can transform a selection, a layer or the image. When using the rotation tool, you have several options in the dockable dialog below. An important option is “Clipping” this will change the aspect ratio of your image after rotating. 
Another way of rotating an entire image is: **Image – Transform – ...** then you have the option to flip (horizontal/vertical) or rotate (90°/180°). The entire image will be rotated including the selection and image orientation. 

## Layers
Make sure you have the dockable dialog ‘Layers’ in your window. All options for layers can be found in the menu bar “Layer”. You can make a new blank layer or duplicate the current layer (e.g. copy of original image to compare or as back-up). In the dockable dialog you can hide or show a layer (eye button), rename them or move them up and down in the layer stack. If you want to link/connect two or more layers, you can use the chain button (next to the eye button).
To copy a selection to a new layer, perform a regular copy/past action of that selection (Ctrl+C and then Ctrl+V) and select **Layer - To New Layer**
If you want to merge all layers into one layer you can select **Image – Merge Visible Layers**.

## Brightness and contrast
In the menu bar you can find **Colors** . This menu has multiple option to manipulate your image; 
- Color Balance will change the cyan, magenta and yellow color levels of your image
- Brightness and Contrast will change brightness and contrast and you can save these settings as a favorite 
- Threshold will reduce your image to two colors by using a threshold value
- Adjust color curve will change the gamma setting of your image
- Posterize will change the number of colors (2-256)

## Guides and cropping
You can split your image in different sub-images. This can be done by using 'Guides'. To create such a break-line, go to **Image - Guides - New Guide... or (by Percent)...**. You can create a horizontal or vertical guide at the value/percentage you enter. A guide will be displayed as a blue dashed line. To chop your image in multiple parts, go to **Filters- Web- Slice** (Older versions: Image - Transform - Guillotine). The sub-images will be generates in the folder you selected.
If you only want a selection of your image without all the rest you can crop by clicking **Image – Crop to Selection** or use the Crop tool from the Toolbox.

## Scaling and print size
When you want to scale your image to a smaller resolution you can select **Image – Scale Image**. There you can scale in pixels (or another unit) and you can lock the aspect ratio (chain symbols).
If you want to change the print size to make your image suitable for publication you can select **Image - Print Size...**. There you can change the dimension/resolution and pixel density of your image.

## Remove background color
If you download an image of a company or university logo, it might have a white (or any other color) background. This can be very annoying when the destination background is different. In order to remove the background color, we first have to add an alpha channel to this image: **Layer - Transparency - Add Alpha Channel** - If the Alpha channel is already present, skip this step. Now you're able to get a transparent background using the option: **Image - Color to Alpha**. In the new window you can select the color which you would like to convert to transparent pixels. You can either select by clicking the color bar or use the color picker icon.

## Exporting
Select **File – Export as…**
If you click on the '+' next to Select File Type, you have a list of all possible extensions in which you can export your image. Each of those file formats has different compression options.

# Exercises on image manipulations in GIMP

> ### {% icon hands_on %} Hands-on: Exercise 1
> Source file: [http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/original_file.tif Image 1]
> Task: Split this image in 2 parts, one for each gel. Make sure the band are horizontal and export the 2 new images in the same file format as the original. You can adjust brightness and contrast to make all the band more visible.
{: .hands_on}
> ### {% icon hands_on %} Hands-on: Exercise 2
> Source file: [http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Exercise1.1.jpg Image 2]
> Task: Rotate this image 45 degrees and crop an image of 500x500 pixels out of the original. Make sure the printing resolution is set to 300 ppi and export this image as a PNG file. Adjust brightness and contrast to make this image look better.
{: .hands_on}
> ### {% icon hands_on %} Hands-on: Exercise 3
> Source file: [http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Exercise1.2.jpg Image 3]
> Task: Cut this image in 4 equal parts. Know that the printing width is 150 mm and the journal demands a minimum op 300 ppi for all 4 images. Also export each of them in a different file formats without losing image quality. Adjust brightness and contrast to your own opinion.
{: .hands_on}
> ### {% icon hands_on %} Hands-on: Exercise 4
> Source file: [http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Exercise1.3.jpg Image 4]
> Task: Adjust brightness and contract of this images and export it in a way to make the file as small as possible. Use preferably lossless compression (try lossy compression to compare file size), there is no restriction on file formats. Be sure your image is exported with at least 300 ppi.
{: .hands_on}
> ### {% icon hands_on %} Hands-on: Exercise 5
> Source file: select from the internet
> Task: Download an image from your most favorite brand and remove the white (or other color) background. Export this new image in a format that support transparent pixels.
{: .hands_on}