# congocc-website
A static website dedicated to all things CongoCC, including the parser generators, multiple programming language parsing, an updated FreeMarker template system, and more. 

Currently, the congocc-website is being developed to use Asciidoc-formatted text files and JBake to generate the static web pages displayed on this website. Stay tuned and check congocc.org for the latest information.

## Technical Details
JBake expects to find the Asciidoc files to convert into web pages in folders inside the "content" folder. However, if desired, the default location for the input files/folders can be overridden on the jbake command line.

JBake expects to send the generated web pages to a default folder named "output". This folder will contain all the files necessary display the website. The default output folder can also be overridden on the jbake command line.

JBake will be initialized to use FreeMarker templates to generate the files for the website. The resulting website will be formatted very similarly to the jbake.org website which in turn is very similar to the formatting used by AsciiDoctor-pdf, which converts Asciidoc files into pdf files.

JBake uses default properties to control many behaviors. These defaults can be overridden in a user's properties file. Setting the archives property to true causes an archive file to be generated that lists the dates of all of the blogs in chronological order. The archive page can be accessed thru the navigation bar/menu bar. Setting the tags property to true causes a separate page to be generated that groups and lists each blog by its tag(s). This is page is NOT currently integrated into the default website. The author and date of any article is listed in its header but NOT identified by jbakexxxx properties but the date IS recognized.

### Some JBake Options
    jbake -i        initializes a JBake installation
    jbake -b        "bakes" all of the pages into a website
    jbake -s        "serves" the content. jbake watches the designated content folder(s) and bakes ALL of the files any time a change is detected. The site.host property can be set to a port on localhost to preview the baked output. These baked files can then be uploaded to the docroot location for the website.

### To Be Determined
Ideally, the same Asciidoc files will perform multiple roles: blog text and pdf tech documentation. Asciidoc documentation show that conditional text is available using ifdef-endif directives to mark portions of text that will only be displayed when the corresponding setting is defined (or NOT defined).

### AsciiDoc Conditionals
AsciiDoc can use ifdef . . . endif and ifndef . . . endif conditional statements to delimit blocks of text to include or exclude from an outputted document. Here's a few rules.

#### Define Custom Attributes
Surround the custom attribute with single colons. For example

    :myattribute:

To use this custom attribute

    ifdef::myattribute[]
    The conditional text goes in here and can continue as long as you want until the end block delimiter (endif::[] is reached
    endif::myattribute[]

The capitalization of the attribute in the ifdef statement doesn't have to match its capitalization when it was defined but for tidiness it probably should match. 

In the endif terminator, the name of the attribute is optional - the most recent ifdef statement is normally used.

You can define a custom attribute and then "turn it off" by inserting the bang symbol at the beginning of the attribute as follows

    :!myTurnedOffAttribute:

This way you can have the custom attribute ready for use but turned off so you don't see the conditional text until you want it. Preliminary testing indicates that the jBake header info can be included at the top of a text file inside a ifdef::jbake[] conditional block but omitted from PDF by using the bang to turn off the jbake attribute.

AsciiDoc also includes the ifndef conditional for "if NOT defined" situations. It works pretty much the same way but the reverse of ifdef. Any ifndef blocks must be delimited with endif as well.

ifdefs can also call out more than one attribute. For example, if you were working on a project with multiple versions, you could specify blocks that applied to just versions 1 or version 3, etc, by combining them on same ifdef line. You can also specify their relationship (AND, OR, etc). See AsciiDoc docs for more info on how to do this.