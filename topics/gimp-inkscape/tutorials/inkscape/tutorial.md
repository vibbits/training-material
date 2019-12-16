---
layout: tutorial_hands_on

title: "02 Inkscape"
questions:
  - "What is Inkscape?"
objectives:
  - "Learn how to use the software"
  - "What image file types can I import and export"
  - "How can I design my own illustrations"
time_estimation: "120m"
contributors:
  - chdeb 
---
## What is Inkscape?
Inkscape is professional quality vector graphics software which runs on Windows, Mac OS X and GNU/Linux. It is used by design professionals and hobbyists worldwide, for creating a wide variety of graphics such as illustrations, icons, logos, diagrams, maps and web graphics. Inkscape uses the W3C open standard SVG (Scalable Vector Graphics) as its native format, and is free and open-source software.

During this training we will use **Inkscape 0.92**. To download the most recent version, browse to the [Inkscape Download page](https://inkscape.org/en/download/).

### External training material
- [Online Inkscape tutorials](https://inkscape.org/en/learn/tutorials/).
- [Nick Saporito Inkscape tutorials for beginners](https://www.youtube.com/playlist?listPLynG8gQD-n8BMplEVZVsoYlaRgqzG1qc4 )
- [Nick Saporito Inkscape intermediate/advanced tutorials](https://www.youtube.com/playlist?listPLynG8gQD-n8AFcLFAkvqJYnQUiBweRh1y )

### User Interface
Inkscape is a single-window program. **Drawing tools** are on the left hand side, **option docks** are on the right. 
In the central window, you have the drawing area with default an A4 page as document layout. To select another format for e.g. posters, go to **File - Document Properties**. Next to the document size, you can adjust the background colour (default: transparent).

### Import Images
You can import scalable vector graphic files (.svg) and also GraphPad Prism graphs (.emf or .pdf format).
Inkscape is not used for editing images like GIMP. If you import bitmap images, note that they are not scalable like vector objects!

### Drawing lines and objects
You can draw a line with the **Draw Bezier** tool. You can make your own shape or just draw a line or path. On top of your drawing area you can select the Mode: Regular Bezier curves, Spiro paths, straight line segments and paraxial line segments. When selecting the straight line mode, you can hold the Ctrl button to make your line snap every 15 degrees around your previous point.

You can draw shapes by using the **Rectangle tool**, **Ellipse tool** and the **Create Stars and Polygons tool**. On top of the drawing area you can specify your polygon and star properties, size and lock aspect ration. Here is the Crtl key useful as well for creating squares, circles or specify the position of your object. Next to that, you can create spirals with the **Spiral tool**, the number of turns is free to select.

Selecting an object using the **Selection tool** (black pointer) will give you more options on top of the view area. You have the option to rotate, flip, change dimensions and XY position (in different units). You can change the position of the selected object compared to others (move up/down). 

### Fill and Stroke
When you have an object (polygon or others), you can select a color for the stroke and inside of the object. Click **Color - Fill and Stroke** to get the dockable box on the right. The fill and stroke have similar color options:

 - No paint: transparent object
 - Flat color: 1 single color (RGB, CMYK, HSL, etc.) + transparency
 - Linear Gradient: 2 or more colors in a free to select linear gradient
 - Radial Gradient: 2 or more colors in a free to select radial gradient
 - Mesh Gradient: depending on the shape, you can color you object using a grid
   Pattern: fill with a pattern from the drop-down list

Paths/lines can be transformed into arrows using the **Stroke style** option 'Markers'. The stroke style lets you decide on the stroke Width, Dashes, Joins and Caps.

### Paths
A path consist of lines and nodes. These lines can be straight or curved and you can make an object using paths ( closed path). When selecting the **Path tool** (second tool icon from the top) you have several options; add or remove a node, joining or breaking nodes apart and changing the node properties. You can also change the segment (line between nodes) properties with the options on top of the screen. 
You can convert an object into a path to gain more flexibility by selecting the object and go to **Path – Object to path**. Afterwards you can use the object tool or the path tool to manipulate the object. 

### Text
At the left there is also a **Text tool** available. With this tool you can create and change text, it's colour, font, style and size. After entering text, you’re able to manipulate it by double clicking on it. Text is otherwise an object like any other (e.g. rotations, size).
You can also attach text into a frame by selecting both text and object and click on **Text – Flow into Frame**. Select both text and a path and click **Text – Put on Path** to glue your text to e.g. a waved line. Once the text in aligned to the path it stays adaptable and can be removed from the path by **Text - Remove from Path**.

Text is an object at first. When you select **Path - Object to path** you can modify your text like any other object that is converted into a path (nodes and segments).

### Grouping, aligning and arranging object/paths
To group several object you must select them all (hold Shift) and select **Object – Group**. To unite several paths you must select **Path – Combine**. Both options are the same and allow you to manipulate objects/paths as one. Both actions can be reversed (Ungroup / Break Apart).

Several object must be aligned before you group them, think of text inside a box. To display the options, go to **Object - Align and Distribute**. When multiple objects are selected, you can align the top, bottom, left and right edges of the objects. Aligning on the central axes is also possible, this in both horizontal as vertical direction. The aligned objects always need an anchor, this can be changed in the box on top of the toolbox (Relative to:). This anchor can be an object (first, last, smallest or biggest) or the page, a selection or the complete drawing. Distributing objects works in a similar way, but manages the space between objects. For paths you can only align the nodes.

Aligning or distributing objects allows you to manipulate the X and Y position of your objects. There is also a virtual Z axis. When you have multiple objects with different colours, you can move the one above the other. Every new object you draw will be on top of all the rest. To raise an object one step or to the top, you can use the buttons on top of your screen. The same can be done to lower an object one step or to the bottom.

### Path Effects and operations
When you want to distribute/multiply an object along a guideline, there is a tool called Path Effects. First draw and select the object or group of objects and past it in the clipboard (Ctrl + C). Draw or select your path (guideline) and select **Path – Path Effects**. Click on the '+' sign and select the effect **Pattern Along Path**. In the new box on the right: select 'Repeated' on the option Pattern copies. Now click on 'Paste path' to paste the object you want to multiply. Note that only the shape is pasted, not the color. When adjusting the color, it will affect the entire path. To copy the colour, use Crtl+C again on your original, select your path of objects and go to **Edit - Paste Style - Paste Style**. There are also standard patterns to distribute along a path. When clicking on the '+' sign to add an effect, select ‘Gears’ or ‘Hatches (rough)’. Each of these effects have their own options to create an effect and to adjust the pattern.
When it comes to paths, you can do much more than combining them. When you want to cut one shape out of another shape, you can use the options in the Path menu; Union, Difference, Intersection, Exclusion, Division and Cut Path.

### Diagrams
To make a diagram with objects (circles, rectangles, stars, etc.) connected by lines, there is the Diagram connector tool. First you must draw and align the objects to create your diagram. Then select the Diagram connector tool. Every object can be selected by clicking in the white box in the middle of the object. Once connected the lines will follow the object if you move it to another place. The lines can be used as a path, therefore you can also modify them to e.g. dashed lines, arrows, etc.

## Exercises
> ### {% icon hands_on %} Hands-on: Exercise 1
> Image 1 PNG: [Image 1](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Drawing.png)
> Image 1 SVG: [Image 1 SVG](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Drawing.svg)
> Task: Reproduce the top strand. Afterwards, reproduce the bottom strand using the first one.
{: .hands_on}
> ### {% icon hands_on %} Hands-on: Exercise 2
> Image 2 PNG: [Image 2](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Drawing2.png)
> Image 2 SVG: [Image 2 SVG ](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/Drawing2.svg)
> Task: Reproduce one of the sets of this image. Afterwards, reproduce the others using the first set.
{: .hands_on}
> ### {% icon hands_on %} Hands-on: Exercise 3
> Image infographic 1: [Image 1](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/procent_bars.png)
> Image infographic 2: [Image 2](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/circle_infographic.png)
> Image infographic 3: [Image 3](http://data.bits.vib.be/pub/trainingen/GIMP_Inkscape/flower_diagram.png)
> Task: Try to reproduce one of these images using the video tutorial series from Nick (see top of this page).
{: .hands_on}