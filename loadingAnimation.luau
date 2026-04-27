local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local loadingScreen = playerGui:WaitForChild("loadingScreenMenu")

local logo = script.Parent.Parent.spinLogo
local tweenService = game:GetService("TweenService")
local logospinner = TweenInfo.new(10, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, -1, false)
local spin = tweenService:Create(logo, logospinner, {Rotation = 360})

player.CameraMaxZoomDistance = 8

local textLabel = script.Parent
local word = "Loading"
local markCount = 0
local maxMarks = 3
task.spawn(function()
	while true do
		textLabel.Text = word .. string.rep(".", markCount)
		markCount += 1
		if markCount > maxMarks then
			markCount = 0
		end
		wait(0.5)
	end
end)

local skipButton = script.Parent.Parent.skipButton
skipButton.TextTransparency = 1

local fadeIn = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local skipFadeIn = tweenService:Create(skipButton, fadeIn, {TextTransparency = 0})

task.spawn(function()
	wait(5)
	skipFadeIn:Play()
	skipButton.MouseButton1Click:Connect(function()
		loadingScreen.Enabled = false
		script.Parent.Parent.Parent:Destroy()
	end)
end)


spin:Play()
wait(20)
loadingScreen.Enabled = false
script.Parent.Parent.Parent:Destroy()


