local Curious = 'https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Curious%20Shakelight.rbxm?raw=true'
local Grassful_Flashlight = 'https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Grassful%20Flashlight.rbxm?raw=true'
local Grassful_Shakelight = 'https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Grassful%20Shakelight.rbxm?raw=true'
local Guiding = 'https://github.com/Matthew201322/Doors-Scriptee/blob/main/Guiding%20Shakelight.rbxm?raw=true'
local Mischievous = 'https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Mischievous%20Shakelight.rbxm?raw=true'
local Wooden = 'https://github.com/Matthew201322/Doors-Scriptee/blob/Shakelights/Wooden%20Shakelight.rbxm?raw=true'

-- the source muehahahahaha

local Sourcesdotlua = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local themodels = _G.Model or 'https://github.com/Matthew201322/Doors-Scriptee/blob/main/Guiding%20Shakelight.rbxm?raw=true'



-- LOCALS

local Tool = LoadCustomInstance(themodels)
Tool.Parent = game.Players.LocalPlayer.Backpack

-- SETTINGS

local GUMMY_DECREASE_SPEED = 10000 -- How fast it will decrease light.
local GUMMY_INCREASE_RATE = 97812346923167843127896312479681324769834196873427368491132476894312897861423768912397683124976813459765138475619384756914756193475613987561397864576935496784357691359784613974856971345691834756179458956189437561975698376529564329756239784542978562398745629387456273592837456928734562983456923745692437652796843578964532796845329678452378964532967842359678452367895432967843529678453296785428967542367894523967456978549678254396785423678945396784325968745367894235769845678954678945236798452367894532789623456789345267892453 -- How much it will increase on shake.
local GUMMY_SHAKE_COOLDOWN = 0 -- How fast you can shake your gummy flashlight

-- CODE

local u2 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

local Player = game.Players.LocalPlayer
local Humanoid = Player.Character:WaitForChild("Humanoid")

local Equipped = false

local AnimationsFolder = Tool.Animations

AnimationsFolder.idle.AnimationId = "rbxassetid://11372556429"
AnimationsFolder.shake.AnimationId = "rbxassetid://12001275923"

Tool.Handle["sound_shake"].SoundId = "rbxassetid://11374330092"

local Hold = Humanoid:LoadAnimation(AnimationsFolder.idle)
local Shake = Humanoid:LoadAnimation(AnimationsFolder.shake)

local canShake = true

local TweenService = game:GetService("TweenService")

local BrightnessTweenCubic = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Cubic,
	Enum.EasingDirection.Out,
	0,
	false
)
local BrightnessTweenLinear = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.In,
	0,
	false
)

function decrease(num)
	local neonAttachment = Tool.Handle.Neon.Attachment
	local SurfaceLight = neonAttachment.SurfaceLight
	local PointLight = neonAttachment.Parent.PointLight
	if SurfaceLight.Brightness < 0.01 then 
		return 
	end
	TweenService:Create(SurfaceLight, BrightnessTweenLinear, {Brightness = SurfaceLight.Brightness - num}):Play()
	TweenService:Create(PointLight, BrightnessTweenLinear, {Brightness = PointLight.Brightness - num}):Play()
	--SurfaceLight.Brightness -= num
	if SurfaceLight.Brightness < 2 then
		neonAttachment.Shiny.Enabled = false
	else
		neonAttachment.Shiny.Enabled = true
	end
end

function increase(num)
	local neonAttachment = Tool.Handle.Neon.Attachment
	local SurfaceLight = neonAttachment.SurfaceLight
	local PointLight = neonAttachment.Parent.PointLight
	if SurfaceLight.Brightness > 35 then 
		return 
	end
	local yes = num + SurfaceLight.Brightness 
	if yes > 35 then num = 1 end
	TweenService:Create(SurfaceLight, BrightnessTweenCubic, {Brightness = SurfaceLight.Brightness + num}):Play()
	TweenService:Create(PointLight, BrightnessTweenLinear, {Brightness = PointLight.Brightness + num}):Play()
	--SurfaceLight.Brightness += num
	if SurfaceLight.Brightness < 2 then
		neonAttachment.Shiny.Enabled = false
	else
		neonAttachment.Shiny.Enabled = true
	end
end

Tool.Equipped:Connect(function()
	Equipped = true
	Hold:Play()
	if not Player:WaitForChild("IsAdmin").Value then
		game.ReplicatedStorage.Bricks.Peep2:Fire(Player)
	end
	while Equipped do
		wait(GUMMY_DECREASE_SPEED)
		decrease(1)
	end
end)

Tool.Unequipped:Connect(function()
	Equipped = false
	Hold:Stop()
end)

Tool.Activated:Connect(function()
	if not canShake then
		return
	end
	canShake = false
	increase(GUMMY_INCREASE_RATE)
	Shake:Play()
	Tool.Handle.sound_shake:Play()
	u2.camShaker:ShakeOnce(1, 15, 0, 1)
	wait(GUMMY_SHAKE_COOLDOWN)
	canShake = true
end)
