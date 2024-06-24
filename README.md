# CLI Hangman game

This is a Hangman game for the command line interface. I created it to get more familiarized with Lua.

# How to play

You're given a secret word, and your mission is to guess which letters this word contains. If you commit
an error 8 times, you lose. You're given a preview of the word showing its length and the words you've
guessed correctly in their positions.

The UI of this project contains:

* An ASCII picture showing the hanged man. The more mistakes you make, the more the drawing shows.
* The hidden word preview.
* Your number of errors.
* The letters you have already said listed.
* A guide telling the results of the last action.

Write a single character and press `enter` to submit the input.

# Executing

You need Lua installed to execute to run this program ([link](https://www.lua.org/download.html)). Once you
download the files, go to the directory and execute:

```bash
lua hangman.lua
```

# Credits

All code by me, Iván.

The ASCII art was taken from [here](https://gist.github.com/chrishorton/8510732aa9a80a03c829b09f12e20d9c).

I don't remember from where I took the words, but if I find it I'll give the proper credit :'D