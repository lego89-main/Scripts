local Games = {
    [93820219970672] = "https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Talyer.lua"
}

if Games[game.PlaceId] then
    loadstring(game:HttpGet(Games[game.PlaceId]))()
end
