title=README.md
date=2022-04-30
author=Nelson Chamberlain
type=post
tags=readme
status=draft
~~~~~~
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
    
### Some JBake Requirements
JBake requires a "header" section that includes: author, date, jbake-type, jbake-tags, jbake-status. These should go on separate lines WITHOUT blank lines separating them. Blank lines cause JBake to NOT be recognize the asciidoc as a web page/post and to NOT generate any html output.

JBake also requires that the assets, output, and template directories be located in the same directory as the content directory (which contains the asciidoc pages/posts). This requirement means that .gitignore file must be updated so it will ignore these folders and since .gitignore is also tracked under git, any time it is updated, it needs to get pushed to the repository. 

If we make significant changes to the FreeMarker templates, the template directory may also be kept in the repository so we don't have to reinvent the wheel if the templates get crunched. And we might want to upload all these "support" directories to the repository since they are less than 1MB and that way one could download the complete build environment and regenerate the website (after installing JBake executable).

### Bootstrap
The bootstrap.js library provided with JBake was last updated in 2014 (v3.1.1) and the current release is 5.1-ish. Significant capabilities have been added (a photo carousel, accordions, and a variety of other components, svg icons, etc). Need to see if we can update JBake to use latest version of Bootstrap.

### jQuery
The jQuery.js library included with JBake is version 1.11.1 while the current version is 3.6.0. Not sure what changes have happened since v1.11.1 was released but it's probably been a while and one would assume that numerous safety & security fixes have been included.

### prettify.js
The prettify.js library is also included JBake and is probably also pretty out of date. I don't see a version in provided .js but the latest version is 3.1.10.

### Using Conditionals to Control Output Types
Ideally, the same Asciidoc files will perform multiple roles: blog text and pdf tech documentation. Conditional directives in Asciidoc allow you to control which text is displayed/outputted, depending on the attributes defined.

### AsciiDoc Conditionals
AsciiDoc can use ifdef . . . endif and ifndef . . . endif conditional statements to delimit blocks of text to include or exclude from an outputted document. Here's a few rules.

#### Define Custom Attributes
Surround the custom attribute with single colons. For example

    :myattribute:

#### Use Custom Attributes
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

#### Selecting Output for Either Blog or PDF
The PDF books that have been produced so far have all begun with a "master page" that defines the book settings, title, table of contents, pagination, etc, as well as the chapters to include. Most importantly, the book title MUST begin with single "=" to mark it as the highest level in the book.

The JBake web pages are expected to be more or less stand alone docs and REQUIRE a title for the post or page that is marked with a single "=" as the highest level on that post/page.

The Book Title is unhappy if any of its subsections are also marked with a title ("="). The web pages are unhappy if they don't begin with a title.

What worked was to define a custom attribute in the PDF book master page, such as:

    :pdf-doc:

And then down inside each web page to include in the book:

    ifdef::pdf-doc[]

    == Chapter title or === section title

    endif::[]

    ifndef::pdf-doc[]

    = Post or Page Title

    . . . . restof JBake header

    endif::[]

So when you generate the pdf, it sees the definition of pdf-doc and uses the correct level of indenture for the Chapter or Section titles and ignores the JBake header info. And when you are in JBake, it doesn't see the pdf-doc attribute definition so it ignores the Chapter/section titles and uses the JBake header info, including the top level title.

So some of the fun stuff in the blog, such as scandalous accusations or serious fun-making can be marked as ifndef::pdf-doc[] blocks and they won't show up in the more serious book material. And in the same way, the section/subsection titles and levels of indenture can be marked ifdef::pdf-doc[] so they only show up in the book.

