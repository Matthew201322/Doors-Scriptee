---====== Load module ======---

local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Crucifix%20Source.lua"))()

---====== Create crucifix ======---

module.GiveCrucifix({
    Type = 1,
    Uses = nil, -- nil : infinite uses
    Resist = false,
    EntitiesOnly = true, -- true : custom entities only
    IgnoreList = {}
})

--[[

CRUCIFIX TYPES:
-> 1: Guiding Light


COMING SOON:
-> Curious Light crucifix type

]]--
