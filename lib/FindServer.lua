local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local TargetName = _G.Name
local Found = false
local JoinedServer = _G.JoinedServer

for Index, Value in pairs(Players:GetPlayers()) do
	if Value.Name == TargetName then
		Found = true
	end
end
if not Found then
    JoinedServer[#JoinedServer+1] = game.JobId
    
    local Servers = {}
    local Req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
    local Body = HttpService:JSONDecode(Req)
    
    if Body and Body.data then
        for _, Value in next, Body.data do
        	if type(Value) == "table" and tonumber(Value.playing) and tonumber(Value.maxPlayers) and Value.playing < Value.maxPlayers and not table.find(JoinedServer, Value.id) then
        		Servers[#Servers + 1] = Value.id
        	end
        end
    end
    if #Servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1, #Servers)], Players.LocalPlayer)
    end
end

local SourceCode = [==[
local HttpService = game:GetService("HttpService")
_G.Name = "]==]..TargetName..[==["\n
_G.JoinedServer = HttpService:JSONDecode([[]==]..HttpService:JSONEncode(JoinedServer)..[==[]])
loadstring(game:HttpGet("https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/lib/FindServer.lua"))()
]==]
queue_on_teleport(SourceCode)
