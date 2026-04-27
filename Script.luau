--Script for each entity
local model = script.Parent
local part = model.HitBox
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://100910605869272"
sound.Parent = part
sound.Volume = 70
sound.RollOffMode = Enum.RollOffMode.Inverse  
sound.RollOffMaxDistance = 30 

while true do
	sound:Play()
	wait(5)
end

