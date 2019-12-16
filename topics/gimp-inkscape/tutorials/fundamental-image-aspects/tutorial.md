
---
layout: tutorial_hands_on

title: "01 Fundamental Image Aspects"
questions:
  - "What do I need to know about images?"
objectives:
  - "Learn difference between bitmap and vactor files"
  - "What image file type to use"
  - "When do I have to use file compression"
time_estimation: "15m"
contributors:
  - chdeb 
---

## Bitmap vs Vector images
Images can come in different file format, but  in general there are 2 ways to create an image. Bitmaps are the most familiar, because we take bitmap pictures with our camera or smartphone. If we look online for images, it will be a bitmap. You can easily recognize bitmaps by zooming in, you'll see pixels (square blocks with 1 color).

For those who are designing or working in industry, vector images are more common. Vector images don't have pixels, so zooming in or out won't make a difference. Vector images are therefore suited for creating artwork in any size or shape. Those images are defined bylines, shapes and mathematical equations. Every object in your vector file have properties, like shape, size or color. Taking vector pictures with your camera is unfortunately not possible.

### Bitmap 
- Pixels in a fixed grid/map
- Resolution dependent
- Restricted to rectangle
- Resizing reduces visual quality
- Easily converted
- Minimal support for transparency
- Common file formats: BMP, GIF, JPEG, JPG, PNG, TIFF

**Bit depth or color depth** is the amount of data assigned to a pixel (e.g. 1-bit = black/white, 4-bit = 16 colors/shades of grey, etc.) The more data, the more realistic your image will be. More data per pixel also means larger files.

### Vector
- Scalable drawings
- Resolution independent
- No background
- Inappropriate for photo-realistic images
- XML based text format
- Common file formats: SVG, AI, CGM, DXF, WMF, EMF

## Pixels
Resolution = number of pixels =  how much detail an image holds
PPI: pixel per inch
- Screen pixel density (monitor/smartphone)
- Tells you how large an image is

DPI: dots per inch
- Print-out dots density (inkjet/laser printer)
- Printer settings

An image at 300 or 72 PPI will look fine on a monitor, but printing is another matter! Print it on paper and you will notice the difference between 72 DPI and 300 DPI

## File formats and compression
### JPG/JPEG
- Supports 26 million colours (24 bit)
- Lossy compression (information is lost from original file)
- Small file size (compressed)
- Photographs

### BMP
- Supports 8/16/24-bit
- Uncompressed file format
- Large file size

### TIFF
- Tagged Image File Format
- All colour and data information is stored
- Uncompressed (lossy and lossless compression is possible)
- Very large file size

### GIF
- Graphics Interchange Format
- Only 256 colours possible (8-bit)
- Replace multiple occuring patterns into one
- Small file size
- Animation

### PNG
- Portable Network Graphics
- 256 / 16M colours
- 8-bit transparancy
- Lossless compression

### SVG
- Scalable Vector Graphics
- XML-based format
- Lossless data compression
- Creatable and editable with a text editor
- Can contain both bitmap and vector data

### PDF
- Portable Document Format
- Can contain both bitmap and vector data

### RAW/DNG
- Digital Negative (DNG) is a universal RAW file format
- Raw image file (without white balance, color saturation, contrast settings, …)
- RAW files can be camera brand specific
- Large file size
- Multiple options without taking the picture again

### When to convert and compress?
Most of the times, your images will have 2 purposes, either **publication** in a journal or a **presentation** (e.g. PowerPoint). Although you may use the same images for both those events, you don't have to use the same files! 
#### Images for publications
- Raw/uncompressed image files (e.g. TIFF)
- High quality (300 PPI) and resolution
- Lossless compression (e.g. PNG) if compression in allowed
- Check journal website for image properties and policies

#### Images for presentation:
- Normal quality (72 PPI) and smaller resolution
- Compression is allowed (e.g. JPEG)
- Smaller file size

## Guidelines on image editing
Scientific accepted image manipulations are described in guidelines. VIB also has a document to guide you in what is and what isn't acceptable when adjusting your images. Some examples are:
- No specific feature within an image may be enhanced, obscured, moved, removed or introduced
- Adjustments of brightness, contrast or color balance are acceptable if they are applies to the whole image as long as they do not misrepresent information in the original
- Grouping of images from different parts of the same or different gel, fields or exposures must be made explicit by the arrangement of the figure (dividing lines)
- The original data must be available by the author when asked to provide it, otherwise acceptance of the publications may be revoked

you can find all the VIB guidelines [here](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/VIB_guidelines.pdf).