-- Services --
local Lighting = game:GetService("Lighting")

-- Basic Values --
local WaitTime = (5)-- Real Time in seconds before the set amount of In-game minutes pass
local DebugWaitTime = (0.05)
local Minutes = (1) -- Set this to how many minutes you want the game lighting to progress by
local Debug = false

local Ambient = Color3.fromRGB(0,0,0)
local Brightness = 1
local ColorShift_Bottom = Color3.fromRGB(0,0,0)
local ColorShit_Top = Color3.fromRGB(0,0,0)
local OutdoorAmbient = Color3.fromRGB(127,127,127)
local Outlines = false

-- Automatic Lighting --
while true do
	local MinutesAfterMidnight = game.Lighting:GetMinutesAfterMidnight()
	local OAAN = 127 - (127/192)*(16*(math.floor(MinutesAfterMidnight / 60)-12))
	local OAMN = 127 + (127/192)*(16*(math.floor(MinutesAfterMidnight / 60)-12))
  Lighting.Outlines = Outlines
  Lighting.Ambient = Ambient
  Lighting.ColorShift_Bottom = ColorShift_Bottom
  Lighting.ColorShift_Top = ColorShift_Top
	if math.floor(MinutesAfterMidnight / 60) > 12 then
		Lighting.Brightness = Brightness - ((Brightness/12) * (math.floor(MinutesAfterMidnight / 60)-12))		
		Lighting.OutdoorAmbient = Color3.fromRGB(OAAN,OAAN,OAAN)
		-- afternoon
	else
		Lighting.Brightness = Brightness + ((Brightness/12) * (math.floor(MinutesAfterMidnight / 60)-12))
		Lighting.OutdoorAmbient = Color3.fromRGB(OAMN,OAMN,OAMN)
		-- morning
	end
	Lighting:SetMinutesAfterMidnight(math.floor(MinutesAfterMidnight + Minutes))
	
	if Debug == true then
		wait(DebugWaitTime)
	else
		wait(WaitTime)
	end
end
