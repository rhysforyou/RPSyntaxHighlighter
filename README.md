# RPSyntaxHighlighter

*An `NSAttributedString`-backed syntax highlighting library for iOS*

![A screenshot of the sample app](https://raw.github.com/rpwll/RPSyntaxHighlighter/master/Media/screenshot.png)

RPSyntaxHighlighter is a easy to use, fully extensible syntax highlighting library for iOS. It was built with a few ideas in mind:

1. **Ease of use:** it should be easy to highlight and process code in your app. This is why we use `NSAttributedString`s which can be displayed in most UIKit controls as of iOS 6.
2. **Extensibility:** The language definitions and themes used by RPSyntaxHighlighter are simple JSON files. This means it's easy to add extra languages or design a theme that matches your app.
3. **Simplicity:** The entire RPSyntaxHighlighter codebase consists of three classes, meaning it's easy to understand what's going on. It's also fully documented with [appledoc](http://gentlebytes.com/appledoc/).

**Note:** RPSyntaxHighlighter is currently still in development and not yet ready for use in your code.

## Using RPSyntaxHighlighter

The easiest way to use RPSyntaxHighlighter is by calling the `highlightCode:withLanguage` method on it. This single method covers 90% of the most common use cases. If you want to do anything more complicated, the class headers are all thoroughly documented and serve as a good starting point.

## Language Definitions

A simple language definition looks like so:

```json
[
    {
        "scopes" : ["operator"],
        "pattern" : "\\+|\\!|\\-|&(gt|lt|amp);|\\||\\*|\\="
    },
    {...}
]
```

As should be immediately obvious, a language definition is nothing more than a JSON document containing an array of objects. Each of these objects consists of a regular expression *pattern* and an array of *scopes* to be applied to the matched section of code. The scopes applied to a section of code are effectively tags used to tell the highlighter how to style a section of code.

The array of scopes are applied to a section of code in order, as such you should specify them in order from least to most specific such that more specific styles override simpler ones. The same goes for the order of matchers in the document.

## Theme Definitions

Here's an exceprt taken from the included `tomorrow-night` theme:

```json
{
  "default" : {
    "color" : "E9E2CB",
    "background" : "1C1F21",
    "font" : "DejaVuSansMono",
    "fontSize" : 14.0
  },
  "keyword" : {
    "color" : "B193BA"
  },
  "constant" : {
    "color" : "DD935E"
  },
  "string" : {
    "color" : "B5BC67"
  }
}
```

As with language definitions, themes are simple JSON documents consisting of a single dictionary. Each key in the dictionary corresponds to a scope in the code to be highlighted with the exception of *default* which applies to the document as a whole.

The value associated with these keys is another dictionary that can have any of the following properties:

- **color** – A hexadecimal colour value used to colour text
- **background** – A hexadecimal colour value used to highlight behind text
- **font** – The font to be used, referred to by its PostScript name
- **fontSize** – The size the font should be rendered at, in points

Note that any fonts you wish to use must be included in the main bundle of your app.
