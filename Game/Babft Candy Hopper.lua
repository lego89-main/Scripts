local HttpService = game: GetService("HttpService")
local TeleportService = game: GetService("TeleportService")

local plr = game.Players.LocalPlayer

while true do
	task.wait()
	local Character = plr.Character
	local HRP = Character and Character:FindFirstChild("HumanoidRootPart")
	if HRP then
		local Houses = workspace:FindFirstChild("Houses")
		if Houses then
			for _, House in ipairs(Houses:GetChildren()) do
				local Door = House:FindFirstChild("Door")
				local TouchPart = Door and Door:FindFirstChild("DoorInnerTouch")
				local TouchInterest = TouchPart and TouchPart:FindFirstChild("TouchInterest")

				if TouchPart and TouchInterest and TouchInterest:IsA("TouchTransmitter") then
					HRP.CFrame = TouchPart.CFrame
					firetouchinterest(HRP, TouchPart, 0)
					task.wait()
					firetouchinterest(HRP, TouchPart, 1)
					task.wait(1)
				end
			end
		end
	end
	local Houses = workspace:FindFirstChild("Houses")
	if #Houses:GetChildren() == 0 then
		queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Babft%20Candy%20Hopper.lua"))()')
		local Servers = {}
	    local Req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
	    local Body = HttpService:JSONDecode(Req)
	    
	    if Body and Body.data then
	        for _, Value in next, Body.data do
	        	if type(Value) == "table" and tonumber(Value.playing) and tonumber(Value.maxPlayers) and Value.playing < Value.maxPlayers then
	        		Servers[#Servers + 1] = Value.id
	        	end
	        end
	    end
	    if #Servers > 0 then
	        TeleportService:TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1, #Servers)], plr)
	    end
		break
	end
end
