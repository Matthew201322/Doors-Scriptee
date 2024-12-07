local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "G-Hub V0.11 (BETA)",
   Icon = 8676495068, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Grassful's Hub",
   LoadingSubtitle = "still some bugs!!",
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = true, -- Create a custom folder for your hub/game
      FileName = "G-Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/fyMfKh8d49", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System!",
      Subtitle = "since when key system",
      Note = "in Alpha 1.05, i think it will be free", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Grassful530", "CatEnd552"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Grassful's Stuff", 16860455591) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Mischievous Shakelight",
   Callback = function()
_G.Model = "https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Mischievous%20Shakelight.rbxm?raw=true"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Shakelight.luau", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Guiding Shakelight",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Shakelight.luau", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Grassful's Shakelight",
   Callback = function()
   _G.Model = "https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Grassful%20Shakelight.rbxm?raw=true"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Shakelight.luau", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Grassful's Flashlight",
   Callback = function()
_G.Model = "https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Grassful%20Flashlight.rbxm?raw=true"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Shakelight.luau", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Curious Shakelight",
   Callback = function()
_G.Model = "https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Curious%20Shakelight.rbxm?raw=true"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Shakelight.luau", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Wooden Shakelight",
   Callback = function()
_G.Model = "https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Wooden%20Shakelight.rbxm?raw=true"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matthew201322/Doors-Scriptee/refs/heads/main/Shakelight.luau", true))()
   end,
})

Rayfield:LoadConfiguration()
