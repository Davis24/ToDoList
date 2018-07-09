characterTable = {}
reoccuringTaskTable = {}
taskTable = {}

--Meta Class
task = {description = '', character = '', complete = false}

function task:new(o,des,char)
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
function task:printDescription()
   print("Description ",self.description)
end

function task:returnDescription()
    return self.description
end

function task:changeDescription(str)
    self.description = str
end

-----------------------------
--  Character Functions
-----------------------------
function task:printCharacter()
    print("Character ", self.character)
end

function task:returnCharacter()
    return self.character
end

function task:changeCharacter(str)
    self.character = str
end

-----------------------------
--  Complete Functions
-----------------------------
function task:returnComplete()
    return self.complete
end

function task:setComplete(str)
    self.complete = str
end

function task:printComplete()
    print("Complete:", self.complete)
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
reoccuringTask = task:new()

-----------------------------
--  Time Functions
-----------------------------
function reoccuringTask:new(o,des,char,time)
    o = o or task:new(o,des,char)
    setmetatable(o, self)
    self.__index = self
    self.time = time
    return o
end

function reoccuringTask:printTime()
    print("Time: ", self.time)
end

function reoccuringTask:returnTime()
    return self.time
end

function reoccuringTask:setTime(str)
    self.time = str
end

myItem = reoccuringTask:new(nil, "Testing", "Devy","12")

-- Insert(<table_name>, object)

table.insert(reoccuringTable, myItem)

--print("My List Item Name: ",reoccuringTable[1]:printDescription)

--Function that decides which object gets created
function createTask(des,char,time)
    des = des or "shouldn't occur" -- returns first value unless its nil or false
    char = char or 0
    time = time or 0

    --Insert new task into the correct table
    if(time == 0) then
        newTask = task:new(des,char)
        table.insert(taskTable, newTask)
    else
        newTask = reoccuringTask:new(des,char,time)
        table.insert(reoccuringTaskTable, newTask)
    end
end

function deleteTask(location, table)
    if(table == "reoccuring") then
        table.remove(location)
    else
        table.remove(location)
    end
end

function updateTask(location,table,des,char,time)
    des = des or "shouldn't occur" -- returns first value unless its nil or false
    char = char or 0
    time = time or 0

    if(table == "reoccuring") then
        --reoccuringTable[location]
    else
        --table.remove(location)
    end
end


--- OnLoad add character to table
--- characterTable[<element position>] = "element data"

--https://www.lua.org/cgi-bin/demo