local Games = {
    [93820219970672] = "https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Talyer.lua",
    [119269765124983] = "https://raw.githubusercontent.com/lego89-main/Scripts/refs/heads/main/Game/Run%20A%20Police%20Station.lua"
}

if Games[game.PlaceId] then
    loadstring(game:HttpGet(Games[game.PlaceId]))()
end
