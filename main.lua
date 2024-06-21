-- Initial setup
local wordList = require "words"
local randWord = wordList[math.random(1, #wordList)]
local word = {}
for i = 1, #randWord do
    word[i] = string.sub(randWord, i, i)
end
local art = require "art"

-- Function to check if a table contains a value
local valueInTable = function (table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Game loop
local playing = true
while playing do
    print "Introduce your guess."
    local input = io.read()
    if input and string.len(input) == 1 then
        if valueInTable(word, input) then
            print (input .. " is included!")
        else
            print (input .. " is not included.")
        end
    else
        print ("There was an error with the input. Try again.")
    end
end
