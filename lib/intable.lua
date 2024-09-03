-- Function to check if a table contains a value
local valueInTable = function (table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

return valueInTable
