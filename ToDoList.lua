
characterTable = {}

--Meta Class
listItem = {description = '', character = '', complete = false}

function listItem:new(o,des,char)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   self.description = des
   self.character = character
   return o
end


-------------------------
--  Description Functions
-------------------------

function listItem:printDescription()
   print("Description ",self.description)
end

function listItem:returnDescription()
    return self.description
end

function listItem:changeDescription(str)
    self.description = str
end

-----------------------------
--  Character Functions
-----------------------------
function listItem:printCharacter()
    print("Character ",self.character)
end

function listItem:returnCharacter()
    return self.character
end

function listItem:changeCharacter(str)
    self.character = str
end

--[[
function listFindCharacter()
    local items = { "apple", "orange", "pear", "banana" }

    for _,v in pairs(items) do
    if v == "orange" then
        -- do something
        break
    end
    end
end
--]]

--Derived Class method new
reoccuringListItem = listItem:new()

function reoccuringListItem:new(o,des,char,time)
    o = o or listItem:new(o,des,char)
    setmetatable(o, self)
    self.__index = self
    self.time = time
    return o
end

function reoccuringListItem:printTime()
    print("Time: ", self.time)
end

myItem = reoccuringListItem:new(nil, "Testing", "Devy","12")

--- OnLoad add character to table
--- characterTable[<element position>] = "element data"

--https://www.lua.org/cgi-bin/demo