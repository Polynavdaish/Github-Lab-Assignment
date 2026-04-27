local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local playerScripts = player:WaitForChild("PlayerScripts")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local menuTemplate = ReplicatedStorage:WaitForChild("mainMenu")
local menuClone = menuTemplate:Clone()

local loadingTemplate = ReplicatedStorage:WaitForChild("loadingScreenMenu")
local loadingClone = loadingTemplate:Clone()

local ObjectiveClone = ReplicatedStorage:WaitForChild("Objective"):Clone()

local musicPlayer = playerScripts:WaitForChild("musicPlayer")
local startMusic =  musicPlayer:WaitForChild("startMusic")
local gettingChilly =  musicPlayer:WaitForChild("gettingChilly")
local iceCream =  musicPlayer:WaitForChild("IceCream")
local DreamcoreAmbient =  musicPlayer:WaitForChild("DreamcoreAmbient")
local DreamcoreWinter =  musicPlayer:WaitForChild("DreamcoreWinter")
startMusic.Looped = true
startMusic:Play()

loadingClone.Parent = playerGui
loadingClone.Destroying:Wait()
menuClone.Parent = playerGui
menuClone.Destroying:Wait()
ObjectiveClone.Parent = playerGui

local Lighting = game:GetService("Lighting")
local bloom = Lighting:WaitForChild("Bloom")
local blur = Lighting:WaitForChild("Blur")
local depthOfField = Lighting:WaitForChild("DepthOfField")
local sunRays = Lighting:WaitForChild("SunRays")
local atmosphere = Lighting:WaitForChild("Atmosphere")
local sky = Lighting:WaitForChild("Sky")
local ColorCorrection = Lighting:WaitForChild("ColorCorrection")

local count = 0
local folder = workspace:WaitForChild("polyishFolder")

for _, obj in pairs(folder:GetChildren()) do
	if obj:IsA("Model") then
		local hitbox = obj:WaitForChild("HitBox")
		local detector = hitbox:WaitForChild("ClickDetector")
		detector.MouseClick:Connect(function(player)
			count += 1
			ObjectiveClone.countPolyish.Text = count .. "/5 Intruders Neutralized"
			obj:Destroy() 
			if count == 1 then
				startMusic:Stop()
				gettingChilly.Looped = true
				gettingChilly:Play()
				Lighting.Brightness = 0
				Lighting.ClockTime = 0
				atmosphere.Density = 0.5
				atmosphere.Haze = 2.24
				atmosphere.Glare = 3.27
			end
			if count == 2 then
				gettingChilly:Stop()
				DreamcoreAmbient.Looped = true
				DreamcoreAmbient:Play()
				atmosphere.Color = Color3.fromRGB(255, 34, 56)
				atmosphere.Density = 0.626
				atmosphere.Haze = 2.24
				atmosphere.Glare = 3.27
			end
			if count == 3 then
				DreamcoreAmbient:Stop()
				DreamcoreWinter.Looped = true
				DreamcoreWinter:Play()
				ColorCorrection.Contrast = 1
			end
			if count == 4 then
				DreamcoreWinter:Stop()
				iceCream.Looped = true
				iceCream:Play()
				ColorCorrection.Saturation = -1
				blur.Size = 17
			end
			if count == 5 then
				ObjectiveClone.countPolyish.Text = "All Intruders Neutralized"
				task.wait(2)
				ObjectiveClone:Destroy()
				player:Kick("You went home after a long shift.")
			end
		end)
		
	end
end



--local polyish = ReplicatedStorage:WaitForChild("polyish")
--local rng = Random.new()

--function generateEnemy()
--	for i = 1, 10 do
--		local polyishClone = polyish:Clone()
--		polyishClone.Parent = workspace.polyishFolder

--		local x = rng:NextInteger(-320, 320)
--		local z = rng:NextInteger(-320, 320)
--		local rotation = rng:NextInteger(0, 360)
--		polyishClone:PivotTo(CFrame.new(x, 8.864, z)*CFrame.Angles(0, math.rad(rotation), math.rad(0)))
--	end
--end

--generateEnemy()








