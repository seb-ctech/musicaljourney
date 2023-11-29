The Practical journey will be visualized and published as a Netlify static webapp/page.
It will be implemented in Elm in the spirit of Functional Typed Language, similar to Haskell.

### System

The website should fetch its content automatically. The folders show the implementation in different languages: Tidal, Euterpea, etc...
The website should then prepare a view for every environment. Read the different files and extract the code for them. Find Associated song file to file.
Find associated Markdown/Documentation file that contains the process to jump to next level of abstraction. This page needs to be hosted as a static website
on something like netlify.

- Host with Elm support

https://elm-pages-netlify-cms.netlify.app/

- Build static content while Building

https://elm-pages.com/
https://package.elm-lang.org/packages/dillonkearns/elm-pages-v3-beta/latest/BackendTask

- Parse Files

https://package.elm-lang.org/packages/dillonkearns/elm-pages-v3-beta/latest/BackendTask-File

I Want a lighweight environment for quick GHCi evaluation. Each environment has subfolders.
GHC versions should be recognized automatically. Each sub-folder should have a way to switch between environments.
If that is not possible I have to define vs-code tasks for it. 

https://stackoverflow.com/questions/63837574/haskell-could-not-find-module-test-quickcheck/63841684#63841684

### The App

The app will start by talking about abstraction in a general way.
Then it will transition to music and then to programming. It will talk about the use case: the book.
And present the first exercise. The code becomes the notation. So after reading the exercise prompt.
The resulting code will be shown with a play button. Giving a playback of the resulting music.


- Animation support for Transitions

- Represent Code in HTML, with Syntax Highlighting

https://pablohirafuji.github.io/elm-syntax-highlight/ (Using Elm for Haskell syntax highlighting)