#!/bin/lua

-- Initial setup
math.randomseed(os.time())

local art = require "src/art"
local wordList = require "src/words"
local valueInTable = require "lib/intable"

local randWord = wordList[math.random(1, #wordList)]
local word = {}
for i = 1, #randWord do word[i] = string.sub(randWord, i, i) end
local errors = 0
local guesses = {}
local actionText = "Introduce your guess."

-- Check if the game should continue playing
local function checkEnd()
    if (errors >= 8) then
        actionText = "You lost!"
        return true
    end
    local winCount = 0
    for i = 1, #guesses do
        for j = 1, #word do
            if guesses[i] == word[j] then
                winCount = winCount + 1
            end
        end
    end
    if winCount >= #word then
        actionText = "YOU WON!!!"
        return true
    end
end

-- Function to print information
local function printInformation()
    local displayText = "" -- Display the complete word with already guessed letters
    for _,v in pairs(word) do
        if valueInTable(guesses, v) then
            displayText = displayText .. string.upper(v) .. " "
        else
            displayText = displayText .. "_ "
        end
    end
    local saidLetters = "" -- Displays the said letters
    for _,v in pairs({
        "a","b","c","d","e","f","g",
        "h","i","j","k","l","m","n",
        "o","p","q","r","s","t","u",
        "v","w","x,","y","z"
    }) do
        if valueInTable(guesses, v) then
            saidLetters = saidLetters .. v .. " "
        end
    end
    if errors == 8 then
        local endDisplay = ""
        for _, v in pairs(word) do
            endDisplay = endDisplay .. string.upper(v) .. " "
        end
        displayText = endDisplay
    end
    os.execute("clear")
    print ("\n    HANGMAN by Ivan :3\n")
    print (art[errors + 1])
    print ("    " .. displayText .. "\n")
    print ("    Errors: " .. errors .. "/8")
    print ("    Letters used: " .. saidLetters)
    print ("\n    >> " .. actionText .. "\n")
end

-- GAME LOOP --
while true do
    if checkEnd() then
        printInformation()
        break
    end
    printInformation()
    local input = string.lower(io.read()) -- Check input
    if input and string.len(input) == 1 then
        if not valueInTable(guesses, input) then

            table.insert(guesses, input)
            if valueInTable(word, input) then
                actionText = "\""..input.."\" is included!"
            else
                errors = errors + 1
                actionText = "\""..input.."\" is not included."
            end
        else
            actionText = "You already said that letter!"
        end
    else
        actionText = "There was an error with the input. Try again."
    end
end
