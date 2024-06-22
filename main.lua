-- Start title
local printTitle = function ()
    print [[
$$\
$$ |
$$$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\  $$$$$$\$$$$\   $$$$$$\  $$$$$$$\
$$  __$$\  \____$$\ $$  __$$\ $$  __$$\ $$  _$$  _$$\  \____$$\ $$  __$$\
$$ |  $$ | $$$$$$$ |$$ |  $$ |$$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$ |  $$ |
$$ |  $$ |$$  __$$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |  $$ |
$$ |  $$ |\$$$$$$$ |$$ |  $$ |\$$$$$$$ |$$ | $$ | $$ |\$$$$$$$ |$$ |  $$ |
\__|  \__| \_______|\__|  \__| \____$$ |\__| \__| \__| \_______|\__|  \__|
                            $$\   $$ |
                            \$$$$$$  |
                             \______/
By Ivan :3

===============================

    ]]
end

-- Function to check if a table contains a value
local valueInTable = function (table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Initial setup
local art = require "art"
local wordList = require "words"
local randWord = wordList[math.random(1, #wordList)]
local word = {}
for i = 1, #randWord do word[i] = string.sub(randWord, i, i) end
local errors = 0
local guesses = {}
local actionText = "Introduce your guess."
local playing = true
printTitle()

-- Function to print information
local printInformation = function ()
    os.execute("cls")

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

    print(art[errors + 1])
    print (displayText .. "\n")
    print ("Errors: " .. errors)
    print ("Letters said: " .. saidLetters)
    print ("\n>> " .. actionText .. "\n")
end

local checkEnd = function ()
    if (errors >= 7) then
        playing = false
        actionText = "You lost!"
        return true
    end
end

-- GAME LOOP --
while playing do
    if checkEnd() then
        printInformation()
        break
    end

    printInformation()

    -- Check input
    local input = string.lower(io.read())
    print (">> " .. input)

    print "\n===============================\n"

    if input and string.len(input) == 1 then
        if not valueInTable(guesses, input) then

            table.insert(guesses, input)
            if valueInTable(word, input) then
                actionText = "\""..input.."\" is included!"
            else
                errors = errors + 1
                actionText = "\""..input.."\" is not included"
            end

        else
            print (">> You already said that letter!")
        end
    else
        print (">> There was an error with the input. Try again.\n")
    end
end
