local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local menu = player.PlayerGui:WaitForChild("mainMenu")
local TweenService = game:GetService("TweenService")

local outFrame = script.Parent.outFrame
local TopFrame = outFrame:waitForChild("TopFrame")
local BottomFrame = outFrame:waitForChild("BottomFrame")


local topAnimate = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local bottomAnimate = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local topMove = TweenService:Create(TopFrame, topAnimate, {Size = UDim2.new(1, 0, 1, 0)})
local topMoveBack = TweenService:Create(TopFrame, topAnimate, {Size = UDim2.new(1, 0, 0.073, 0)})

local bottomMove = TweenService:Create(BottomFrame, bottomAnimate, {Size = UDim2.new(1, 0, 1, 0),Position = UDim2.new(0, 0,0, 0)})
local bottomMoveBack = TweenService:Create(BottomFrame, bottomAnimate, {Size = UDim2.new(1, 0, 0.072, 0),Position = UDim2.new(0, 0,0.929, 0)})



local MenuCam1 = game.Workspace.MenuCam:WaitForChild("MenuCam1")
local MenuCam2 = game.Workspace.MenuCam:WaitForChild("MenuCam2")
local camList = {MenuCam1, MenuCam2}
camera.CameraType = Enum.CameraType.Scriptable
local i = 1
task.spawn(function()
	while menu.enabled == true do
		topMove:Play()
		bottomMove:Play()
		wait(1)
		camera.CFrame = camList[i].CFrame
		i += 1
		if i > #camList then
			i = 1
		end
		topMoveBack:Play()
		bottomMoveBack:Play()
		wait(5)
	end
end)

local MenuFrame = script.Parent.MenuFrame

local fadeIn = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local slideIn = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local fadeOut = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local slideOut = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

for j, obj in pairs(MenuFrame:GetDescendants()) do
	if obj:IsA("TextButton") then
		obj.TextTransparency = 1
		TweenService:Create(obj, fadeIn, {TextTransparency = 0}):Play()
	end
	if obj:IsA("ImageLabel") and obj.Name ~= "1Locked" then
		obj.ImageTransparency = 1
		TweenService:Create(obj, fadeIn, {ImageTransparency = 0}):Play()
	end
	if obj.Name == "buttonWTitle" then
		obj.Position = UDim2.new(-0.65, 0, 0.05, 0)
		TweenService:Create(obj, slideIn, {Position = UDim2.new(0.04, 0, 0.05, 0)}):Play()
	end
end
local transitionBlack = menu:WaitForChild("transitionCover")
transitionBlack.BackgroundTransparency = 0
TweenService:Create(transitionBlack, fadeIn, {BackgroundTransparency = 1}):Play()

local button = menu.MenuFrame.buttonWTitle.ButtonFrame.clickables["1NewGameButton"]

button.MouseButton1Click:Connect(function()
	for j, obj in pairs(MenuFrame:GetDescendants()) do
		if obj:IsA("TextButton") then
			TweenService:Create(obj, fadeOut, {TextTransparency = 1}):Play()
		end
		if obj:IsA("ImageLabel") and obj.Name ~= "1Locked" then
			TweenService:Create(obj, fadeOut, {ImageTransparency = 1}):Play()
		end
		if obj.Name == "buttonWTitle" then
			TweenService:Create(obj, slideOut, {Position = UDim2.new(-0.65, 0, 0.05, 0)}):Play()
		end
	end
	TweenService:Create(transitionBlack, fadeOut, {BackgroundTransparency = 0}):Play()
	wait(2)
	camera.CameraType = Enum.CameraType.Custom
	player.CameraMaxZoomDistance = 0.5
	wait(0.1)
	menu:Destroy()
end)