--[=[
local Global = (getgenv and getgenv()) or shared
loca rad=math.rad

Global.Preload=false -- Enable this if you wanna download all assets all at once (Warning, Enable this if your device handles it because it generates huge amounts of fps frop) You have been warned (set to false as default)
Global.DisableCustomInventory=false -- Disabled by default to use custom inventory styling 
Global.ReanimateVer="Gelatek"
-- Gelatek Reanmate - Put "Gelatek"
-- Currentangle V4 - Put "Current"
-- Empyrean Reanimate - Put "Emper"



Global.Rigs={
  -- Pattern
  --// { MeshId = MeshId, Name = Body Part( "Left Arm","Left Leg","Right Leg","Right Arm","Torso","Head"), Offset = CFrame.Angles(X,Y,Z) or CFrame.new(PosX,PosY,PosZ)*CFrame.Angles(X,Y,Z) or CFrame.new(PosX,PosY,PosZ) or CFrame.identity, TextureId = TextureId }
  --// For TextureId and MeshId, it should be "MESHIDGOESHERE" and "TEXTUREIDGOESHERE"
  --// Example
  --[[
{ MeshId = "84515304632473", Name = "Torso", Offset = CFrame.identity, TextureId = "84039546952302" },--95290698984301
{ MeshId = "18919712035", Name = "Torso", Offset = CFrame.identity, TextureId = "18430134193" },--95290698984301
{ MeshId = "89457171427274", Name = "Head", Offset = CFrame.new(0,1.5,0), TextureId = "130665230882117" },--95290698984301


{ MeshId = "130309145260656", Name = "Left Leg", Offset = CFrame.Angles(rad(-105),rad(-18),rad(-15)), TextureId = "93374633946646" },--95290698984301
{ MeshId = "100128920324073", Name = "Right Arm", Offset = CFrame.Angles(rad(-105),rad(18),rad(15)), TextureId = "97155254696037" },--95290698984301
{ MeshId = "100128920324073", Name = "Right Leg", Offset = CFrame.Angles(rad(-105),rad(18),rad(15)), TextureId = "133680105074740" },--95290698984301
{ MeshId = "130309145260656", Name = "Left Arm", Offset = CFrame.Angles(rad(-105),rad(-18),rad(-15)), TextureId = "82390202293774" },--95290698984301
   ]]
--// Put Your Risg Here!


}

-- // \\ --
]=]
local Occasions="Normal"
local Global = (getgenv and getgenv()) or shared
local Preload=Global.Preload or false
local ExtraRigSupport=Global.Rigs or {}
local DisableCustomInventory=Global.DisableCustomInventory or false
local player = game.Players.LocalPlayer
--local ReanimateType=Global.ReanimateType or "Limbs"
local backpack = player:WaitForChild("Backpack")
local ReanimateVer=Global.ReanimateVer or "Gelatek"
-- Emper 
-- Current 
-- Gelatek
if ReanimateVer=="Emper" then 
DisableCustomInventory=true
end
--// Place it here for easy access...
local TableOfDances={
{Name="Rat 1",Music="rat.mp3",DanceName="Rat1",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Rat1.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Boogie Down",Music="FunkedUp.mp3",DanceName="None",Url="None",Id=122471664395501,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Assumptions",Music="Assumptions.mp3",DanceName="Assumptions",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Assumptions.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Egypt",Music="Egypt.mp3",DanceName="Egypt",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Egypt.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Flop",Music="DO THE FLOP.mp3",DanceName="Flop",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Flop.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="CaramellDansen",Music="caramell.mp3",DanceName="Nonw",Url="None",Id=114964447248296,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Heel Toe Hop",Music="Heel.mp3",DanceName="Heel",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/HeelToeHop.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Gangnam",Music="gangnamm.mp3",DanceName="None",Url="None",Id=133530633475679,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Bomb Monkey",Music="Monkey.mp3",DanceName="BombMonkey",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Bomb Monkey.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Starlit",Music="dancingin.mp3",DanceName="None",Url="None",Id=136139381223407,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Swag Walk",Music="dr.wav",DanceName="None",Url="None",Id=110403709064010,Offset=0,WalkSpeed=4,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Griddy",Music="griddy.mp3",DanceName="None",Url="None",Id=114928062507098,Offset=0,WalkSpeed=4,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Luxurious",Music="lux.ogg",DanceName="None",Url="None",Id=94534967284996,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Kazotsky",Music="kazot.mp3",DanceName="None",Url="None",Id=86634257330162,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Domino",Music="Domino.mp3",DanceName="Domino",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Domino.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Liar Dancer",Music="Liar.mp3",DanceName="Liar",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Liar.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Mesmerizer",Music="Mesmerizer.mp3",DanceName="Mesmerizer",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Mesmerizer.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Box Swing",Music="Box.mp3",DanceName="BoxSwing",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Box Swing.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Static 1",Music="Static.mp3",DanceName="Static",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Static.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Prism Shuffle",Music="Prism.mp3",DanceName="Prism",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Prism Shuffle.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Headlock",Music="Headlock.mp3",DanceName="Headlock",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Headlock.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Hakari",Music="TUCA DONKA.mp3",DanceName="Hakari",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Hakari.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Commercial Break",Music="Break.mp3",DanceName="Commercial",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Commercial.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Soda Pop",Music="Soda.mp3",DanceName="Soda",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Soda Pop.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="XO",Music="XO.mp3",DanceName="None",Url="None",Id=89807443968447,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="L4U",Music="LoveForU.mp3",DanceName="L4U",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Love4U.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Assumptios Shuffle",Music="assum.mp3",DanceName="None",Url="None",Id=129275138998868,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Peashooter",Music="balls.mp3",DanceName="None",Url="None",Id=124616782933406,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Distraction",Music="Distraction.mp3",DanceName="Distraction",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Distraction.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Very Hot",Music="ItBurns.mp3",DanceName="ItBurns",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/It Burns.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Chronoshift",Music="chronoshift.mp3",DanceName="Chronoshift",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Chronoshift.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Keep Up",Music="KeepUp.mp3",DanceName="Keep",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Keep Up.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Boombox",Music="Boombox.mp3",DanceName="None",Url="None",Id=92629504992703,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="BloodPop",Music="bloodpop.mp3",DanceName="None",Url="None",Id=82472212108809,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Sit",Music="Sit.mp3",DanceName="Sit",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Sit.lua",Id="None",Offset=0,WalkSpeed=0,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Left Right",Music="leftright.mp3",DanceName="None",Url="None",Id=107261816578577,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Heavy Love",Music="heavylove.mp3",DanceName="None",Url="None",Id=101332118847458,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Million",Music="Million.mp3",DanceName="None",Url="None",Id=109123683211464,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Billie Jean",Music="Bjean.mp3",DanceName="BillieJean",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/BillieJean.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Billie Jean2",Music="Bjean.mp3",DanceName="BillieJean2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/BillieJean2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Savor W",Music="Savor.mp3",DanceName="Savor",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Savor.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Yamero",Music="Yamero.mp3",DanceName="Yamero",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Yamero.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Angel",Music="InternetAngel.mp3",DanceName="Angel",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Angel.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Club Penguin",Music="CLUB PENGUIN DANCE.mp3",DanceName="ClubPenguin",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Club Penguin.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Runaway",Music="Runaway.mp3",DanceName="Runaway",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Runaway.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="MioHonda",Music="MioHonda.mp3",DanceName="MioHonda",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Miohonda.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Firework",Music="Firework.mp3",DanceName="Firework",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Firework.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="C14",Music="C14.mp3",DanceName="C14",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/C14.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Slickback",Music="Slickback.mp3",DanceName="Slickback",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Slickback.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Doodle",Music="Doodle.mp3",DanceName="Doodle",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Doodle.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Goated Dance",Music="Goat.mp3",DanceName="Goat",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Goat.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Bumblebee",Music="Bumblebee.mp3",DanceName="Bumblebee",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Bumblebee.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Stock Shuffle",Music="Stock.mp3",DanceName="Stock",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Stock Shuffle.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Rat 2",Music="rat.mp3",DanceName="Rat2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Rat2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Shuba Duck",Music="Shuba Duck.mp3",DanceName="Shuba",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Shuba Duck.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Lemon Melon",Music="Lemon.mp3",DanceName="None",Url="None",Id=138510336377177,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Birdbrain",Music="Birdbrain2.mp3",DanceName="Birdbrain",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Birdbrain.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Fein",Music="Fein.mp3",DanceName="Fein",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Fein.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Popipo",Music="Popipo.mp3",DanceName="Popipo",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Popipo.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Pickup",Music="Pickup.mp3",DanceName="Pickup",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Pickup.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Silly Billy 1",Music="Billy.mp3",DanceName="Billy",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Billy.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Sinful",Music="rotten.mp3",DanceName="None",Url="None",Id=89457637802764,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Spooky",Music="Spooky.mp3",DanceName="Spooky",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Spooky.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="JK",Music="JK.mp3",DanceName="Limited",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Limited.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=1},
{Name="KJ",Music="Flexworks.mp3",DanceName="Flexworks",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Flexworks.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=1},
{Name="CrissCross",Music="CrissCross.mp3",DanceName="None",Url="None",Id=109275255555630,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Too Much Brain",Music="brain.mp3",DanceName="None",Url="None",Id=93547721311170,Offset=0,WalkSpeed=4,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Espresso",Music="espresso.mp3",DanceName="None",Url="None",Id=87342159331194,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Rakuten",Music="rakuten.mp3",DanceName="None",Url="None",Id=121967347012647,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Torture",Music="tort.mp3",DanceName="None",Url="None",Id=99811468921857,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Unlockit",Music="Unlockit.mp3",DanceName="Unlockit",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Unlockit.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Smooth Moves",Music="SmoothMoves.mp3",DanceName="SmoothMoves",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/SmoothMoves.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Lagtrain",Music="Lagtrain.mp3",DanceName="Lagtrain",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Lagtrain.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Suki",Music="Suki.mp3",DanceName="Suki",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Suki.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Cafeteria",Music="Cafeteria.mp3",DanceName="Cafeteria",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Cafeteria.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Dare",Music="Dare.mp3",DanceName="Dare",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Dare.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Tenna 1",Music="Tenna.mp3",DanceName="Tenna",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tenna.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Insanity",Music="Insanity.mp3",DanceName="Insanity",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Insanity.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Tenna 2",Music="Tenna.mp3",DanceName="Tenna2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Tenna 2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Rambunctious",Music="Rambunctious.mp3",DanceName="Rambunctious",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Rambunctious.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Side Shuffle",Music="Side Shuffle.mp3",DanceName="Sideshuffle",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Side Shuffle.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Electro Swing",Music="Electro Swing.mp3",DanceName="Electro",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Electro Swing.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="MioHonda Step",Music="MioHonda.mp3",DanceName="Step",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Step.lua",Id="None",Offset=0,WalkSpeed=4,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Apple Pen",Music="Apple Pen.mp3",DanceName="Applepen",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Apple Pen.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Crank That",Music="Crank.mp3",DanceName="Crankthat",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Crank That.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Take Down",Music="TakeDown.mp3",DanceName="TakeDown",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Takedown.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Going Down",Music="Down.mp3",DanceName="Down",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Going Down.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Spamton",Music="Spamton.mp3",DanceName="Spamton",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Spamton.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Kemusan",Music="Kemusan.mp3",DanceName="Kemusan",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Kemusan.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Im Ok",Music="ImOk.mp3",DanceName="ImOk",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/ImOk.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Medicine Teto (Igaku)",Music="Igaku2.mp3",DanceName="Igaku",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Igaku.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Headlock 2",Music="Headlock.mp3",DanceName="Headlock3",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Headlock3.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Guli",Music="Guli.mp3",DanceName="Guli",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Guli.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Results",Music="Results.mp3",DanceName="Results",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Results.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Static 2",Music="Static.mp3",DanceName="Static2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Static2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Silly Billy 2",Music="Billy.mp3",DanceName="Billy2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Billy2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Yell 2",Music="Yell.mp3",DanceName="Yell",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Yell.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Yell 3",Music="Yell1.mp3",DanceName="Yell1",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Yell1.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Yell 1",Music="Yell2.mp3",DanceName="Yell2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Yell2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Out of Touch",Music="Touch.mp3",DanceName="Touch",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Touch.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Hakari (Lonely)",Music="Lonely.mp3",DanceName="Hakari",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Hakari.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Rat 3",Music="rat.mp3",DanceName="None",Url="None",Id=117971041844492,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Uh",Music="whateverlike.mp3",DanceName="None",Url="None",Id=99152023738830,Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="CyberBop",Music="CyberBop.mp3",DanceName="CyberBop",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/CyberBop.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Invincible",Music="Invincible.mp3",DanceName="Invincible",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Invincible.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Jumpstyle",Music="Jumpstyle.mp3",DanceName="Jumpstyle3",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Jumsptyle3.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="BreakDance",Music="BreakDance.mp3",DanceName="BreakDance",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/BreakDance.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="BreakDance 2005",Music="BreakDance2005.mp3",DanceName="BreakDance2005",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/BreakDance2005.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Requiem",Music="faster.ogg",DanceName="Requiem",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Requiem.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Metro Man",Music="Metro.mp3",DanceName="Metro",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Metro.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="CrackDown",Music="CrackDown.mp3",DanceName="CrackDown",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/CrackDown.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Wait",Music="Wait2.mp3",DanceName="Wait",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Wait.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Smug Dance",Music="Smug.mp3",DanceName="Smug",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Smug.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Takino",Music="Takino.mp3",DanceName="Takino",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Takino.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Jumpstyle 1",Music="Jumpstyle.mp3",DanceName="Jumpstyle4",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Jumpstyle4.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Livesey Walk",Music="Livesey.mp3",DanceName="Livesey",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Livesey.lua",Id="None",Offset=0,WalkSpeed=4,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Mesmerizer 1",Music="Mesmerizer.mp3",DanceName="Mesmerizer1",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Mesmerizer1.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Pokedance",Music="Pokedance.mp3",DanceName="Pokedance",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Pokedance.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Keep Up 1",Music="KeepUp.mp3",DanceName="KeepUp1",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Keep Up1.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Get Down",Music="GetDown.mp3",DanceName="GetDown",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Get Down.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Spoken For",Music="SpokenFor.mp3",DanceName="SpokenFor",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Spoken For.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Everybody Gangnam",Music="EVG.mp3",DanceName="EverybodyGangnam",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/EverybodyGangnam.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Low Cortisol",Music="cortisol.mp3",DanceName="cortisol",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/cortisol.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Domino 2",Music="Domino.mp3",DanceName="Domino2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Domino2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Looping The Rooms",Music="Looping.mp3",DanceName="Looping",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Looping.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Cry For Me",Music="Cry For Me.mp3",DanceName="Cry For Me",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Cry For Me.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="With Friends",Music="Withfriends.mp3",DanceName="With Friends",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/With Friends.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},


{Name="Funny",Music="Funny.mp3",DanceName="Funny",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Funny.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="CivillianYell",Music="CivillianYell.mp3",DanceName="CivillianYell",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/CivillianYell.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Looping The Rooms 2",Music="Looping 2.mp3",DanceName="Looping 2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Looping 2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Hakari 3 (Lonely)",Music="Lonely.mp3",DanceName="Hakari3",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Hakari3.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Hakari 3",Music="TUCA DONKA.mp3",DanceName="Hakari3",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Hakari3.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Skeleton",Music="Sellywarcry.mp3",DanceName="Skeleton",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Skeleton.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Someone Ships",Music="Idk.mp3",DanceName="Idk",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Idk.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Golden Dandelion",Music="TsSoGolden.mp3",DanceName="TsSoGolden",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/TsSoGolden.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Retry Now",Music="RetryNow.mp3",DanceName="Retry Now",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Retry Now.lua",Id="None",Offset=0,WalkSpeed=14,Looped=false,UseSoundPos=true,Alpha=.1},


{Name="Low Cortisol 2",Music="cortisol.mp3",DanceName="cortisol2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/cortisol2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Metro Man 2",Music="Metro.mp3",DanceName="Metroman2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Metroman2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Medicine Teto (Igaku) 2",Music="Igaku2.mp3",DanceName="Igaku2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Igaku2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Hakari 4",Music="TUCA DONKA.mp3",DanceName="Hakari 4",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Hakari 4.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Looping The Rooms 3",Music="Looping.mp3",DanceName="Looping 3",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Looping 3.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Microwave",Music="Microwave.mp3",DanceName="Microwave",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Microwave.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Lil Buddy Was Sick",Music="Lilbuddy.mp3",DanceName="LilBuddy",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/LilBuddy.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Low Quality",Music="LowQuality.mp3",DanceName="LowQuality",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/LowQuality.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},

{Name="Looping The Rooms 4",Music="Looping 2.mp3",DanceName="Looping4",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Looping4.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Funny 2",Music="Funny2.mp3",DanceName="Funny2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Funny2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

{Name="California Girls",Music="California.mp3",DanceName="California Girls",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/California Girls.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

{Name="Doomer",Music="Doomer.mp3",DanceName="Doomer",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Doomer.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

{Name="Chegou 3",Music="Chegou 3.mp3",DanceName="Chegou 3",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Chegou 3.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Hikari",Music="Hikari.mp3",DanceName="Hikari",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Hikari.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

--{Name="KJ 2",Music="Flexworks.mp3",DanceName="KJ 2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/KJ 2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

--{Name="Jun",Music="NMG.mp3",DanceName="Jun",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/JUN.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

{Name="Minos Prime",Music="Prime.mp3",DanceName="Minos Prime",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Minos Prime.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Default Dance",Music="Fortnite.mp3",DanceName="Default Dance",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Default Dance.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},
{Name="Omni Man",Music="omni.mp3",DanceName="omni",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/omni.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=0},
{Name="Unlockit SEWH",Music="Unlockit2.mp3",DanceName="Unlockit2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Unlockit2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Birdbrain Laggy",Music="BirdbrainAlt.mp3",DanceName="Birdbrainv2",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Birdbrainv2.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Doomer Alt",Music="Doomer.mp3",DanceName="DoomerAlt",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/DoomerAlt.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},

{Name="Bouncin",Music="Bouncin.mp3",DanceName="Bouncin",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Bouncin.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
{Name="Static Alt",Music="Static.mp3",DanceName="StaticAlt",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/StaticAlt.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.050},
--{Name="Medicine Teto Alt",Music="Igaku2.mp3",DanceName="IgakuAlt",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/IgakuAlt.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=true,Alpha=.1},

--{Name="Dia Delicia",Music="DiaDelicia.mp3",DanceName="Dia Delicia",Url="https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Dia Delicia.lua",Id="None",Offset=0,WalkSpeed=14,Looped=true,UseSoundPos=false,Alpha=.1},
}
local validAudioFiles = {
"Sphere.mp3",
"Bouncin.mp3",
"rat.mp3",
"FunkedUp.mp3",
"Assumptions.mp3",
"Egypt.mp3",
"DO THE FLOP.mp3",
"caramell.mp3",
"Heel.mp3",
"gangnamm.mp3",
"Monkey.mp3",
"dancingin.mp3",
"dr.wav",
"griddy.mp3",
"lux.ogg",
"kazot.mp3",
"Domino.mp3",
"Liar.mp3",
"Mesmerizer.mp3",
"Box.mp3",
"Static.mp3",
"Prism.mp3",
"Headlock.mp3",
"TUCA DONKA.mp3",
"Break.mp3",
"XO.mp3",
"Soda.mp3",
"LoveForU.mp3",
"assum.mp3",
"balls.mp3",
"Distraction.mp3",
--"ItBurns.mp3",
"chronoshift.mp3",
"KeepUp.mp3",
"Boombox.mp3",
"bloodpop.mp3",
"leftright.mp3",
"heavylove.mp3",
"Million.mp3",
"Bjean.mp3",
"Savor.mp3",
"Yamero.mp3",
"InternetAngel.mp3",
"CLUB PENGUIN DANCE.mp3",
"Runaway.mp3",
"MioHonda.mp3",
"Firework.mp3",
"C14.mp3",
"Slickback.mp3",
"Doodle.mp3",
"Goat.mp3",
"Bumblebee.mp3",
"Stock.mp3",
"Shuba Duck.mp3",
"Lemon.mp3",
"Birdbrain2.mp3",
"Fein.mp3",
"Popipo.mp3",
"Pickup.mp3",
"Billy.mp3",
"rotten.mp3",
"Spooky.mp3",
"JK.mp3",
"Flexworks.mp3",
"Unlockit.mp3",
"Insanity.mp3",
"Cafeteria.mp3",
"Tenna.mp3",
"Suki.mp3",
"CrissCross.mp3",
"Dare.mp3",
"Lagtrain.mp3",
"SmoothMoves.mp3",
"brain.mp3",
"espresso.mp3",
"rakuten.mp3",
"tort.mp3",
"TakeDown.mp3",
"Side Shuffle.mp3",
"Rambunctious.mp3",
"Electro Swing.mp3",
"Crank.mp3",
"Apple Pen.mp3",
"Igaku2.mp3",
"Down.mp3",
"Kemusan.mp3",
"Guli.mp3",
"ImOk.mp3",
"Spamton.mp3",
"Sit.mp3",
"Results.mp3",
"Yell.mp3",
"Yell1.mp3",
"Pixelation.mp3",
"Yell2.mp3",
"Touch.mp3",
"Lonely.mp3",
"whateverlike.mp3",
"matchmaker.mp3",
"faster.ogg",
"Metro.mp3",
"Jumpstyle.mp3",
"Invincible.mp3",
"CrackDown.mp3",
"CyberBop.mp3",
"BrickBattler.mp3",
"BreakDance2005.mp3",
"BreakDance.mp3",
"CrackDown.mp3",
"Halloween.mp3",
"TANOC.mp3",
"Shiawase.mp3",
"Tf2.mp3",
"Smug.mp3",
"Wait2.mp3",
"Livesey.mp3",
"Pokedance.mp3",
"Slash.mp3",
"GetDown.mp3",
"SpokenFor.mp3",
"EVG.mp3",
"cortisol.mp3",
"Cry For Me.mp3",
"Looping.mp3",
"Akage.mp3",
"Funny.mp3",
"Withfriends.mp3",
"CivillianYell.mp3",
"LilBuddy.mp3",
"LowQuality.mp3",
"California.mp3",
"Doomer.mp3",
"Hikari.mp3",
"NMG.mp3",
"Prime.mp3",
"omni.mp3",
"Unlockit2.mp3",
"BirdbrainAlt.mp3",
"Lexapro Doesn't Work.mp3",
--"Lilbuddy.mp3",
}












loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/packages/FunctionPack.lua"))()
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("Theo-Dancezzz-Dancezzz") then
CoreGui["Theo-Dancezzz-Dancezzz"]:Destroy()
end
local function choot(msg)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
end

local function notify(text,dur)
local Notify=game:GetService("StarterGui")
Notify:SetCore("SendNotification",{
Title="R6 Tool Dance";
Text=text;
Duration=5 or dur})
end
if isfolder and not isfolder("Theo-Dancezzz-Musics") then 
makefolder("Theo-Dancezzz-Musics")
notify("New User! automatically opened console!")
choot("/console")
print("New User,Hello!! Welcome to Theo Dancezzz!!\nRemember my kdv3? yes its discontinued becahse i got in trouble modding it, now im here making the best dance script to ever exist, the script eill be further optimised, or adding the hat reaminate!!!\n so this script currently has 130j dances, if your new to this script, if you click any dances, they need to download the audios and thr dance file itself, it doesnt notify you(yes it was annkying), once it is downloaded, click the dance again and boom, your animations are playing! thats it, thats how you use it\n\nQuestion, is it universal?\nanswer\nYes, it has currentangle that will automatically reanimate you outside jab and green bassplate, the currentangle version is v4, i guess thats all...Oh qait, if you dont have a replicatesignal, the script will be forced to reanimate you in currentangle. Anyways, enjoy the script!\n--From Theo\nif you planning on skidding this off, goodluck, the code is obfuscated ")
end

if not isfolder("Theo-Dancezzz-Dancezzz") then
makefolder("Theo-Dancezzz-Dancezzz")
end
local ws=game.Workspace
if ws:FindFirstChild("full") then
ws.full:Destroy()
end
local ScreenGui = Instance.new("ScreenGui",CoreGui)
ScreenGui.Name ="Theo-Dancezzz-Dancezzz"
local UseSoundPos=Instance.new("BoolValue")
local StringVal=Instance.new("StringValue")
local Numval=Instance.new("NumberValue")
--StringVal.Name="Idl"
StringVal.Name="Char"
Numval.Name="MusicWeight"
Numval.Value=.1
UseSoundPos.Value=false
local ui = Instance.new("Frame",ScreenGui)
local title = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local REANIMATE = Instance.new("TextButton",ui)
local Run1 = Instance.new("TextButton")
local Stop1 = Instance.new("TextButton",ui)
local ced = Instance.new("TextLabel")
local Show =Instance.new("TextButton")
local corner=Instance.new("UICorner",ui)
--local DANCEINFO=Instance.new("TextButton",ui)
--local Show =Instance.new("TextButton",ui)
local corner1=Instance.new("UICorner",Run1)
corner2=Instance.new("UICorner",Stop1)
corner3=Instance.new("UICorner",Show)
corner4=Instance.new("UICorner",REANIMATE)
corner5=Instance.new("UICorner",DANCEINFO)
--corner4=Instance.new("UICorner",Show)
local CurrentFrame=Instance.new("Frame",ScreenGui)
local Stroke=Instance.new("UIStroke",CurrentFrame)
local Corner=Instance.new("UICorner",CurrentFrame)
Stroke.Thickness=3
Stroke.Transparency=.65
local CurrentPage=Instance.new("TextLabel",CurrentFrame)
local Page=Instance.new("TextLabel",CurrentFrame)
local CurrentKey=Instance.new("TextLabel",CurrentFrame)
local Key=Instance.new("TextLabel",CurrentFrame)
local DanceInfo=Instance.new("TextLabel",CurrentFrame)
local Dance=Instance.new("TextLabel",CurrentFrame)
local Credits=Instance.new("TextLabel",CurrentFrame)

-- HUD frame & label setup (matching HKdv3 layout)
CurrentFrame.Size=UDim2.new(0.26572, 0, 0.16564, 0)
CurrentFrame.Name="Current"
CurrentFrame.Position=UDim2.new(0.385, 0, 1.15, 0) -- starts off-screen, tweens in
CurrentFrame.BackgroundColor3=Color3.fromRGB(50,50,50)
CurrentFrame.BackgroundTransparency=.55

CurrentPage.Text="Page:"
CurrentPage.Font="Arcade"
CurrentPage.TextColor3=Color3.new(255,255,255)
CurrentPage.BackgroundTransparency=1
CurrentPage.Size=UDim2.new(0.2, 0, 0.59259, 0)
CurrentPage.Position=UDim2.new(0.01429, 0, 0, 0)
CurrentPage.TextSize=11
CurrentPage.Name="CurrentPage"

Page.Text="1/1"
Page.Font="Arcade"
Page.BackgroundTransparency=1
Page.TextSize=16
Page.TextColor3=Color3.new(255,255,255)
Page.Size=UDim2.new(0.3, 0, 0.33333, 0)
Page.Position=UDim2.new(0.22857, 0, 0.11111, 0)
Page.Name="CurrentPage"

CurrentKey.Text="Key:"
CurrentKey.Font="Arcade"
CurrentKey.Size=UDim2.new(0.2, 0, 0.33333, 0)
CurrentKey.TextColor3=Color3.new(255,255,255)
CurrentKey.BackgroundTransparency=1
CurrentKey.Position=UDim2.new(0.53571, 0, 0.12963, 0)
CurrentKey.TextSize=11
CurrentKey.Name="CurrentKey"

Key.Text="None"
Key.Font="Arcade"
Key.BackgroundTransparency=1
Key.TextColor3=Color3.new(255,255,255)
Key.TextSize=18
Key.Size=UDim2.new(0.2, 0, 0.33333, 0)
Key.Position=UDim2.new(0.75, 0, 0.11111, 0)
Key.Name="Mode"

DanceInfo.Text="Dance:"
DanceInfo.Font="Arcade"
DanceInfo.BackgroundTransparency=1
DanceInfo.TextColor3=Color3.new(255,255,255)
DanceInfo.TextSize=11
DanceInfo.Size=UDim2.new(0.2, 0, 0.3, 0)
DanceInfo.Position=UDim2.new(0, 0, 0.55556, 0)
DanceInfo.Name="PressedKey"

Dance.Text="None"
Dance.Font="Arcade"
Dance.BackgroundTransparency=1
Dance.TextSize=10.5
Dance.TextColor3=Color3.new(255,255,255)
Dance.Size=UDim2.new(0.5, 0, 0.33333, 0)
Dance.Position=UDim2.new(0.310, 0, 0.55556, 0)

Credits.Text="R6 Tool Dance"
Credits.Font="Fantasy"
Credits.TextColor3=Color3.new(255,255,255)
Credits.BackgroundTransparency=1
Credits.TextSize=11
Credits.Size=UDim2.new(0.4, 0, 0.37037, 0)
Credits.Position=UDim2.new(0, 125, 0.55556, 0)
Credits.Name="Credits"

-- Tween the HUD panel into view (same as HKdv3)
--[[task.spawn(function()
task.wait(1)
local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(CurrentFrame, tweenInfo, {Position = UDim2.new(0.385, 0, 0.82, 0)})
tween:Play()
end)]]

ui.Name = "ui"
ui.Active = true
ui.BackgroundColor3 = Color3.new(0, 0, 0)
ui.BackgroundTransparency = 0
ui.BorderSizePixel = 3
ui.Position=UDim2.new(0.35, 0, 0.5, -100)
ui.Size = UDim2.new(0, 200, 0, 200)

title.Name = "title"
title.Parent = ui
title.BackgroundColor3 = Color3.new(68, 68, 68)
title.BackgroundTransparency = 1
title.BorderSizePixel = 2
title.Position = UDim2.new(0, 0, 0.0199999996, 0)
title.Size = UDim2.new(1, 0, 0, 50)
title.Font = Enum.Font.Arcade
title.Text = "Made By Theo"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.TextSize = 7.5
title.TextWrapped = true

Frame.Parent = title
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.07, 0, 0.860000014, 0)
Frame.Size = UDim2.new(0.85, 0, 0, 6)

REANIMATE.Name = "F20 FR"
REANIMATE.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
REANIMATE.BorderSizePixel = 0
REANIMATE.Position = UDim2.new(0, 0, .350, 0)
REANIMATE.Size = UDim2.new(0.5, 0, 0, 45)
REANIMATE.Font = "Arcade"
REANIMATE.Text = "REANIMATE"
REANIMATE.TextColor3 = Color3.new(1,1,1)
REANIMATE.TextScaled = true
REANIMATE.TextSize = 10
REANIMATE.TextWrapped = true
--[[
DANCEINFO.Name = "F20 FR"
DANCEINFO.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
DANCEINFO.BorderSizePixel = 0
DANCEINFO.Position = UDim2.new(0.5, 0, .350, 0)
DANCEINFO.Size = UDim2.new(0.5, 0, 0, 45)
DANCEINFO.Font = "Arcade"
DANCEINFO.Text = "Click Me!"
DANCEINFO.TextColor3 = Color3.new(1,1,1)
DANCEINFO.TextScaled = false
DANCEINFO.TextSize = 15
DANCEINFO.TextWrapped = false
]]
Run1.Name = "Stick"
Run1.Parent = ui
Run1.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
Run1.BackgroundTransparency = 0
Run1.BorderSizePixel = 0
Run1.Position = UDim2.new(10, 0, 0.629999971, 0)
Run1.Size = UDim2.new(0.5, 0, 0, 45)
Run1.Font = "Arcade"
Run1.Text = "Run"
Run1.TextColor3 = Color3.new(1,1,1)
Run1.TextScaled = true
Run1.TextSize = 10
Run1.TextWrapped = true
--[[
Show.Name = "Stick"
Show.Parent = ui
Show.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
Show.BackgroundTransparency = 0
Show.BorderSizePixel = 0
Show.Position = UDim2.new(1, 0, .35, 0)
Show.Size = UDim2.new(0.5, 0, 0, 45)
Show.Font = Enum.Font.Sarpanch
Show.Text = "Enabled"
Show.TextColor3 = Color3.new(1,1,1)
Show.TextScaled = true
Show.TextSize = 10
Show.TextWrapped = true
]]
Stop1.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
Stop1.Position=UDim2.new(0.50, 0, 0.629999971, 0)
Stop1.Size = UDim2.new(0.5, 0, 0, 45)
Stop1.TextColor3 = Color3.new(1,1,1)
Stop1.Text ="Stop"
Stop1.TextScaled = true
Stop1.TextSize = 10
Stop1.Font="Arcade"

ui.Draggable = true

ced.Name = "made"
ced.Parent = ui
ced.BackgroundColor3 = Color3.new(1, 1, 1)
ced.BackgroundTransparency = 1
ced.BorderSizePixel = 2
ced.Position = UDim2.new(0, 0, 0.795, 0)
ced.Size = UDim2.new(1, 0, 0, 50)
ced.Font = "Fantasy"
ced.Text = "R6 Tool Dance"
ced.TextColor3 = Color3.new(1, 1, 1)
ced.TextScaled = true
ced.TextSize = 6
ced.TextWrapped = true

Show.Parent=ScreenGui
Show.Font="Arcade"
Show.Text="Disable"
Show.TextColor3=Color3.new(1,1,1)
Show.TextScaled=true
Show.TextSize=14
Show.Size=UDim2.new(0, 50, 0, 50)
Show.Position=UDim2.new(0, 0, 2, 0)
Show.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
local originalUIPosition = ui.Position
local isTweening = false
Show.MouseButton1Click:Connect(function()
if isTweening then return end

isTweening = true
isenabled = not isenabled

if isenabled then
local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(ui, tweenInfo, {Position = UDim2.new(1.5, 0, originalUIPosition.Y.Scale, originalUIPosition.Y.Offset)})
tween:Play()
Show.Text = "Show"

tween.Completed:Connect(function()
ui.Visible = false
isTweening = false
end)
else
ui.Visible = true
local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(ui, tweenInfo, {Position = originalUIPosition})
tween:Play()
Show.Text = "Hide"

tween.Completed:Connect(function()
isTweening = false
end)
end
end)
local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(Show, tweenInfo, {Position = UDim2.new(0, 0, .50, 0)})
tween:Play()

local function respawn()
replicatesignal(game.Players.LocalPlayer.kill)
replicatesignal(game.Players.LocalPlayer.Character.Humanoid.ServerBreakJoints)
game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
wait(.1)
pcall(function()
ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake"):Destroy()
end)
end

local REANIMATION=false
local Place = game.placeId
if not replicatesignal then
notify("No Replicate Signal :(")
ReanimateVer="Current"
end
local function Backup()
--// BY MrY7zz
REANIMATION=true
--[[
WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz
if not game:IsLoaded() then
game.Loaded:Wait()
end

--// Check configdoc.md for settings documentation

--// Below are the settings
-- SETTINGS --
local settings = _G

settings["Use default animations"] = true
settings["Local character transparency level"] = 1
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true
settings["Instant respawn"] = false
settings["Hide HumanoidRootPart"] = false
settings["PermaDeath fake character"] = false
settings["R15 Reanimate"] = false
settings["Click Fling"] = false
settings["Anti-Fling"] = true
settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)
settings["Allow tool equipping"] = true --// Placeholder
settings["Client sided display mode"] = 2 --// If you will see the fake character, or the real character, 1 = real character (default), 2 = fake character
settings["Fallback prompt"] = false --// Enable or disable the annoying fallback prompt if your game is not whitelisted
settings["Respawn mode"] = "ServerBreakJoints"

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
--// Settings end

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
REANIMATION=false 
end
local function Backup1()
--[[
// Empyrean Eeanimate
]]
do
local Accessories = {}

local Aligns = {}

local Attachments = {}

local BindableEvent = nil

local Blacklist = {}

local CFrame = CFrame
local CFrameidentity = CFrame.identity
local CFramelookAt = CFrame.lookAt
local CFramenew = CFrame.new

local Character = nil

local CurrentCamera = nil

local Enum = Enum
local Custom = Enum.CameraType.Custom
local Health = Enum.CoreGuiType.Health
local HumanoidRigType = Enum.HumanoidRigType
local R6 = HumanoidRigType.R6
local Dead = Enum.HumanoidStateType.Dead
local LockCenter = Enum.MouseBehavior.LockCenter
local UserInputType = Enum.UserInputType
local MouseButton1 = UserInputType.MouseButton1
local Touch = UserInputType.Touch

local Exceptions = {}

local game = game
local Clone = game.Clone
local Close = game.Close
local Connect = Close.Connect
local Disconnect = Connect(Close, function() end).Disconnect
local Wait = Close.Wait
local Destroy = game.Destroy
local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
local FindFirstChild = game.FindFirstChild
local FindFirstChildOfClass = game.FindFirstChildOfClass
local Players = FindFirstChildOfClass(game, "Players")
local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
local GetPlayers = Players.GetPlayers
local LocalPlayer = Players.LocalPlayer
local CharacterAdded = LocalPlayer.CharacterAdded
--local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
local Mouse = LocalPlayer:GetMouse()
local Kill = LocalPlayer.Kill
local RunService = FindFirstChildOfClass(game, "RunService")
local PostSimulation = RunService.PostSimulation
local PreRender = RunService.PreRender
local PreSimulation = RunService.PreSimulation
local StarterGui = FindFirstChildOfClass(game, "StarterGui")
local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
local SetCore = StarterGui.SetCore
local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
local Workspace = FindFirstChildOfClass(game, "Workspace")
local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
local HatDropY = FallenPartsDestroyHeight - 0.7
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local UserInputService = FindFirstChildOfClass(game, "UserInputService")
local InputBegan = UserInputService.InputBegan
local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
local GetChildren = game.GetChildren
local GetDescendants = game.GetDescendants
local GetPropertyChangedSignal = game.GetPropertyChangedSignal
local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
local IsA = game.IsA
local IsDescendantOf = game.IsDescendantOf

local Highlights = {}

local Instancenew = Instance.new
local R15Animation = Instancenew("Animation")
local R6Animation = Instancenew("Animation")
local HumanoidDescription = Instancenew("HumanoidDescription")
local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
local SetAccessories = HumanoidDescription.SetAccessories
local ModelBreakJoints = HumanoidModel.BreakJoints
local Head = HumanoidModel.Head
local BasePartBreakJoints = Head.BreakJoints
local GetJoints = Head.GetJoints
local IsGrounded = Head.IsGrounded
local Humanoid = HumanoidModel.Humanoid
local ApplyDescription = Humanoid.ApplyDescription
local ChangeState = Humanoid.ChangeState
local EquipTool = Humanoid.EquipTool
local GetAppliedDescription = Humanoid.GetAppliedDescription
local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
local LoadAnimation = Humanoid.LoadAnimation
local Move = Humanoid.Move
local UnequipTools = Humanoid.UnequipTools
local ScaleTo = HumanoidModel.ScaleTo

local IsFirst = false
local IsHealthEnabled = nil
local IsLockCenter = false
local IsRegistered = false
local IsRunning = false

local LastTime = nil

local math = math
local mathrandom = math.random
local mathsin = math.sin

local nan = 0 / 0

local next = next

local OptionsAccessories = nil
local OptionsApplyDescription = nil
local OptionsBreakJointsDelay = nil
local OptionsClickFling = nil
local OptionsDisableCharacterCollisions = nil
local OptionsDisableHealthBar = nil
local OptionsDisableRigCollisions = nil
local OptionsDefaultFlingOptions = nil
local OptionsHatDrop = nil
local OptionsHideCharacter = nil
local OptionsParentCharacter = nil
local OptionsPermanentDeath = nil
local OptionsRefit = nil
local OptionsRigTransparency = nil
local OptionsSetCameraSubject = nil
local OptionsSetCameraType = nil
local OptionsSetCharacter = nil
local OptionsSetCollisionGroup = nil
local OptionsSimulationRadius = nil
local OptionsTeleportRadius = nil
local OptionsUseServerBreakJoints

local osclock = os.clock

local PreRenderConnection = nil

local RBXScriptConnections = {}

local Refitting = false

local replicatesignal = replicatesignal

local Rig = nil
local RigHumanoid = nil
local RigHumanoidRootPart = nil

local sethiddenproperty = sethiddenproperty
local setscriptable = setscriptable

local stringfind = string.find

local table = table
local tableclear = table.clear
local tablefind = table.find
local tableinsert = table.insert
local tableremove = table.remove

local Targets = {}

local task = task
local taskdefer = task.defer
local taskspawn = task.spawn
local taskwait = task.wait

local Time = nil

local Tools = {}

local Vector3 = Vector3
local Vector3new = Vector3.new
local FlingVelocity = Vector3new(16384, 16384, 16384)
local HatDropLinearVelocity = Vector3new(0, 27, 0)
local HideCharacterOffset = Vector3new(0, - 30, 0)
local Vector3one = Vector3.one
local Vector3xzAxis = Vector3new(1, 0, 1)
local Vector3zero = Vector3.zero
local AntiSleep = Vector3zero

R15Animation.AnimationId = "rbxassetid://507767968"
R6Animation.AnimationId = "rbxassetid://180436148"

Humanoid = nil

Destroy(HumanoidDescription)
HumanoidDescription = nil

local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
for Index, Child in next, GetChildren(Parent) do
if IsA(Child, ClassName) and Child.Name == Name then
return Child
end
end
end

local GetHandleFromTable = function(Table)
for Index, Child in GetChildren(Character) do
if IsA(Child, "Accoutrement") then
local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

if Handle then
local MeshId = nil
local TextureId = nil

if IsA(Handle, "MeshPart") then
MeshId = Handle.MeshId
TextureId = Handle.TextureID
else
local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

if SpecialMesh then
MeshId = SpecialMesh.MeshId
TextureId = SpecialMesh.TextureId
end
end

if MeshId then
if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
return Handle
end
end
end
end
end
end

local NewIndex = function(self, Index, Value)
self[Index] = Value
end

local DescendantAdded = function(Descendant)
if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
if sethiddenproperty then
sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
elseif setscriptable then
setscriptable(Descendant, "BackendAccoutrementState", true)
Descendant.BackendAccoutrementState = 0
end
end
elseif IsA(Descendant, "Attachment") then
local Attachment = Attachments[Descendant.Name]

if Attachment then
local Parent = Descendant.Parent

if IsA(Parent, "BasePart") then
local MeshId = nil
local TextureId = nil

if IsA(Parent, "MeshPart") then
MeshId = Parent.MeshId
TextureId = Parent.TextureID
else
local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

if SpecialMesh then
MeshId = SpecialMesh.MeshId
TextureId = SpecialMesh.TextureId
end
end

if MeshId then
for Index, Table in next, Accessories do
if Table.MeshId == MeshId and Table.TextureId == TextureId then
local Handle = Table.Handle

tableinsert(Aligns, {
LastPosition = Handle.Position,
Offset = CFrameidentity,
Part0 = Parent,
Part1 = Handle
})

return
end
end

for Index, Table in next, OptionsAccessories do
if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
local Instance = nil
local TableName = Table.Name
local TableNames = Table.Names

if TableName then
Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
else
for Index, TableName in next, TableNames do
local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

if not ( TableNames[Index + 1] and Blacklist[Child] ) then
Instance = Child
break
end
end
end

if Instance then
local Blacklisted = Blacklist[Instance]

if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
tableinsert(Aligns, {
Offset = Table.Offset,
Part0 = Parent,
Part1 = Instance
})

Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

return
end
end
end
end

local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

if Accoutrement and IsA(Accoutrement, "Accoutrement") then
local AccoutrementClone = Clone(Accoutrement)

local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
HandleClone.Transparency = OptionsRigTransparency

for Index, Descendant in next, GetDescendants(HandleClone) do
if IsA(Descendant, "JointInstance") then
Destroy(Descendant)
end
end

local AccessoryWeld = Instancenew("Weld")
AccessoryWeld.C0 = Descendant.CFrame
AccessoryWeld.C1 = Attachment.CFrame
AccessoryWeld.Name = "AccessoryWeld"
AccessoryWeld.Part0 = HandleClone
AccessoryWeld.Part1 = Attachment.Parent
AccessoryWeld.Parent = HandleClone

AccoutrementClone.Parent = Rig

tableinsert(Accessories, {
Handle = HandleClone,
MeshId = MeshId,
TextureId = TextureId
})
tableinsert(Aligns, {
Offset = CFrameidentity,
Part0 = Parent,
Part1 = HandleClone
})
end
end
end
end
end
end

local SetCameraSubject = function()
local CameraCFrame = CurrentCamera.CFrame
local Position = RigHumanoidRootPart.CFrame.Position

CurrentCamera.CameraSubject = RigHumanoid
Wait(PreRender)
CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
end

local OnCameraSubjectChanged = function()
if CurrentCamera.CameraSubject ~= RigHumanoid then
taskdefer(SetCameraSubject)
end
end

local OnCameraTypeChanged = function()
if CurrentCamera.CameraType ~= Custom then
CurrentCamera.CameraType = Custom
end
end

local OnCurrentCameraChanged = function()
local Camera = Workspace.CurrentCamera

if Camera and OptionsSetCameraSubject then
CurrentCamera = Workspace.CurrentCamera

taskspawn(SetCameraSubject)

OnCameraSubjectChanged()
tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

if OptionsSetCameraType then
OnCameraTypeChanged()
tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
end
end
end

local SetCharacter = function()
LocalPlayer.Character = Rig
end

local SetSimulationRadius = function()
LocalPlayer.SimulationRadius = OptionsSimulationRadius
end

local WaitForChildOfClass = function(Parent, ClassName)
local Child = FindFirstChildOfClass(Parent, ClassName)

while not Child do
Wait(Parent.ChildAdded)
Child = FindFirstChildOfClass(Parent, ClassName)
end

return Child
end

local WaitForChildOfClassAndName = function(Parent, ...)
local Child = FindFirstChildOfClassAndName(Parent, ...)

while not Child do
Wait(Parent.ChildAdded)
Child = FindFirstChildOfClassAndName(Parent, ...)
end

return Child
end

local Fling = function(Target, Options)
if Target then
local Highlight = Options.Highlight

if IsA(Target, "Humanoid") then
Target = Target.Parent
end
if IsA(Target, "Model") then
Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
end

if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
local Model = FindFirstAncestorOfClass(Target, "Model")

if Model and FindFirstChildOfClass(Model, "Humanoid") then
Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target
else
Model = Target
end

if Highlight then
local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
HighlightObject.Adornee = Model
HighlightObject.Parent = Model

Options.HighlightObject = HighlightObject
tableinsert(Highlights, HighlightObject)
end

Targets[Target] = Options

if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
--replicatesignal(ConnectDiedSignalBackend)
end
end
end
end

local OnCharacterAdded = function(NewCharacter)
if NewCharacter ~= Rig then
tableclear(Aligns)
tableclear(Blacklist)

Character = NewCharacter

if OptionsSetCameraSubject then
taskspawn(SetCameraSubject)
end

if OptionsSetCharacter then
taskdefer(SetCharacter)
end

if OptionsParentCharacter then
Character.Parent = Rig
end

for Index, Descendant in next, GetDescendants(Character) do
taskspawn(DescendantAdded, Descendant)
end

tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

Humanoid = WaitForChildOfClass(Character, "Humanoid")
local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

if IsFirst then
if OptionsApplyDescription and Humanoid then
local AppliedDescription = GetAppliedDescription(Humanoid)
SetAccessories(AppliedDescription, {}, true)
taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
end

if HumanoidRootPart then
RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

if OptionsSetCollisionGroup then
local CollisionGroup = HumanoidRootPart.CollisionGroup

for Index, Descendant in next, GetDescendants(Rig) do
if IsA(Descendant, "BasePart") then
Descendant.CollisionGroup = CollisionGroup
end
end
end
end

IsFirst = false
end

local IsAlive = true

if HumanoidRootPart then
for Target, Options in next, Targets do
if IsDescendantOf(Target, Workspace) then
local FirstPosition = Target.Position
local PredictionFling = Options.PredictionFling
local LastPosition = FirstPosition
local Timeout = osclock() + Options.Timeout or 1

if HumanoidRootPart then
while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
local DeltaTime = taskwait()
local Position = Target.Position

if ( Position - FirstPosition ).Magnitude > 100 then
break
end

local Offset = Vector3zero

if PredictionFling then
Offset = ( Position - LastPosition ) / DeltaTime * 0.13
end

HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

HumanoidRootPart.CFrame = Target.CFrame + Offset
LastPosition = Position
end
end
end

local HighlightObject = Options.HighlightObject

if HighlightObject then
Destroy(HighlightObject)
end

Targets[Target] = nil
end

HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

if OptionsHatDrop then
taskspawn(function()
WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
AnimationTrack:Stop()
end

LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

local RootPartCFrame = RigHumanoidRootPart.CFrame
RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

while IsAlive do
HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
HumanoidRootPart.CFrame = RootPartCFrame

taskwait()
end
end)
elseif OptionsHideCharacter then
local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

taskspawn(function()
while IsAlive do
HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
HumanoidRootPart.CFrame = RootPartCFrame

taskwait()
end
end)
elseif OptionsTeleportRadius then
HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
end
end

local ToolFling = OptionsDefaultFlingOptions.ToolFling
local Tools2 = {}

if ToolFling then
local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")

tableclear(Tools)

if type(ToolFling) == "string" then
local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)

if Tool then
Tool.Parent = Character
tableinsert(Tools2, Tool)
end
else
for Index, Tool in GetChildren(Backpack) do
if IsA(Tool, "Tool") then
Tool.Parent = Character
tableinsert(Tools2, Tool)
end
end
end

UnequipTools(Humanoid)
end

if OptionsPermanentDeath and replicatesignal then
--replicatesignal(ConnectDiedSignalBackend)

taskwait(Players.RespawnTime + 0.1)

Refitting = false
replicatesignal(Kill)
else
taskwait(OptionsBreakJointsDelay)
end

ModelBreakJoints(Character)

if replicatesignal and OptionsUseServerBreakJoints then
replicatesignal(Humanoid.ServerBreakJoints)
end

ChangeState(Humanoid, Dead)
Wait(Humanoid.Died)

for Index, Tool in Tools2 do
local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")

if Handle then
Tool.Parent = Character
else
tableremove(Tools2, Index)
end
end

Tools = Tools2
UnequipTools(Humanoid)

IsAlive = false

if OptionsHatDrop then
pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
end
end
end

local OnInputBegan = function(InputObject)
local UserInputType = InputObject.UserInputType

if UserInputType == MouseButton1 or UserInputType == Touch then
local Target = Mouse.Target

local HatFling = OptionsDefaultFlingOptions.HatFling
local ToolFling = OptionsDefaultFlingOptions.ToolFling

if HatFling and OptionsHatDrop then
local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

if not Part then
for Index, Child in GetChildren(Character) do
if IsA(Child, "Accoutrement") then
local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

if Handle then
Part = Handle
break
end
end
end
end

if Part then
Exceptions[Part] = true

while IsMouseButtonPressed(UserInputService, MouseButton1) do
if Part.ReceiveAge == 0 then
Part.AssemblyAngularVelocity = FlingVelocity
Part.AssemblyLinearVelocity = FlingVelocity
Part.CFrame = Mouse.Hit + AntiSleep
end

taskwait()
end

Exceptions[Part] = nil
end
elseif ToolFling then
local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
local Tool = nil

if type(ToolFling) == "string" then
Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
end

if not Tool then
Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
end

if Tool then
local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

if Handle then
Tool.Parent = Character

while IsMouseButtonPressed(UserInputService, MouseButton1) do
if Handle.ReceiveAge == 0 then
Handle.AssemblyAngularVelocity = FlingVelocity
Handle.AssemblyLinearVelocity = FlingVelocity
Handle.CFrame = Mouse.Hit + AntiSleep
end

taskwait()
end

UnequipTools(Humanoid)

Handle.AssemblyAngularVelocity = Vector3zero
Handle.AssemblyLinearVelocity = Vector3zero
Handle.CFrame = RigHumanoidRootPart.CFrame
end
end
else
Fling(Target, OptionsDefaultFlingOptions)
end
end
end

local OnPostSimulation = function()
Time = osclock()
local DeltaTime = Time - LastTime
LastTime = Time

if not OptionsSetCharacter and IsLockCenter then
local Position = RigHumanoidRootPart.Position
RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
end

if OptionsSimulationRadius then
pcall(SetSimulationRadius)
end

AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
local Axis = 27 + mathsin(Time)

for Index, Table in next, Aligns do
local Part0 = Table.Part0

if not Exceptions[Part0] then
if Part0.ReceiveAge == 0 then
if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
local Part1 = Table.Part1

Part0.AssemblyAngularVelocity = Vector3zero

local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
end
else
local Frames = Table.Frames or - 1
Frames = Frames + 1
Table.Frames = Frames

if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
Refitting = false
--replicatesignal(ConnectDiedSignalBackend)
end
end
end
end

if not OptionsSetCharacter and Humanoid then
Move(RigHumanoid, Humanoid.MoveDirection)
RigHumanoid.Jump = Humanoid.Jump
end
end

local OnPreRender = function()
local Position = RigHumanoidRootPart.Position
RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

for Index, Table in next, Aligns do
local Part0 = Table.Part0

if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
Part0.CFrame = Table.Part1.CFrame * Table.Offset
end
end
end

local OnMouseBehaviorChanged = function()
IsLockCenter = UserInputService.MouseBehavior == LockCenter

if IsLockCenter then
PreRenderConnection = Connect(PreRender, OnPreRender)
tableinsert(RBXScriptConnections, PreRenderConnection)
elseif PreRenderConnection then
Disconnect(PreRenderConnection)
tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
end
end

local OnPreSimulation = function()
if OptionsDisableCharacterCollisions and Character then
for Index, Descendant in next, GetDescendants(Character) do
if IsA(Descendant, "BasePart") then
Descendant.CanCollide = false
end
end
end

if OptionsDisableRigCollisions then
for Index, Descendant in next, GetChildren(Rig) do
if IsA(Descendant, "BasePart") then
Descendant.CanCollide = false
end
end
end
end

local Register = function()
repeat
IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
taskwait()
until IsRegistered
end

Start = function(Options)
if not IsRunning then
IsFirst = true
IsRunning = true

Options = Options or {}
OptionsAccessories = Options.Accessories or {}
OptionsApplyDescription = Options.ApplyDescription
OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
OptionsClickFling = Options.ClickFling
OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
OptionsDisableHealthBar = Options.DisableHealthBar
OptionsDisableRigCollisions = Options.DisableRigCollisions
OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
OptionsHatDrop = Options.HatDrop
OptionsHideCharacter = Options.HideCharacter
OptionsParentCharacter = Options.ParentCharacter
OptionsPermanentDeath = Options.PermanentDeath
OptionsRefit = Options.Refit
local OptionsRigSize = Options.RigSize
OptionsRigTransparency = Options.RigTransparency or 1
OptionsSetCameraSubject = Options.SetCameraSubject
OptionsSetCameraType = Options.SetCameraType
OptionsSetCharacter = Options.SetCharacter
OptionsSetCollisionGroup = Options.SetCollisionGroup
OptionsSimulationRadius = Options.SimulationRadius
OptionsTeleportRadius = Options.TeleportRadius
OptionsUseServerBreakJoints = Options.UseServerBreakJoints

if OptionsDisableHealthBar then
IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
SetCoreGuiEnabled(StarterGui, Health, false)
end

BindableEvent = Instancenew("BindableEvent")
tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
Rig.Name = "ReanimatedRig"
RigHumanoid = Rig.Humanoid
RigHumanoidRootPart = Rig.HumanoidRootPart
Rig.Parent = Workspace

for Index, Descendant in next, GetDescendants(Rig) do
if IsA(Descendant, "Attachment") then
Attachments[Descendant.Name] = Descendant
elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
Descendant.Transparency = OptionsRigTransparency
end
end

if OptionsRigSize then
ScaleTo(Rig, OptionsRigSize)

RigHumanoid.JumpPower = 50
RigHumanoid.WalkSpeed = 16
end

OnCurrentCameraChanged()
tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

if OptionsClickFling then
tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
end

local Character = LocalPlayer.Character

if Character then
OnCharacterAdded(Character)
end

tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

LastTime = osclock()
tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

if not OptionsSetCharacter then
OnMouseBehaviorChanged()
tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
end

if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
OnPreSimulation()
tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
end

IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

if not IsRegistered then
taskspawn(Register)
end

return {
BindableEvent = BindableEvent,
Fling = Fling,
Rig = Rig
}
end
end

Stop = function()
if IsRunning then
IsFirst = false
IsRunning = false

for Index, Highlight in Highlights do
Destroy(Highlight)
end

tableclear(Highlights)

for Index, RBXScriptConnection in next, RBXScriptConnections do
Disconnect(RBXScriptConnection)
end

tableclear(RBXScriptConnections)

Destroy(BindableEvent)

if Character.Parent == Rig then
Character.Parent = Workspace
end

if Humanoid then
ChangeState(Humanoid, Dead)
end

Destroy(Rig)

if OptionsPermanentDeath and replicatesignal then
--replicatesignal(ConnectDiedSignalBackend)
end

if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
end

if IsRegistered then
pcall(SetCore, StarterGui, "ResetButtonCallback", true)
else
IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
end
end
end
end
local rad=math.rad

function Normalize(id)
if not id then return "" end
id=tostring(id)

local num=id:match("(%d+)")
return num or ""
end
local TableOfAccessries={
--{ MeshId = "", Name = "", Offset = CFrame.identity, TextureId = "" },

{ MeshId = "137702817952968", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "135650240593878" },--84451219120140
{ MeshId = "137702817952968", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "135650240593878" },--72292903231768

{ MeshId = "137702817952968", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "73798034827573" },--108186273151388
{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "73798034827573" },--139904067056008

{ MeshId = "12344207333", Names = { "Left Arm", "Right Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "12344207341" },--12344545199
{ MeshId = "12344206657", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "12344206675" },--12344591101

{ MeshId = "11449386931", Names = { "Left Arm", "Right Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "11439439606" },--11449687315
{ MeshId = "11449388499", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "11439439606" },--11449703382

{ MeshId = "12652772399", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.identity, TextureId = "12652775021" },--12652786974

{ MeshId = "11263221350", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "11263219250" },--11263254795
{ MeshId = "11159370334", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "11159284657" },--11159410305
{ MeshId = "11159370334", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "11159285454" },--11159483910

{ MeshId = "105141400603933", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "71060417496309" },--102599402682100
{ MeshId = "99608462237958", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "130809869695496" },--140395948277978

{ MeshId = "90736849096372", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "79186624401216" },--90960046381276
{ MeshId = "139733645770094", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "130809869695496" },--82942681251131

{ MeshId = "125405780718494", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--85392395166623
{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--131385506535381

{ MeshId = "125405780718494", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--106249329428811
{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--129462518582032

{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },--14255556501
{ MeshId = "14255522247", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },--14255554762

{ MeshId = "17374767929", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },--17374851733
{ MeshId = "17374767929", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },--17374846953

{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255544465" },--14255560646
{ MeshId = "14255522247", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255544465" },--14255562939

{ MeshId = "18640914129", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.identity, TextureId = "18640914168" },--18641142410
{ MeshId = "18640914129", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "18640914168" },--18641077392

{ MeshId = "18640901641", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.identity, TextureId = "18640901676" },--18641187217
{ MeshId = "18640901641", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "18640901676" },--18641157833

{ MeshId = "17387586286", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },--17387616772
{ MeshId = "17387586286", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },--17393641992

{ MeshId = "3030546036", Names = { "Left Arm", "Left Leg", "Right Arm", "Right Leg" }, Offset = CFrame.Angles(- 1.57, 0, 0), TextureId = "" },
{ MeshId = "4324138105", Names = { "Left Arm", "Left Leg", "Right Arm", "Right Leg" }, Offset = CFrame.Angles(- 1.57, 0, 0), TextureId = "" },

{ MeshId = "18640899369", Name = "Torso", Offset = CFrame.identity, TextureId = "18640899481" },--18641046146
{ MeshId = "14241018198", Name = "Torso", Offset = CFrame.identity, TextureId = "14251599953" },--14255528083
{ MeshId = "110684113028749", Name = "Torso", Offset = CFrame.identity, TextureId = "70661572547971" },--138364679836274
{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.Angles(0, 0, -0.249), TextureId = "4819722776" },--4819740796
{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },--95290698984301

{ MeshId = "84515304632473", Name = "Torso", Offset = CFrame.identity, TextureId = "84039546952302" },--95290698984301
{ MeshId = "18919712035", Name = "Torso", Offset = CFrame.identity, TextureId = "18430134193" },--95290698984301
{ MeshId = "89457171427274", Name = "Head", Offset = CFrame.new(0,1.5,0), TextureId = "130665230882117" },--95290698984301


{ MeshId = "130309145260656", Name = "Left Leg", Offset = CFrame.Angles(rad(-105),rad(-18),rad(-15)), TextureId = "93374633946646" },--95290698984301
{ MeshId = "100128920324073", Name = "Right Arm", Offset = CFrame.Angles(rad(-105),rad(18),rad(15)), TextureId = "97155254696037" },--95290698984301
{ MeshId = "100128920324073", Name = "Right Leg", Offset = CFrame.Angles(rad(-105),rad(18),rad(15)), TextureId = "133680105074740" },--95290698984301
{ MeshId = "130309145260656", Name = "Left Arm", Offset = CFrame.Angles(rad(-105),rad(-18),rad(-15)), TextureId = "82390202293774" },--95290698984301
}
table.insert(TableOfAccessries,ExtraRigSupport)

function GetIds(acc)
if not acc or not acc:IsA("Accessory") then return nil end

local handle=acc:FindFirstChild("Handle")
if not handle then return nil end

-- MeshPart accessory
if handle:IsA("MeshPart") then
local meshId=Normalize(handle.MeshId)
local texId =Normalize(handle.TextureID)
return meshId, texId
end

local sm=handle:FindFirstChildOfClass("SpecialMesh")
if sm then
local meshId=Normalize(sm.MeshId)
local texId =Normalize(sm.TextureId)
return meshId, texId
end

return nil
end
Empyrean = Start({
Accessories = TableOfAccessries,
ApplyDescription = true,
BreakJointsDelay = 0,
ClickFling = false,
DefaultFlingOptions = {
HatFling = true,--{ MeshId="", TextureId = ""},
Highlight = true,
PredictionFling = true,
Timeout = 1,
ToolFling = false,--"Boombox",
},
DisableCharacterCollisions = true,
DisableHealthBar = true,
DisableRigCollisions = true,
HatDrop = false,
HideCharacter = Vector3.new(0, -150, 0),
ParentCharacter = false,
PermanentDeath = false,
Refit = true,
RigSize = 1,
RigTransparency = 1,
R15 = false,
SetCameraSubject = true,
SetCameraType = true,
SetCharacter = true,
SetCollisionGroup = true,
SimulationRadius = 10e10,
TeleportRadius = 12,
UseServerBreakJoints = false,
})
end
REANIMATE.MouseButton1Click:Connect(function()
if REANIMATION then return notify([[Reanimating...]]) end
if REANIMATION then return notify([[Reanimating...]]) end
if game.Workspace:FindFirstChild ("GelatekReanimate") then
return notify("Already Reanimated") end
if game.Workspace:FindFirstChild (game.Players.LocalPlayer.Name.."_Fake") then
return notify("Already Reanimated") end
if game.Workspace:FindFirstChild ("ReanimatedRig") then
return notify("Already Reanimated") end
if ReanimateVer=="Emper" then
Backup1()
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
REANIMATION=false

else
if Place == 17574618959 or Place == 88308889239232 or Place==123974602339071 then
if ReanimateVer=="Gelatek" then
if not replicatesignal then
Backup()
REANIMATION=true
repeat wait() until ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake")
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
REANIMATION=false
else
Run1.Position = UDim2.new(100, 0, 0.629999971, 0)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/VeryVeryReanimate.lua"))()
game.ReplicatedStorage["01_server"]:FireServer("cmd", "-net ")
REANIMATION=true
end
elseif ReanimateVer=="Current" then
Backup()
REANIMATION=true
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
end
if Place == 17574618959 or Place == 88308889239232 or Place==123974602339071 and ReanimateVer=="Gelatek" and ws:WaitForChild("GelatekReanimate")  then
if not replicatesignal then
repeat wait() until ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake")
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
REANIMATION=false
else
REANIMATION=false
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
end
elseif ReanimateVer=="Current" and ws:WaitForChild(game.Players.LocalPlayer.Name.."_Fake") then 
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
REANIMATION=false
end
else 
REANIMATION=true
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then 
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
REANIMATION=false
return
end
Backup()
repeat wait() until ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake")
Run1.Position = UDim2.new(0, 0, 0.629999971, 0)
REANIMATION=false
end
end
end)





local full = game:GetObjects("rbxassetid://107495486817639")[1]:Clone()
full.Parent = game:GetService("Workspace")
local fallback = game:GetObjects("rbxassetid://117971041844492")[1]:FindFirstChildOfClass("KeyframeSequence")
fallback.Parent = full







local is = newproxy(true)
local function loadlocalasset(id)
local id = tostring(id)
local id = id:gsub("^rbxassetid://", "")
local _, asset = pcall(function() return full[id] end)
if not _ or not asset then
asset = fallback
end

return asset:Clone()
end
getmetatable(is).__namecall = function(_, id)
return loadlocalasset(id)
end
local danceCache = {}
local function AddDance(Name, ScriptUrl)
local filePath = "Theo-Dancezzz-Dancezzz/"..Name
if isfile(filePath) then
local success, danceData = pcall(function()
return loadstring(readfile(filePath))()
end)

if success and danceData then
if danceData:IsA("KeyframeSequence") then
local newDance = danceData:Clone()
newDance.Name = Name
newDance.Parent = full
print("Loaded from storage: "..Name)
return newDance
else
warn("Saved dance doesn't return KeyframeSequence: "..Name)
end
else
warn("Failed to load saved dance: "..Name.." - "..tostring(danceData))
end
end
warn("Downloading dance: "..Name)
local success, danceData = pcall(function()
return loadstring(game:HttpGet(ScriptUrl))()
end)
task.defer(function()
if success and danceData then
if danceData:IsA("KeyframeSequence") then
local newDance = danceData:Clone()
newDance.Name = Name
newDance.Parent = full
warn("Loaded: "..Name)
writefile(filePath, game:HttpGet(ScriptUrl))
return newDance
else
warn("Dance doesn't return KeyframeSequence: "..Name)
return nil
end
else
warn("Failed to load dance: "..Name.." - "..tostring(danceData))
return nil
end
end)
end





local danceCache = {}
local function LoadDance(danceName, scriptUrl)
if danceCache[danceName] then
return danceCache[danceName]
end

local dance = AddDance(danceName, scriptUrl)
if dance then
danceCache[danceName] = dance
end
return dance
end






local timeposcur = 0 
local musicSound = Instance.new("Sound",game:GetService("RunService"))
local Playsound = Instance.new("Sound",game:GetService("RunService"))
Playsound.Name = "Danc"
Playsound.Volume = .75
Playsound.Looped = true
Playsound.Parent = game:GetService("RunService")
musicSound.Looped = true
musicSound.Name = "danc"
musicSound.Playing = true
musicSound.Volume = .75







local function DanceAsset(file)
if not table.find(validAudioFiles, file) then
warn("Audio file not found: " .. file)
return ""
end
local filePath = "Theo-Dancezzz-Musics/"..file
if isfile(filePath) then
local fileSize = 0
pcall(function()
fileSize = #readfile(filePath)
end)
if fileSize < 204800 then
warn("Redownloading corrupted audio: " .. file)
delfile(filePath)
end
end

if not isfile(filePath) then 
warn("Downloading Audio: " .. file)
local success, errorMsg = pcall(function()
writefile(filePath, game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/"..file.."?raw=true"))
end)

if not success then
warn("Failed to download audio: " .. file .. " - " .. errorMsg)
writefile(filePath, "")
return ""
end
warn("Downloaded Audio: " .. file)
end
if isfile(filePath) then
local fileSize = 0
pcall(function()
fileSize = #readfile(filePath)
end)
if fileSize > 204800 then
return getcustomasset(filePath)
else
warn("Audio file is empty/corrupted: " .. file)
return ""
end
else
warn("File Not Found: " .. file)
return ""
end
end

local RUNNING = false
function MainScript()
if RUNNING==true then return end
RUNNING=true
local char=nil
if workspace:FindFirstChild("GelatekReanimate") then
char=workspace["GelatekReanimate"]
elseif workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then 
char=workspace[game.Players.LocalPlayer.Name.."_Fake"]
elseif workspace:FindFirstChild("ReanimatedRig") then
char=workspace["ReanimatedRig"]
else
char=workspace[game.Players.LocalPlayer.Name.."_Fake"]
end
StringVal.Value=char.Name
print("Runned")


--// Custom Tool/Inventory Gui
local G2L={};
G2L["1"] = Instance.new("ScreenGui", CoreGui);
G2L["1"]["Name"] = [[Custom Inventory]];
G2L["1"]["ResetOnSpawn"] = true;

if not DisableCustomInventory then
-- StarterGui.Custom Inventory.Inventory
G2L["2"] = Instance.new("ImageLabel", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["ZIndex"] = 0;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["SliceCenter"] = Rect.new(5, 5, 945, 612);
G2L["2"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["2"]["Size"] = UDim2.new(0, 225, 0, 100);
G2L["2"]["Visible"] = false;
G2L["2"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["2"]["BackgroundTransparency"] = 0.5;
G2L["2"]["Name"] = [[Inventory]];
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.925, -20);
G2L["2"]["BackgroundTransparency"] = .75;


-- StarterGui.Custom Inventory.Inventory.Frame
G2L["3"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["3"]["Active"] = true;
G2L["3"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["3"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;
G2L["3"]["TopImage"] = [[]];
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Name"] = [[Frame]];
G2L["3"]["ScrollBarImageTransparency"] = 0.4;
G2L["3"]["BottomImage"] = [[]];
G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["3"]["Size"] = UDim2.new(0.98, 0, 0.86193, 0);
G2L["3"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Position"] = UDim2.new(0.50106, 0, 0.54904, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["3"]["ScrollBarThickness"] = 5;
G2L["3"]["BackgroundTransparency"] = 1;


-- StarterGui.Custom Inventory.Inventory.Frame.Grid
G2L["4"] = Instance.new("UIGridLayout", G2L["3"]);
G2L["4"]["CellSize"] = UDim2.new(0, 90, 0, 100);
G2L["4"]["Name"] = [[Grid]];
G2L["4"]["CellPadding"] = UDim2.new(0, 15, 0, 15);


-- StarterGui.Custom Inventory.Inventory.Frame.UIPadding
G2L["5"] = Instance.new("UIPadding", G2L["3"]);
G2L["5"]["PaddingTop"] = UDim.new(0, 5);
G2L["5"]["PaddingLeft"] = UDim.new(0, 5);


-- StarterGui.Custom Inventory.Inventory.SearchBox
G2L["6"] = Instance.new("TextBox", G2L["2"]);
G2L["6"]["LineHeight"] = 1.1;
G2L["6"]["Name"] = [[SearchBox]];
G2L["6"]["PlaceholderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["TextWrapped"] = true;
G2L["6"]["ClearTextOnFocus"] = false;
G2L["6"]["TextSize"] = 14;
G2L["6"]["TextColor3"] = Color3.new(1, 1, 1);
G2L["6"]["TextScaled"] = true;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
G2L["6"]["Font"] = Enum.Font.Sarpanch;
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["6"]["PlaceholderText"] = [[Search...]];
G2L["6"]["Size"] = UDim2.new(0, 225, 0.04893, 20);
G2L["6"]["Position"] = UDim2.new(0, 112,0,-30);
G2L["6"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["6"]["Text"] = [[]];
G2L["6"]["BackgroundTransparency"] = .75;


-- StarterGui.Custom Inventory.Inventory.SearchBox.UICorner
G2L["7"] = Instance.new("UICorner", G2L["6"]);
G2L["7"]["CornerRadius"] = UDim.new(0.2, 0);


-- StarterGui.Custom Inventory.Inventory.UICorner
G2L["8"] = Instance.new("UICorner", G2L["2"]);
G2L["8"]["CornerRadius"] = UDim.new(0.05, 0);


-- StarterGui.Custom Inventory.hotBar
G2L["9"] = Instance.new("Frame", G2L["1"]);
G2L["9"]["ZIndex"] = 0;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["9"]["Size"] = UDim2.new(0.45209, 0, 0.05, 20);
G2L["9"]["Position"] = UDim2.new(0.5, 0, 0.99, -5);
G2L["9"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["9"]["Name"] = [[hotBar]];
G2L["9"]["BackgroundTransparency"] = 1;


-- StarterGui.Custom Inventory.hotBar.Grid
G2L["a"] = Instance.new("UIGridLayout", G2L["9"]);
G2L["a"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["a"]["CellSize"] = UDim2.new(0, 100, 0, 100);
G2L["a"]["Name"] = [[Grid]];
G2L["a"]["CellPadding"] = UDim2.new(0.01, 5, 0, 5);


-- StarterGui.Custom Inventory.openButton
G2L["b"] = Instance.new("ImageButton", G2L["1"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
G2L["b"]["ZIndex"] = 6;
G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["b"]["Size"] = UDim2.new(0, 60, 0, 60);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Name"] = [[openButton]];
G2L["b"]["Position"] = UDim2.new(.34, 0, 1.043, 0);

G2L["b1"] =Instance.new("UICorner", G2L["b"]);

-- StarterGui.Custom Inventory.openButton.info
G2L["c"] = Instance.new("TextLabel", G2L["b"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["ZIndex"] = 1;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextScaled"] = true;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
G2L["c"]["Font"] = Enum.Font.Sarpanch;
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["BackgroundTransparency"] = .50;
---G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["c"]["Size"] = UDim2.new(0, 40, 0, 40);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[Show]];
G2L["c"]["TextSize"] = 14;
G2L["c"]["Name"] = [[info]];
G2L["c"]["Position"] = UDim2.new(0, 0, 0, 0);


-- StarterGui.Custom Inventory.openButton.info.UIStroke
G2L["d"] = Instance.new("UIStroke", G2L["c"]);
G2L["d1"] = Instance.new("UICorner", G2L["c"]);
G2L["d"]["LineJoinMode"] = Enum.LineJoinMode.Miter;
G2L["d"]["Thickness"] = 0;


-- StarterGui.Custom Inventory.InventoryController
G2L["e"] = Instance.new("LocalScript", G2L["1"]);
G2L["e"]["Name"] = [[InventoryController]];


-- StarterGui.Custom Inventory.InventoryController.SETTINGS
G2L["f"] = Instance.new("ModuleScript", G2L["e"]);
G2L["f"]["Name"] = [[SETTINGS]];


-- StarterGui.Custom Inventory.InventoryController.toolButton
G2L["10"] = Instance.new("ImageButton", G2L["e"]);
G2L["10"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["SliceCenter"] = Rect.new(5, 11, 942, 606);
G2L["10"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["10"]["AutoButtonColor"] = false;
G2L["10"]["BackgroundTransparency"] = .75;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
G2L["10"]["Size"] = UDim2.new(0, 0, 0, 0);
G2L["10"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["10"]["Name"] = [[toolButton]];
G2L["10"]["Position"] = UDim2.new(0.44899, 0, 0.40652, 0);


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolNumber
G2L["11"] = Instance.new("TextLabel", G2L["10"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["ZIndex"] = 2;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextTransparency"] = .50;
G2L["11"]["TextScaled"] = true;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["Size"] = UDim2.new(.4, 0, .4, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["11"]["Text"] = [[1]];
G2L["11"]["Name"] = [[toolNumber]];


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolName
G2L["12"] = Instance.new("TextLabel", G2L["10"]);
G2L["12"]["TextWrapped"] = true;
G2L["12"]["ZIndex"] = 3;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 16;
G2L["12"]["TextScaled"] = true;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["Font"] = Enum.Font.Sarpanch;
G2L["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["12"]["Size"] = UDim2.new(0.8, 0, 0.518, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["12"]["Text"] = [[N/A]];
G2L["12"]["Name"] = [[toolName]];
G2L["12"]["Position"] = UDim2.new(0.515, 0, 0.47079, 0);


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolName.UIStroke
G2L["13"] = Instance.new("UIStroke", G2L["12"]);
G2L["13"]["Thickness"] = 1;


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolName.UITextSizeConstraint
G2L["14"] = Instance.new("UITextSizeConstraint", G2L["12"]);
G2L["14"]["MaxTextSize"] = 20;
G2L["14"]["MinTextSize"] = 5;


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolAmount
G2L["15"] = Instance.new("TextLabel", G2L["10"]);
G2L["15"]["TextWrapped"] = true;
G2L["15"]["ZIndex"] = 3;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["TextSize"] = 14;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["Size"] = UDim2.new(1.13, 0, 0.17, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["15"]["Text"] = [[]];
G2L["15"]["Name"] = [[toolAmount]];
G2L["15"]["Position"] = UDim2.new(-0.065, 0, 0.725, 0);


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolAmount.UIStroke
G2L["16"] = Instance.new("UIStroke", G2L["15"]);
G2L["16"]["Thickness"] = 3;


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolIcon
G2L["17"] = Instance.new("ImageLabel", G2L["10"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["17"]["Image"] = [[rbxassetid://10202636594]];
G2L["17"]["Size"] = UDim2.new(0, 40, 0, 40);
G2L["17"]["Visible"] = false;
G2L["17"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Selectable"] = true;
G2L["17"]["Name"] = [[toolIcon]];
G2L["17"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.Custom Inventory.InventoryController.toolButton.toolIcon.UIAspectRatioConstraint
G2L["18"] = Instance.new("UIAspectRatioConstraint", G2L["17"]);



-- StarterGui.Custom Inventory.InventoryController.toolButton.UIStroke
G2L["19"] = Instance.new("UIStroke", G2L["10"]);
G2L["19"]["Thickness"] = 1;


-- StarterGui.Custom Inventory.InventoryController.toolButton.UICorner
G2L["1a"] = Instance.new("UICorner", G2L["10"]);


-- Require G2L wrapper
local G2L_REQUIRE = require;
local G2L_MODULES = {};
local function require(Module:ModuleScript)
local ModuleState = G2L_MODULES[Module];
if ModuleState then
if not ModuleState.Required then
ModuleState.Required = true;
ModuleState.Value = ModuleState.Closure();
end
return ModuleState.Value;
end;
return G2L_REQUIRE(Module);
end

G2L_MODULES[G2L["f"]] = {
Closure = function()
local script = G2L["f"];local module = {OBJECTS = {}, SETTINGS = {},
slotAmount = 4}
module.OBJECTS.HotBar = {}
module.OBJECTS.Inventory = {}

-- SETTINGS
local SETTINGS = module.SETTINGS
SETTINGS.DEFAULT_COLOR = Color3.fromRGB(0, 0, 0) -- ToolFrame background color when unequipped
SETTINGS.EQUIPPED_COLOR = Color3.fromRGB(100, 100, 100) -- ToolFrame background color when equipped
SETTINGS.DISABLED_COLOR = Color3.fromRGB(50, 50, 50) -- ToolFrame background color when the tool is disabled
SETTINGS.DEFAULT_IMAGEID = ""
SETTINGS.EQUIPPED_IMAGEID = ""
SETTINGS.DISABLED_IMAGEID = ""
SETTINGS.INVENTORY_KEYBIND = Enum.KeyCode.Backquote -- KeyCode to open the Inventory itself (set to nil to disable the Inventory or Backpack)
SETTINGS.DRAG_OUTSIDE_TO_DROP = false -- If set to true any tool you drag outside of the Inventory or HotBar will be dropped to the floor
SETTINGS.SHOW_EMPTY_TOOL_FRAMES_IN_HOTBAR = false -- If set to true it will display all the tool frames in the HotBar even if they are empty and the Inventory closed
SETTINGS.SCROLL_HOTBAR_WITH_WHEEL = false -- If set to true it will enable you to scroll the HotBar with the mouse wheel
SETTINGS.EQUIP_TOUCH_SENSITIVITY = 60 -- The limit of how much you can drag a tool before it dosent equips/unequips it when you release it
SETTINGS.OPEN_BUTTON = true
SETTINGS.ALWAYS_SHOW_TOOL_NAME = true





-- services
local ContextActionService = game:GetService("ContextActionService")
local TextService = game:GetService("TextService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

--// PLAYER
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local mouse = player:GetMouse()

--// INVENTORY_SYSTEM \\--
local inventoryGui = script.Parent.Parent
local hotbar = inventoryGui.hotBar
local inventoryFrame = inventoryGui.Inventory
local toolButton = script.Parent.toolButton

local EnumKeys = {
Enum.KeyCode.One,
Enum.KeyCode.Two,
Enum.KeyCode.Three,
Enum.KeyCode.Four,
Enum.KeyCode.Five,
Enum.KeyCode.Six,
Enum.KeyCode.Seven,
Enum.KeyCode.Eight,
Enum.KeyCode.Nine,
Enum.KeyCode.Zero,
}
-- tool object methods
local toolObjectMetatable = {}
toolObjectMetatable.__index = toolObjectMetatable

function toolObjectMetatable:isEquipped() -- Checks if the current object.Tool is equipped
local character = char

if character then
return self.Tool.Parent == player.Character
else
return false
end
end

function toolObjectMetatable:DisconnectAll() -- Makes a cleanup of connections and binds as well as deletes object.Frame
for _, v in pairs(self.CONNECTIONS) do
v:Disconnect()
end

self.didRemoval = true

if (inventoryFrame.Visible or module.SETTINGS.SHOW_EMPTY_TOOL_FRAMES_IN_HOTBAR) and self.Frame.Parent ~= inventoryGui and self.Frame.Parent ~= inventoryFrame.Frame then
local toolName = self.Frame:FindFirstChild("toolName")
local toolAmount = self.Frame:FindFirstChild("toolAmount")
local toolIcon = self.Frame:FindFirstChild("toolIcon")

if toolName and toolAmount and toolIcon then
toolName.Text = ""
toolAmount.Text = ""
toolIcon.Image = ""
end
self.Frame.BackgroundColor3 = SETTINGS.DEFAULT_COLOR
self.Frame.Image = SETTINGS.DEFAULT_IMAGEID
else
self.Frame:Destroy()
end

if self.Parent == "HotBar" and self.Position then
ContextActionService:UnbindAction(self.Position .. "hotBar")
module.OBJECTS.HotBar[self.Position] = nil
elseif self.Parent == "Inventory" then
module.OBJECTS.Inventory[self.Tool.Name] = nil
end
self = nil
end

function toolObjectMetatable:updateIcon() -- Updates the tool Texture
local tool = self.Tool
local frame = self.Frame
local textureId = tool.TextureId

if textureId == "" or textureId == nil then
frame.toolName.Visible = true
frame.toolIcon.Visible = false
frame.toolIcon.Image = ""
else
frame.toolName.Visible = SETTINGS.ALWAYS_SHOW_TOOL_NAME
frame.toolIcon.Visible = true
frame.toolIcon.Image = textureId
end
end

function toolObjectMetatable:getParentInstance()
return self.Parent == "Inventory" and inventoryFrame.Frame or hotbar
end

function toolObjectMetatable:showDescription() -- Shows the object.Tool.ToolTip
local toolDescription = self.Tool.ToolTip
local frame = self.Frame
if toolDescription == "" then
return
end

local descriptionFrame = Instance.new("TextLabel")
descriptionFrame.Name = "descriptionFrame"
descriptionFrame.AnchorPoint = Vector2.new(0.5, 0)
descriptionFrame.Font = Enum.Font.SourceSansSemibold
descriptionFrame.TextColor = BrickColor.Black()
descriptionFrame.TextSize = 14
descriptionFrame.BorderSizePixel = 0
descriptionFrame.BackgroundColor = BrickColor.White()
descriptionFrame.ZIndex = 99
descriptionFrame.TextWrapped = true
descriptionFrame.Parent = inventoryGui

local corner = Instance.new("UICorner")
corner.Parent = descriptionFrame
corner.CornerRadius = UDim.new(0.12, 0)

local textBounds = TextService:GetTextSize(toolDescription, descriptionFrame.TextSize, descriptionFrame.Font, Vector2.new(400, 1000)) + Vector2.new(10, 4)
descriptionFrame.Size = UDim2.new(0, textBounds.X, 0, textBounds.Y)
descriptionFrame.Position = UDim2.new(0, frame.AbsolutePosition.X + (frame.AbsoluteSize.X / 2), 0, frame.AbsolutePosition.Y - textBounds.Y - 2 + 57)
descriptionFrame.Text = toolDescription
self.DescriptionFrame = descriptionFrame
game:GetService("Debris"):AddItem(descriptionFrame, 15)
end

function toolObjectMetatable:removeDescription() -- Destroys the object.DescriptionFrame created by object:showDescription()
if self.DescriptionFrame then
self.DescriptionFrame:Destroy()
end
end

function module:removeCurrentDescription() -- Destroys any current active descriptionFrame
local descriptionFrame = inventoryGui:FindFirstChild("descriptionFrame")
if descriptionFrame then
descriptionFrame:Destroy()
end
end

function module:getObjectFromTool(tool: Tool) -- Returns the ToolObject of a Tool
local function searchToolObject(toolParent)
for _, toolObject in pairs(toolParent) do
if toolObject.Tool == tool then 
return toolObject 
end
end
end

return searchToolObject(self.OBJECTS.HotBar) or searchToolObject(self.OBJECTS.Inventory)
end

function module:getToolPosition(tool: Tool) -- Returns the tool position on the hotbar (if in inventory retuns nil)
local toolObject = self:getObjectFromTool(tool)
return toolObject and toolObject.Position
end

function module:searchTool() -- Handler for the tool search feature in the inventory
local toolName: string = inventoryFrame.SearchBox.Text
if toolName == "" then
for _, toolObject in pairs(self.OBJECTS["Inventory"]) do
toolObject.Frame.Visible = true
end
elseif toolName then
for _, toolObject in pairs(self.OBJECTS["Inventory"]) do
toolObject.Frame.Visible = string.find(toolObject.Name:lower(), toolName:lower()) and true or false
end
end
end

function module:lockSlots(unequipCurrentTool: boolean) -- Locks the slots so they cant be equipped or unequipped
self.slotsLocked = true

if unequipCurrentTool then
local character = char
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if humanoid then
humanoid:UnequipTools()
end
end
end
function module:unlockSlots() -- Unlocks the slots so they can be equipped and unequipped again
self.slotsLocked = false
end
function module:lockSlotsPosition() -- Locks the slots position so they cant be moved around
self.slotsPositionLocked = false
end
function module:unlockSlotsPosition() -- Unlocks the slots positions so they can be moved again
self.slotsPositionLocked = true
end

function module:newTool(tool: Tool)
if tool:GetAttribute("toolAdded") or not tool:IsA("Tool") then
return
end

local length = 0
for _, _ in pairs(module.OBJECTS.HotBar) do
length += 1
end

module:addTool(tool, length == self.slotAmount and "Inventory" or "HotBar", tool:GetAttribute("position"))
end

function module:addTool(tool: Tool, parent: string, position: number)
tool:SetAttribute("position", nil)
if position == -1 then
parent = "Inventory"
position = nil
end

if not position and parent == "HotBar" then
for index = 1, self.slotAmount do
if self.OBJECTS.HotBar[index] == nil then
position = index
break
end
end
end

if position and hotbar:FindFirstChild(position) then
hotbar:FindFirstChild(position):Destroy()
end

local frame = toolButton:Clone()
local amount = tool:GetAttribute("amount") or 1
if amount > 1 then
frame.toolAmount.Text = "x" .. amount
end
frame.toolName.Text = tool.Name
frame.Parent = parent == "Inventory" and inventoryFrame.Frame or hotbar
frame.Name = parent == "Inventory" and tool.Name or position
frame.toolNumber.Text = parent == "Inventory" and "" or position

local object = {}
setmetatable(object, toolObjectMetatable)

object.Tool = tool
object.Frame = frame
object.Parent = parent
object.Position = position
object.Name = tool.Name
self.OBJECTS[parent][position == nil and frame.Name or position] = object
local function manageTool(_, inputState, inputObject)
if inputObject and inputObject.UserInputType ~= Enum.UserInputType.Keyboard and inputObject.UserInputType ~= Enum.UserInputType.Touch then
return
end

local character = char
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
if
not humanoid
or humanoid.Health <= 0
or not tool.Parent
or inputState == Enum.UserInputState.End
or self.slotsLocked
then
return
end

if object:isEquipped() then -- if tool is equipped then unequip it
humanoid:UnequipTools()
frame.BackgroundColor3 = SETTINGS.DEFAULT_COLOR
frame.Image = SETTINGS.DEFAULT_IMAGEID
module.currentlyEquipped = nil
elseif tool.Enabled then -- if tool isnt equipped then equip it
humanoid:EquipTool(tool)
if module.currentlyEquipped and module.currentlyEquipped.Parent then
module.currentlyEquipped.BackgroundColor3 = SETTINGS.DEFAULT_COLOR
module.currentlyEquipped.Image = SETTINGS.DEFAULT_IMAGEID
end
module.currentlyEquipped = frame
frame.BackgroundColor3 = SETTINGS.EQUIPPED_COLOR
frame.Image = SETTINGS.EQUIPPED_IMAGEID
end
end

local function updateEquipped()
if object:isEquipped() and tool.Enabled then
if module.currentlyEquipped and module.currentlyEquipped.Parent then
module.currentlyEquipped.BackgroundColor3 = SETTINGS.DEFAULT_COLOR
module.currentlyEquipped.Image = SETTINGS.DEFAULT_IMAGEID
end
module.currentlyEquipped = frame
frame.BackgroundColor3 = SETTINGS.EQUIPPED_COLOR
frame.Image = SETTINGS.EQUIPPED_IMAGEID
else
frame.BackgroundColor3 = SETTINGS.DEFAULT_COLOR
frame.Image = SETTINGS.DEFAULT_IMAGEID
module.currentlyEquipped = nil
end
end

local function updateEnabled()
if tool.Enabled then
frame.Image = SETTINGS.DEFAULT_IMAGEID
frame.BackgroundColor3 = SETTINGS.DEFAULT_COLOR
frame.ImageTransparency = 0
frame.toolIcon.ImageTransparency = 0
frame.toolName.TextTransparency = 0
frame.toolNumber.TextTransparency = 0
frame.toolAmount.TextTransparency = 0

frame.toolAmount.UIStroke.Transparency = 0
--frame.toolNumber.Transparency = 0
frame.toolName.UIStroke.Transparency = 0
else
frame.Image = SETTINGS.DISABLED_IMAGEID
frame.BackgroundColor3 = SETTINGS.DISABLED_COLOR
frame.ImageTransparency = 0.35
frame.toolIcon.ImageTransparency = 0.5
frame.toolName.TextTransparency = 0.6
frame.toolNumber.TextTransparency = 0.6
frame.toolAmount.TextTransparency = 0.6

frame.toolAmount.UIStroke.Transparency = 0.6
--frame.toolNumber.Transparency = 0.6
frame.toolName.UIStroke.Transparency = 0.6
end
end
updateEnabled()
updateEquipped()
object:updateIcon()

--// CONNECTIONS
object.CONNECTIONS = {}
object.CONNECTIONS.EnabledConn = tool:GetPropertyChangedSignal("Enabled"):Connect(updateEnabled)
object.CONNECTIONS.ToolRemoved = tool.AncestryChanged:Connect(function(_, newParent)
if player and (newParent == nil or (newParent ~= player.Backpack and newParent ~= player.Character)) then
object:DisconnectAll()
tool:SetAttribute("toolAdded", false)
end
updateEquipped()
end)
object.CONNECTIONS.NameChanged = tool:GetPropertyChangedSignal("Name"):Connect(function()
frame.toolName.Text = tool.Name
object.Name = tool.Name
end)
object.CONNECTIONS.TextureIdChanged = tool:GetPropertyChangedSignal("TextureId"):Connect(function()
object:updateIcon()
end)
object.CONNECTIONS.AmountChanged = tool:GetAttributeChangedSignal("amount"):Connect(function()
amount = tool:GetAttribute("amount") or 1
if amount > 1 then
frame.toolAmount.Text = "x" .. amount
else
frame.toolAmount.Text = ""
end
end)
object.CONNECTIONS.MouseEnter = frame.MouseEnter:Connect(function()
if object.isGrabbed then
return
end
object:showDescription()
end)
object.CONNECTIONS.MouseLeave = frame.MouseLeave:Connect(function()
object:removeDescription()
end)
object.CONNECTIONS.GrabConn = frame.MouseButton1Down:Connect(function()
if self.slotsPositionLocked then
return
end

local mouseEnd
local mouseConn
local newFrame
local CellSize = inventoryFrame.Frame.Grid.CellSize
local frameStartPosition = frame.AbsolutePosition
object:removeDescription()

local function endGrab()
mouseEnd:Disconnect()
mouseConn:Disconnect()
object.isGrabbed = false

local droppedGuis = playerGui:GetGuiObjectsAtPosition(mouse.X, mouse.Y)
local wasSwapped = false
local dropTool = true
for _, newSlot in pairs(droppedGuis) do
if newSlot:IsA("ImageButton") and (newSlot.Parent == hotbar or newSlot.Parent == inventoryFrame.Frame) then
local newSlotObject = self.OBJECTS[newSlot.Parent == hotbar and "HotBar" or "Inventory"][newSlot.Parent == hotbar and tonumber(newSlot.Name) or newSlot.Name]
if newSlotObject == object then
dropTool = false
if newFrame then
newFrame:Destroy()
end
continue
end

if newSlotObject then -- Swap between tools
wasSwapped = true

object:DisconnectAll()
newSlotObject:DisconnectAll()

self:addTool(newSlotObject.Tool, parent, position)
self:addTool(tool, newSlotObject.Parent, newSlotObject.Position)

if newFrame then
newFrame:Destroy()
end
elseif newSlot.Parent == hotbar then -- Send to Hotbar
wasSwapped = true

object:DisconnectAll()
self:addTool(tool, "HotBar", tonumber(newSlot.Name))
if parent == "Inventory" and newFrame then
newFrame:Destroy()
end
newSlot:Destroy()
end

if newSlotObject then
newSlotObject:removeDescription()
end
if object then
object:removeDescription()
end
elseif newSlot:IsA("ImageLabel") and newSlot == inventoryFrame and not wasSwapped and parent == "HotBar" then -- Send to Inventory
wasSwapped = true
object:DisconnectAll()
self:addTool(tool, "Inventory")
self:searchTool()
break
end
end

if not wasSwapped then
if newFrame then
newFrame:Destroy()
end
frame.Parent = object:getParentInstance()

if SETTINGS.DRAG_OUTSIDE_TO_DROP and dropTool and tool.CanBeDropped then
local character = char
if character then
tool.Parent = character
end
end

if (frameStartPosition - Vector2.new(mouse.X, mouse.Y)).Magnitude <= SETTINGS.EQUIP_TOUCH_SENSITIVITY then
manageTool()
end
end
end
mouseEnd = UserInputService.InputEnded:Connect(function(inputObject)
if
inputObject.UserInputType == Enum.UserInputType.MouseButton1
or inputObject.UserInputType == Enum.UserInputType.Touch
then
endGrab()
end
end)

local function updateFramePos()
if not object.isGrabbed then
object.isGrabbed = true
newFrame = toolButton:Clone()
newFrame.toolName.Text = ""
newFrame.toolAmount.Text = ""
newFrame.toolNumber.Text = position or ""
newFrame.Name = frame.Name
newFrame.Size = frame.Size
newFrame.Parent = object:getParentInstance()

frame.Size = CellSize
frame.Parent = inventoryGui
end

local mousePos = Vector2.new(mouse.X, mouse.Y)
frame.Position = UDim2.new(0, mousePos.X - (CellSize.X.Offset / 2), 0, mousePos.Y - (CellSize.Y.Offset / 2) + 57)
end
mouseConn = mouse.Move:Connect(updateFramePos)
end)

tool:SetAttribute("toolAdded", true)
if parent == "HotBar" and position then
ContextActionService:BindAction(position .. "hotBar", manageTool, false, EnumKeys[position])
end
end

return module

end;
};
-- StarterGui.Custom Inventory.InventoryController
local function C_e()
local script = G2L["e"];
-- services
local StarterGui = game:GetService("StarterGui")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")

-- references
local player = game:GetService("Players").LocalPlayer
local backpack = player:WaitForChild("Backpack")
local camera = workspace.CurrentCamera

-- DISABLE BASIC ROBLOX HOTBAR
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)

local CustomInventoryGUI = script.Parent
local hotBar = CustomInventoryGUI.hotBar
local Inventory = CustomInventoryGUI.Inventory
local toolButton = script.toolButton

local inventoryHandler = require(script.SETTINGS)

local function showSlots()
for index = 1, inventoryHandler.slotAmount do
local toolObject = inventoryHandler.OBJECTS.HotBar[index]
if not toolObject and not hotBar:FindFirstChild(index) and index <= inventoryHandler.slotAmount then
local frame = toolButton:Clone()
frame.toolName.Text = ""
frame.toolAmount.Text = ""
frame.toolNumber.Text = index
frame.Name = index
frame.Parent = hotBar
end
end
end
local function removeEmptySlots()
for index = 1, 9 do
local toolObject = inventoryHandler.OBJECTS.HotBar[index]
local toolFrame = hotBar:FindFirstChild(index)
if not toolObject and toolFrame then
toolFrame:Destroy()
if hotBar:FindFirstChild(index) then
removeEmptySlots()
end
end
end
end

local function manageInventory (_, inputState)
if inputState == Enum.UserInputState.Begin then
Inventory.Visible = not Inventory.Visible
local currentState = Inventory.Visible

inventoryHandler:removeCurrentDescription()
if currentState then
showSlots()
CustomInventoryGUI.openButton.Position = UDim2.fromScale(.34,1.043)
CustomInventoryGUI.openButton.info.Text = "Hide"
else
if not inventoryHandler.SETTINGS.SHOW_EMPTY_TOOL_FRAMES_IN_HOTBAR then
removeEmptySlots()
end
CustomInventoryGUI.openButton.Position = UDim2.fromScale(.34,1.043)
CustomInventoryGUI.openButton.info.Text = "Show"
end
elseif not inputState then
for index = inventoryHandler.slotAmount + 1, inventoryHandler.slotAmount do
local toolObject = inventoryHandler.OBJECTS.HotBar[index]
local toolFrame = hotBar:FindFirstChild(index)
if toolObject then
local tool = toolObject.Tool
toolObject:DisconnectAll()
tool:SetAttribute("toolAdded", nil)
inventoryHandler:newTool(tool)
elseif toolFrame then
toolFrame:Destroy()
end
end
end
end

local function searchTool()
inventoryHandler:searchTool()
end
local function newTool(tool)
if tool:IsA("Tool") then
inventoryHandler:newTool(tool)
end
end

local function reloadInventory(character)
inventoryHandler.currentlyEquipped = nil
backpack = player:WaitForChild("Backpack")

for _, tool in pairs(backpack:GetChildren()) do
if tool:IsA("Tool") then
newTool(tool)
end
end
backpack.ChildAdded:Connect(newTool)
character.ChildAdded:Connect(newTool)
end
local function updateHudPosition()
local viewPortSize = camera.ViewportSize
local slotSize = UDim2.fromOffset(hotBar.AbsoluteSize.Y, hotBar.AbsoluteSize.Y)

Inventory.Frame.Grid.CellSize = slotSize
hotBar.Grid.CellSize = slotSize

manageInventory()
end

updateHudPosition(); updateHudPosition()
reloadInventory(player.Character or player.CharacterAdded:Wait())
camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateHudPosition)
player.CharacterAdded:Connect(reloadInventory)
Inventory.SearchBox:GetPropertyChangedSignal("Text"):Connect(searchTool)
if inventoryHandler.SETTINGS.SHOW_EMPTY_TOOL_FRAMES_IN_HOTBAR then showSlots() end
if inventoryHandler.SETTINGS.INVENTORY_KEYBIND then ContextActionService:BindAction("manageInventory", manageInventory, false, inventoryHandler.SETTINGS.INVENTORY_KEYBIND) end
if inventoryHandler.SETTINGS.OPEN_BUTTON then
CustomInventoryGUI.openButton.MouseButton1Down:Connect(function()
Inventory.Visible = not Inventory.Visible
local currentState = Inventory.Visible

inventoryHandler:removeCurrentDescription()
if currentState then
showSlots()
CustomInventoryGUI.openButton.Position = UDim2.fromScale(.34,1.043)
CustomInventoryGUI.openButton.info.Text = "Hide"
else
if not inventoryHandler.SETTINGS.SHOW_EMPTY_TOOL_FRAMES_IN_HOTBAR then
removeEmptySlots()
end
CustomInventoryGUI.openButton.Position = UDim2.fromScale(.34,1.043)
CustomInventoryGUI.openButton.info.Text = "Show"
end
end)
else
CustomInventoryGUI.openButton.Visible = false
end

local function getToolEquipped()
local character = char
return character and character:FindFirstChildOfClass("Tool")
end

UserInputService.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseWheel and inventoryHandler.SETTINGS.SCROLL_HOTBAR_WITH_WHEEL then
local direction = input.Position.Z
local character = char
local humanoid = character and character:FindFirstChildOfClass("Humanoid")

local toolEquipped = getToolEquipped()
local toolPosition = inventoryHandler:getToolPosition(toolEquipped) or 0

for i=toolPosition + direction, direction < 0 and 1 or inventoryHandler.slotAmount, direction do
local toolObject = inventoryHandler.OBJECTS.HotBar[i]
if toolObject and humanoid then
humanoid:EquipTool(toolObject.Tool)
break
end
end
end
end)
end;
task.spawn(C_e);

end










local lol = math.random(1,2)
local sprinting=false
local walkanim = is:LoadLocalAsset("rbxassetid://73688515498572") -- uuid. 130213485744288
local idleanim = is:LoadLocalAsset("rbxassetid://74204337812128") -- uuid. 136078657506707
local randompart = Instance.new("Part",game:GetService("RunService"))
local coolparticles = game:GetObjects("rbxassetid://87299663038091")[1].ParticleAttachment
coolparticles.Parent = randompart
local playbacktrack = true 
local script = Instance.new("LocalScript")
real = true

local mrandom=math.random
local playanother = false
local playing = false
local dancing = false
local sin=math.sin
local osclock=os.clock
local sine=1
local cos=math.cos
local change = 1
local rtrnv;
local c;
local tbl3;
local v;
local anim;
local count;
local hhhh;
local asdf;
local s;
local animid;
local plr;
local legitjustran = false
local loopsplaying=0 
local rst 
local lst
local rht 
local lht 
local nt 
local rjt
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local cframe;
local torso;
local rs;
local ls;
local rh;
local lh;
local n;
local rj;
local rsc0;
local lsc0;
local rhc0;
local lhc0;
local rjc0;
local nc02;
local gc0;
local orsc0;
local olsc0;
local orhc0;
local olhc0;
local orjc0;
local onc0;
local count2;
local maxcount2;
local walking = false
local idle = false
local RunService = game:GetService("RunService")
local hum=char:FindFirstChildOfClass("Humanoid")
local h=char.Head
local t=char.Torso
local hrp=char.HumanoidRootPart 
if char:FindFirstChild("Animate") then
char.Animate.Enabled = false
end
for i, v in pairs(hum:GetPlayingAnimationTracks()) do
v:Stop()
end
local function getnext(tbl, number)
local best = math.huge
local r
for t in pairs(tbl) do
local d = t - number
if d > 0 and d < best then
best = d
r = t
end
end
if not r then
for t in pairs(tbl) do
if not r or t < r then
r = t
end
end
end
return r
end

local function wait2(tim)
if tim<0.1 then
game:GetService("RunService").Heartbeat:Wait()
else
for i=1,tim*40 do
game:GetService("RunService").Heartbeat:Wait()
end
end
end
local function kftotbl(kf)
tbl3 = {}
for i,v in pairs(kf:GetDescendants()) do
if v:IsA("Pose") then
tbl3[string.sub(v.Name,1,1)..string.sub(v.Name,#v.Name,#v.Name)] = v.CFrame
end
end
return(tbl3)
end
local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local function functionToBind()
char.Humanoid:Move(Vector3.new(0,0,-1),false)
end
local script = Instance.new("Script")
ArtificialHB = Instance.new("BindableEvent",script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")
frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()
game:GetService("RunService").Heartbeat:Connect(function(s,p)
tf = tf + s
if tf >= frame then
if allowframeloss then
script.Heartbeat:Fire()
lastframe = tick()
else
for i = 1,math.floor(tf / frame) do
pcall(function()
script.Heartbeat:Fire()
end)
end
lastframe = tick()
end
if tossremainder then
tf = 0
else
tf = tf - frame * math.floor(tf / frame)
end
end
end)
function swait(num)
if num == 0 or num == nil then
ArtificialHB.Event:Wait()
else
for i = 0,num do
ArtificialHB.Event:Wait()
end
end
end
function fwait(seconds)
seconds = (seconds < 0.000001) and 0.000001 or seconds
local event = game:GetService("RunService").PreRender or game:GetService("RunService").Heartbeat

 local startTime = tick()
 while tick() - startTime < seconds do
 event:Wait()
 end
end
local function AnimModule()

local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")

local Floor = math.floor

local Animator = {}
local Playing = {}
local FadeOuts = {}

local function Ver(Model)
if Model and Model.Parent then
if not Playing[Model] then
Playing[Model] = {}
FadeOuts[Model] = {Amount = 0}
end
end
end

local function CheckFadeOut(Model, Animation)
local FadeOut = FadeOuts[Model]
if FadeOut.Amount > 0 then return end

local Keyframes = Animation.JointKeyframes

local FinalFrame = {}

for Joint, Poses in next, Keyframes do
FinalFrame[Joint] = Poses[#Poses]
end

FadeOut.EndFrame = FinalFrame
FadeOut.Animation = Animation
FadeOut.Start = os.clock()
end
local c=os.clock()
local function Play(self, FadeIn)
c=os.clock()
self.LastKeyframe = nil
self.TimePosition = 0
self.StartInternal = os.clock()
self.FadeIn = FadeIn
local I = Playing[self.Model]
for anim in pairs(I) do
if anim ~= self and anim:IsPlaying() then
if anim.Priority < self.Priority then
anim:Stop() -- override lower-priority animations
elseif anim.Priority > self.Priority then
return -- block playing if something higher is running
end
end
end

I[self] = true
FadeOuts[self.Model].Amount += 1
end

local function Stop(self)
local I = Playing[self.Model]
I[self] = nil
self.FadeIn = nil

local Model = self.Model
FadeOuts[Model].Amount = FadeOuts[Model].Amount - 1

CheckFadeOut(Model, self)
end

local function Resume(self)
if self.PauseInternal then
self.StartInternal = os.clock() - self.PauseInternal
end
local I = Playing[self.Model]
I[self] = true

local Model = self.Model
FadeOuts[Model].Amount = FadeOuts[Model].Amount + 1
end

local function Pause(self)
local TimeSince = os.clock() - self.StartInternal
self.PauseInternal = TimeSince
local I = Playing[self.Model]
I[self] = nil

local Model = self.Model
FadeOuts[Model].Amount = FadeOuts[Model].Amount - 1

CheckFadeOut(Model, self)
end

local function SetTime(self, Time)
self.StartInternal = os.clock() - Time
end

local function AdjustSpeed(self, NewSpeed)
self.StartInternal = os.clock() - ((os.clock() - self.StartInternal) * self.Speed)
self.Speed = NewSpeed
end

local function IsPlaying(self)
return Playing[self.Model][self]
end

function Animator:LoadSequence(Track, Model)
local Animation = {}
local Joints = {}
local Keyframes = {}

Ver(Model)

for _,Obj in next, Model:GetDescendants() do
if Obj:IsA("Motor6D") then
local P0 = Obj.Part0
local P1 = Obj.Part1
if not P0 or not P1 then continue end

local T = Joints[P0.Name]
if not T then
T = {}
Joints[P0.Name] = T
end

T[P1.Name] = Obj
end
end

local JointKeyframes = {}

local Keyframes = Track:GetKeyframes()
table.sort(Keyframes, function(a, b) return a.Time < b.Time end)

for _, SKeyframe in next, Keyframes do
local STime = SKeyframe.Time

for _,Pose in next, SKeyframe:GetDescendants() do
if not Pose:IsA("Pose") then continue end
if Pose.Weight == 0 then continue end
if Pose.Parent == SKeyframe then continue end

local P0Name = Pose.Parent.Name
local P1Name = Pose.Name


local IP0 = Joints[Pose.Parent.Name]
if not IP0 then continue end
local Joint = IP0[Pose.Name]
if not Joint then continue end

local JT = JointKeyframes[Joint]
if not JT then
JT = {}
JointKeyframes[Joint] = JT
end


local Style = Pose:GetAttribute("EasingStyle") or Pose.EasingStyle.Name
local Direction = Pose:GetAttribute("EasingDirection") or Pose.EasingDirection.Name
local Weight = Pose.Weight
local CF = Pose.CFrame

local Info = {EasingStyle = Style, EasingDirection = Direction, Weight = Weight, CFrame = CF}


JT[#JT+1] = {Time = STime, ["Info"] = Info, Name = SKeyframe.Name}

end
end

Animation.LastKeyframe = nil
Animation.TimeReached = Instance.new("BindableEvent")
Animation.TimePosition = 0
Animation.TimeLength = Keyframes[#Keyframes].Time
Animation.TimeScale = 1
Animation.GeneralWeight = 1
Animation.Play = Play
Animation.Stop = Stop
Animation.Resume = Resume
Animation.Pause = Pause
Animation.SetTime = SetTime
Animation.AdjustSpeed = AdjustSpeed
Animation.IsPlaying = IsPlaying
Animation.Model = Model
Animation.Looped = false
Animation.JointKeyframes = JointKeyframes
Animation.Keyframes = Keyframes
Animation.Speed = 1

Animation.Filter = {}
Animation.FilterType = "Blacklist"

Animation.StartInternal = os.clock()-os.clock()
Animation.PauseInternal = 0

local PriorityMap = {
Core = 0,
Idle = 1,
Movement = 2,
Action = 3,
Action2 = 4,
Action3 = 5,
Action4 = 6,
}

Animation.Priority = PriorityMap[Track.Priority.Name] or 0

return Animation
end

function Animator:LoadAnimation(Track, Model)
local Animation = {}
local Joints = {}

Ver(Model)

for _,Obj in next, Model:GetDescendants() do
if Obj:IsA("Motor6D") then
local P0 = Obj.Part0
local P1 = Obj.Part1
if not P0 or not P1 then continue end

local T = Joints[P0.Name]

if not T then
T = {}
Joints[P0.Name] = T
end

T[P1.Name] = Obj
end
end

local JointKeyframes = {}

for Num, SKeyframe in next, Track do
local STime = SKeyframe.Time
local Keyframe = SKeyframe.Keyframe


for P0Name,P0 in next, Keyframe do
for P1, Info in next, P0 do

local IP0 = Joints[P0Name]

if not IP0 then continue end
local Joint = IP0[P1]
if not Joint then continue end

local JT = JointKeyframes[Joint]

if not JT then
JT = {}
JointKeyframes[Joint] = JT
end

JT[#JT+1] = {Time = STime, ["Info"] = Info}
end
end
end


Animation.TimePosition = 0
Animation.TimeLength = Track[#Track].Time
Animation.TimeScale = 1
Animation.GeneralWeight = 1
Animation.Play = Play
Animation.Stop = Stop
Animation.Resume = Resume
Animation.Pause = Pause
Animation.SetTime = SetTime
Animation.AdjustSpeed = AdjustSpeed
Animation.IsPlaying = IsPlaying
Animation.Model = Model
Animation.Looped = false
Animation.JointKeyframes = JointKeyframes
Animation.Speed = 1

Animation.Filter = {}
Animation.FilterType = "Blacklist"

Animation.StartInternal = os.clock()-os.clock()
Animation.PauseInternal = 0

return Animation
end

local CF = CFrame.new()

local function GetPose(TimeSince, Poses, Joint)
for i = 1,#Poses do
local Keyframe = Poses[i]
local NextKeyframe = Poses[i+1]
local Time = Keyframe.Time

local JT = Joint.Transform

if TimeSince >= Time then
if NextKeyframe then
local NextTime = NextKeyframe.Time
if TimeSince < NextTime then
local Info1 = Keyframe.Info
local Info2 = NextKeyframe.Info


local CFA = CF:Lerp(Info1.CFrame, 1)
local CFB = CF:Lerp(Info2.CFrame, 1)

local Pose
local Alpha =tonumber(Numval.Value)
if Info2.EasingStyle == "Constant" then
Pose = CFA
else
Pose = CFA:Lerp(CFB, TS:GetValue(Alpha, Enum.EasingStyle[Info2.EasingStyle], Enum.EasingDirection[Info2.EasingDirection]))
end

return {Joint, Pose}
end
else
local Pose = JT:Lerp(Keyframe.Info.CFrame, 1)
return {Joint, Keyframe.Info.CFrame}
end
end
end
end



task.wait()

if RS:IsClient() then
RS.PostSimulation:Connect(function()
for Model, Animations in next, Playing do
for Animation,_ in next, Animations do
if not Model or not Model.Parent then
Playing[Model] = nil
FadeOuts[Model] = nil
Animation.FadeIn = nil
continue 
end
local dr4
local TimeSince = Animation.TimePosition
local Length = Animation.TimeLength
--print(UseSoundPos.Value)
if UseSoundPos.Value==true then
dr4 = musicSound.TimePosition
else
dr4 = (os.clock()-c ) * (Animation.Speed or 1) + 0
end
dr4=dr4%Length
--print(dr4)
Animation.TimePosition = dr4
if TimeSince > Length then
Animation.FadeIn = nil
if Animation.Looped then
TimeSince = TimeSince%Length
else
Animation.TimePosition = Length
Playing[Model][Animation] = nil
FadeOuts[Model].Amount = FadeOuts[Model].Amount - 1

CheckFadeOut(Model, Animation)
continue
end
elseif TimeSince < 0 and Animation.Speed < 0 then
if Animation.Looped then
TimeSince = Length
else
Animation.TimePosition = Length
Playing[Model][Animation] = nil

FadeOuts[Model].Amount = FadeOuts[Model].Amount - 1

CheckFadeOut(Model, Animation)
continue
end
end

local Filter = Animation.Filter
local Keyframes = Animation.JointKeyframes

local ToAnimate = {}
if Animation.FilterType == "Blacklist" then
for Joint, Poses in next, Keyframes do
if not Filter[Joint] then

ToAnimate[#ToAnimate+1] = GetPose(TimeSince, Poses, Joint, Animation)
end
end
else
for Joint, Poses in next, Keyframes do
if Filter[Joint] then
ToAnimate[#ToAnimate+1] = GetPose(TimeSince, Poses, Joint, Animation)
end
end
end

local FadeIn = Animation.FadeIn
for i = 1,#ToAnimate do

local Pose = ToAnimate[i]
local TCF = Pose[2]

if FadeIn and TimeSince < FadeIn then
TCF = Pose[1].Transform:Lerp(TCF, 1)
end
task.spawn(function()
game:GetService("RunService").Stepped:Wait()
if not Animation:IsPlaying() then return end

Pose[1].Transform = TCF
end)
end

for _, KF in pairs(Animation.Keyframes) do 
if KF.Name ~= "Keyframe" and math.abs(TimeSince - KF.Time) < .1 and Animation.LastKeyframe ~= KF then
Animation.TimeReached:Fire(KF)
--musicSound.TimePosition=0
Animation.LastKeyframe = KF
end
end

Animation.TimePosition = dr4
end
end
for Model, Data in next, FadeOuts do
if not Model or not Model.Parent then
Playing[Model] = nil
FadeOuts[Model] = nil

continue
end

if Data.Amount >0 then continue end
if not Data.Animation then continue end

local TimeSince = os.clock() - Data.Start
if TimeSince >= 0.2 then continue end

local EndFrame = Data.EndFrame
local Animation = Data.Animation
local Filter = Animation.Filter

task.spawn(function()
game:GetService("RunService").Stepped:Wait()
if Data.Amount>0 then return end

local ToAnimate = {}
if Animation.FilterType == "Blacklist" then
for Joint, Pose in next, EndFrame do
if not Filter[Joint] then

local Poses = {
{
Time = 0,
Info = {
EasingStyle = "Linear",
EasingDirection = "Out",
Weight = 1,
CFrame = Pose.Info.CFrame
}
},
{
Time = 0,
Info = {
EasingStyle = "Linear",
EasingDirection = "Out",
Weight = 1,
CFrame = Joint.Transform
}
}
}

local Pose = GetPose(TimeSince, Poses, Joint, Animation)
Pose[1].Transform = Pose[2]
end
end
else
for Joint, Pose in next, EndFrame do
if Filter[Joint] then

local Poses = {
{
Time = 0,
Info = {
EasingStyle = "Linear",
EasingDirection = "Out",
Weight = 1,
CFrame = Pose.Info.CFrame
}
},
{
Time = 0,
Info = {
EasingStyle = "Linear",
EasingDirection = "Out",
Weight = 1,
CFrame = Joint.Transform
}
}
}
local Pose = GetPose(TimeSince, Poses, Joint, Animation)
Pose[1].Transform = Pose[2]
end
end
end
end)
end
end)
end

function Animator:Destroy()
table.clear(Playing)
end

return Animator








end




local alreadyloaded = {}
local animmodule = AnimModule()
local animplayer = AnimModule()
local currentanim = nil
local iscurrentadance = nil
local function PlayAnim(name, loop, looptomuisc)
local ced=char or workspace[StringVal.Value]
local char=ced
StringVal:GetPropertyChangedSignal("Value"):Connect(function()
if ReanimateVer=="Emper" then return end
if StringVal.Value=="None!" then return end
char=workspace[StringVal.Value]
print("Found Char",StringVal.Value)
ced=char
char = ced
end)
if not (char and name) then 
warn("Missing char or name for playanim") 
return nil 
end
local aaa=tostring(name)
local anim
if typeof(aaa) == "Instance" then
anim = aaa
elseif type(aaa) == "string" and full:FindFirstChild(aaa) then
anim = full:FindFirstChild(aaa)
else
anim = full:FindFirstChild(aaa)
end
if anim then
if not alreadyloaded[char] then
alreadyloaded[char] = {}
end

local track = alreadyloaded[char][aaa]
if not track then
track = animmodule:LoadSequence(anim, char)
if not track then
warn("Failed to load animation track:", aaa)
return nil
end
alreadyloaded[char][aaa] = track
end

track.Looped = loop
track:Play(0)
UseSoundPos.Value=looptomuisc
return track 
end
return nil
end


local function playanim(name, loop,looptomuisc)
if looptomuisc==nil then looptomuisc=false end
UseSoundPos.Value=looptomuisc
local track = PlayAnim(name, loop,looptomuisc)
if track then
track.OnFinished = Instance.new("BindableEvent")

if track._finishedConnection then
track._finishedConnection:Disconnect()
end
if track._timeConnection then
track._timeConnection:Disconnect()
end

track._timeConnection = track.TimeReached.Event:Connect(function(keyframe)
end)

-- Monitor animation completion
track._finishedConnection = game:GetService("RunService").PostSimulation:Connect(function()
if not RUNNING then 
if track._finishedConnection then
track._finishedConnection:Disconnect()
end
return 
end
pcall(function()
if track.TimePosition >= track.TimeLength - 0.05 and track:IsPlaying() then
if not loop then
track:Stop()
if track.OnFinished then
track.OnFinished:Fire()
end
if track._finishedConnection then
track._finishedConnection:Disconnect()
end
if track._timeConnection then
track._timeConnection:Disconnect()
end
end
end
end)
end)
end
return track
end

local function StopAllAnimations()
for char, tracks in pairs(alreadyloaded) do
for name, track in pairs(tracks) do
if track and track:IsPlaying() then
track:Stop()
end
if track and track.OnFinished then
track.OnFinished:Destroy()
end
end
end
table.clear(alreadyloaded)
end

playbacktrack=true
local function stopanim()
StopAllAnimations()
 loopsplaying = math.max(0, loopsplaying - 1)
 local SavedTime = Playsound.TimePosition
 playanother = true 
 if dancing then
 Playsound.PlaybackSpeed = 1
 if playbacktrack == true then
 Playsound.Volume = 0
 Playsound:Stop()
 else 
 Playsound.Volume = 0
 Playsound:Stop()
 end
 end
 
 coolparticles.Parent = randompart
 pcall(function()
rst:Cancel()
rht:Cancel()
lht:Cancel()
lst:Cancel()
nt:Cancel()
rjt:Cancel()
 end)
 
 if dancing == true then 
 dancing = false
 idle = true 
 char.Humanoid:Move(Vector3.new(0,0,-.1),true)
 walking = false 
 wait(.065)
 
 if playbacktrack and not dancing then
 musicSound:Stop()
 musicSound.Volume=.75
 if Occasions=="Halloween" then
 Playsound.SoundId = DanceAsset("Halloween.mp3")
 end
 Playsound.TimePosition = SavedTime
 Playsound.Volume = .75
 Playsound:Play()
 end
 
 if walking == true and idle == false and char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother == true then 
 task.spawn(function()
 playanim(walkanim, true)
 end)
 end
 isAssetClean=true
for _,v in char:GetDescendants() do 
if v:GetAttribute("EmoteProp") then 
v:Destroy()
end
end
wait(.1)
isAssetClean=false
 end
end
if Occasions=="Halloween" then
Playsound.SoundId = DanceAsset("Halloween.mp3")
else
if lol==1 then 
Playsound.SoundId = DanceAsset("Lexapro Doesn't Work.mp3")
elseif lol==2 then 
Playsound.SoundId = DanceAsset("Slash.mp3")
end
end 
Playsound.TimePosition =0
Playsound.Volume = .75
Playsound:Play()

local isAssetClean=false
local States=nil
local ws=game.Workspace
--ws.CurrentCamera.CameraSubject=char:WaitForChild("Head")
function LoadTools()
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then
char=ws[game.Players.LocalPlayer.Name.."_Fake"]
end
for _,v in ipairs(TableOfDances) do 
if not RUNNING then break end
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local tool=Instance.new("Tool",backpack)
tool.Name=v.Name
tool.RequiresHandle=false
if Preload then
task.spawn(function()
if v.Name=="Takino" then 
if isfile and not isfile("Theo-Dancezzz-Musics/Takino.mp3") then
writefile("Theo-Dancezzz-Musics/Takino.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Takino.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Bomb Monkey" then
if isfile and not isfile("Theo-Dancezzz-Musics/Monkey.mp3") then
writefile("Theo-Dancezzz-Musics/Monkey.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Monkey.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Cry For Me" then
if isfile and not isfile("Theo-Dancezzz-Musics/Cry For Me.mp3") then
writefile("Theo-Dancezzz-Musics/Cry For Me.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Cry For Me.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Someone Ships" then
if isfile and not isfile("Theo-Dancezzz-Musics/Idk.mp3") then
writefile("Theo-Dancezzz-Musics/Idk.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Idk.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Idk.mp3")
elseif v.Name=="Funny" then
if isfile and not isfile("Theo-Dancezzz-Musics/Funny.mp3") then
writefile("Theo-Dancezzz-Musics/Funny.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Funny.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Funny.mp3")
elseif v.Name=="Retry Now" then
if isfile and not isfile("Theo-Dancezzz-Musics/RetryNow.mp3") then
writefile("Theo-Dancezzz-Musics/RetryNow.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryNow.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/RetryNow.mp3")
elseif v.Name=="Looping The Rooms 2" then
if isfile and not isfile("Theo-Dancezzz-Musics/Looping 2.mp3") then
writefile("Theo-Dancezzz-Musics/Looping 2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Looping 2.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Looping 2.mp3")
elseif v.Name=="Looping The Rooms 4" then
if isfile and not isfile("Theo-Dancezzz-Musics/Looping 2.mp3") then
writefile("Theo-Dancezzz-Musics/Looping 2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Looping 2.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Looping 2.mp3")
elseif v.Name=="Golden Dandelion" then
if isfile and not isfile("Theo-Dancezzz-Musics/TsSoGolden.mp3") then
writefile("Theo-Dancezzz-Musics/TsSoGolden.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/TsSoGolden.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/TsSoGolden.mp3")
elseif v.Name=="Skeleton" then
if isfile and not isfile("Theo-Dancezzz-Musics/Skellywarcry.mp3") then
writefile("Theo-Dancezzz-Musics/Skellywarcry.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Skellywarcry.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Skellywarcry.mp3")
elseif v.Name=="Microwave" then
if isfile and not isfile("Theo-Dancezzz-Musics/Microwave.mp3") then
writefile("Theo-Dancezzz-Musics/Microwave.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Microwave.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Microwave.mp3")
elseif v.Name=="Lil Buddy Was Sick" then
if isfile and not isfile("Theo-Dancezzz-Musics/Lilbuddy.mp3") then
writefile("Theo-Dancezzz-Musics/Lilbuddy.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Lilbuddy.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Lilbuddy.mp3")
elseif v.Name=="Funny 2" then
if isfile and not isfile("Theo-Dancezzz-Musics/Funny2.mp3") then
writefile("Theo-Dancezzz-Musics/Funny2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Funny2.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/Funny2.mp3")
elseif v.Name=="Very Hot" then
if isfile and not isfile("Theo-Dancezzz-Musics/ItBurns.mp3") then
writefile("Theo-Dancezzz-Musics/ItBurns.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/ItBurns.mp3?raw=true"))
end
elseif v.Name=="Chegou 3" then
if isfile and not isfile("Theo-Dancezzz-Musics/Chegou 3.mp3") then
writefile("Theo-Dancezzz-Musics/Chegou 3.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Chegou 3.mp3?raw=true"))
end
elseif v.Name=="Dia Delicia" then
if isfile and not isfile("Theo-Dancezzz-Musics/DiaDelicia.mp3") then
writefile("Theo-Dancezzz-Musics/DiaDelicia.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/DiaDelicia.mp3?raw=true"))
end
elseif v.Name=="Default Dance" then
if isfile and not isfile("Theo-Dancezzz-Musics/Fortnite.mp3") then
writefile("Theo-Dancezzz-Musics/Fortnite.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Fortnite.mp3?raw=true"))
end
--.SoundId = getcustomasset("Theo-Dancezzz-Musics/ItBurns.mp3")



elseif v.Name=="Rat 1" or v.Name=="Rat 2" or v.Name=="Rat 3" then
if isfile and not isfile("Theo-Dancezzz-Musics/matchmaker.mp3") then
writefile("Theo-Dancezzz-Musics/matchmaker.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/matchmaker.mp3?raw=true"))
end
if math.random(1,3)==2 then 

--.SoundId =getcustomasset("Theo-Dancezzz-Musics/matchmaker.mp3") 
else 
DanceAsset(v.Music)
end
else
DanceAsset(v.Music)
end
end)
task.spawn(function()
LoadDance(v.DanceName, v.Url)
end)
wait(.25)
end
tool.Equipped:Connect(function()
if dancing==false then 
stopanim()
dancing = true
Playsound.Volume=0
wait(.005)
char.Humanoid.WalkSpeed=v.WalkSpeed


task.spawn(function()
if v.Name=="Takino" then 
if isfile and not isfile("Theo-Dancezzz-Musics/Takino.mp3") then
writefile("Theo-Dancezzz-Musics/Takino.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Takino.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Bomb Monkey" then
if isfile and not isfile("Theo-Dancezzz-Musics/Monkey.mp3") then
writefile("Theo-Dancezzz-Musics/Monkey.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Monkey.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Cry For Me" then
if isfile and not isfile("Theo-Dancezzz-Musics/Cry For Me.mp3") then
writefile("Theo-Dancezzz-Musics/Cry For Me.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Cry For Me.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Someone Ships" then
if isfile and not isfile("Theo-Dancezzz-Musics/Idk.mp3") then
writefile("Theo-Dancezzz-Musics/Idk.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Idk.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Idk.mp3")
elseif v.Name=="Funny" then
if isfile and not isfile("Theo-Dancezzz-Musics/Funny.mp3") then
writefile("Theo-Dancezzz-Musics/Funny.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Funny.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Funny.mp3")
elseif v.Name=="Retry Now" then
if isfile and not isfile("Theo-Dancezzz-Musics/RetryNow.mp3") then
writefile("Theo-Dancezzz-Musics/RetryNow.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryNow.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/RetryNow.mp3")
elseif v.Name=="Looping The Rooms 2" then
if isfile and not isfile("Theo-Dancezzz-Musics/Looping 2.mp3") then
writefile("Theo-Dancezzz-Musics/Looping 2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Looping 2.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Looping 2.mp3")
elseif v.Name=="Looping The Rooms 4" then
if isfile and not isfile("Theo-Dancezzz-Musics/Looping 2.mp3") then
writefile("Theo-Dancezzz-Musics/Looping 2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Looping 2.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Looping 2.mp3")
elseif v.Name=="Golden Dandelion" then
if isfile and not isfile("Theo-Dancezzz-Musics/TsSoGolden.mp3") then
writefile("Theo-Dancezzz-Musics/TsSoGolden.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/TsSoGolden.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/TsSoGolden.mp3")
elseif v.Name=="Skeleton" then
if isfile and not isfile("Theo-Dancezzz-Musics/Skellywarcry.mp3") then
writefile("Theo-Dancezzz-Musics/Skellywarcry.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Skellywarcry.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Skellywarcry.mp3")
elseif v.Name=="Microwave" then
if isfile and not isfile("Theo-Dancezzz-Musics/Microwave.mp3") then
writefile("Theo-Dancezzz-Musics/Microwave.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Microwave.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Microwave.mp3")
elseif v.Name=="Lil Buddy Was Sick" then
if isfile and not isfile("Theo-Dancezzz-Musics/Lilbuddy.mp3") then
writefile("Theo-Dancezzz-Musics/Lilbuddy.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Lilbuddy.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Lilbuddy.mp3")
elseif v.Name=="Funny 2" then
if isfile and not isfile("Theo-Dancezzz-Musics/Funny2.mp3") then
writefile("Theo-Dancezzz-Musics/Funny2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Funny2.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Funny2.mp3")
elseif v.Name=="Very Hot" then
if isfile and not isfile("Theo-Dancezzz-Musics/ItBurns.mp3") then
writefile("Theo-Dancezzz-Musics/ItBurns.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/ItBurns.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/ItBurns.mp3")
elseif v.Name=="Chegou 3" then
if isfile and not isfile("Theo-Dancezzz-Musics/Chegou 3.mp3") then
writefile("Theo-Dancezzz-Musics/Chegou 3.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Chegou 3.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Chegou 3.mp3")
elseif v.Name=="Dia Delicia" then
if isfile and not isfile("Theo-Dancezzz-Musics/DiaDelicia.mp3") then
writefile("Theo-Dancezzz-Musics/DiaDelicia.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/DiaDelicia.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/DiaDelicia.mp3")
elseif v.Name=="Default Dance" then
if isfile and not isfile("Theo-Dancezzz-Musics/Fortnite.mp3") then
writefile("Theo-Dancezzz-Musics/Fortnite.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Fortnite.mp3?raw=true"))
end
--musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/DiaDelicia.mp3")
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Fortnite.mp3")

elseif v.Name=="Rat 1" or v.Name=="Rat 2" or v.Name=="Rat 3" then
if isfile and not isfile("Theo-Dancezzz-Musics/matchmaker.mp3") then
writefile("Theo-Dancezzz-Musics/matchmaker.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/matchmaker.mp3?raw=true"))
end
if math.random(1,3)==2 then 

musicSound.SoundId =getcustomasset("Theo-Dancezzz-Musics/matchmaker.mp3") 
else 
musicSound.SoundId = DanceAsset(v.Music)
end
else
musicSound.SoundId = DanceAsset(v.Music)
end


if v.Offset==0 then
musicSound.TimePosition=0
else 
musicSound.TimePosition=v.Offset
end
end)
if v.Name=="Someone Ships" then 
repeat wait() until not isAssetClean
function Someone_Ships()
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local v2=Vector2.new
local nr=NumberRange.new
local cf=CFrame.new
local angles=CFrame.Angles
local u2=UDim2.new
local Kasane_Teto_1=i("MeshPart", char)
Kasane_Teto_1.Name="Kasane_Teto"
Kasane_Teto_1:SetAttribute("EmoteProp", true)
Kasane_Teto_1.MeshId="rbxassetid://114643462421615"
Kasane_Teto_1.Anchored=false
Kasane_Teto_1.CanCollide=false
Kasane_Teto_1.CanQuery=false
Kasane_Teto_1.CanTouch=true
Kasane_Teto_1.Transparency=0
Kasane_Teto_1.Reflectance=0
Kasane_Teto_1.Color=c3(0.639216,0.635294,0.647059)
Kasane_Teto_1.Material=Enum.Material.Plastic
Kasane_Teto_1.Size=v3(.15,.15,0.079889)
Kasane_Teto_1.CastShadow=true
Kasane_Teto_1.Massless=true
Kasane_Teto_1.Material=Enum.Material.Plastic
Kasane_Teto_1.TextureID="rbxassetid://110660519010921"
Kasane_Teto_1.DoubleSided=false
Kasane_Teto_1.CollisionFidelity=Enum.CollisionFidelity.Default
Kasane_Teto_1.RenderFidelity=Enum.RenderFidelity.Automatic

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Kasane_Teto"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Kasane_Teto_1
H.Part0=char["HumanoidRootPart"]

local Stand_2=i("MeshPart", Kasane_Teto_1)
Stand_2.Name="Stand"
Stand_2:SetAttribute("EmoteProp", true)
Stand_2.MeshId="rbxassetid://85753545216631"
Stand_2.Anchored=false
Stand_2.CanCollide=false
Stand_2.CanQuery=false
Stand_2.CanTouch=true
Stand_2.Transparency=0
Stand_2.Reflectance=0
Stand_2.Color=c3(0.639216,0.635294,0.647059)
Stand_2.Material=Enum.Material.Plastic
Stand_2.Size=v3(.114,.2,.167)
Stand_2.Position=v3(0,0,1.1)
Stand_2.CastShadow=true
Stand_2.Massless=true
Stand_2.Material=Enum.Material.Plastic
Stand_2.TextureID="rbxassetid://110660519010921"
Stand_2.DoubleSided=false
Stand_2.CollisionFidelity=Enum.CollisionFidelity.Default
Stand_2.RenderFidelity=Enum.RenderFidelity.Automatic



local Stand_3=i("Motor6D", Kasane_Teto_1)
Stand_3.Name="Stand"
Stand_3:SetAttribute("EmoteProp", true)
Stand_3.Enabled=true
Stand_3.C0=cf(0.09758377075195312,-0.7425305843353271,1.1,1,0,0,0,1,0,0,0,1)
Stand_3.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Stand_3.Part0=Kasane_Teto_1
Stand_3.Part1=Stand_2



local ishipu2_4=i("Part", char)
ishipu2_4.Name="ishipu2"
ishipu2_4:SetAttribute("EmoteProp", true)
ishipu2_4.Anchored=false
ishipu2_4.CanCollide=false
ishipu2_4.CanQuery=false
ishipu2_4.CanTouch=true
ishipu2_4.Transparency=1
ishipu2_4.Reflectance=0
ishipu2_4.Color=c3(0.639216,0.635294,0.647059)
ishipu2_4.Material=Enum.Material.Plastic
ishipu2_4.Size=v3(0.100000,0.100000,0.100000)
ishipu2_4.CastShadow=true
ishipu2_4.Massless=true

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="ishipu2"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=ishipu2_4
H.Part0=char["HumanoidRootPart"]

local BillboardGui_5=i("BillboardGui", ishipu2_4)
BillboardGui_5.Name="BillboardGui"
BillboardGui_5:SetAttribute("EmoteProp", true)
BillboardGui_5.Size=u2(2,0,1,0)
BillboardGui_5.StudsOffsetWorldSpace=v3(0.000000,0.000000,0.000000)
BillboardGui_5.StudsOffset=v3(0.000000,0.000000,0.000000)
BillboardGui_5.Brightness=1



local text_6=i("TextLabel", BillboardGui_5)
text_6.Name="text"
text_6:SetAttribute("EmoteProp", true)
text_6.BackgroundColor3=c3(1.000000,1.000000,1.000000)
text_6.BackgroundTransparency=1
text_6.Size=u2(1,0,1,0)
text_6.Position=u2(0,0,0,0)
text_6.Rotation=0
text_6.ZIndex=1
text_6.Font=Enum.Font.Unknown
text_6.FontSize=Enum.FontSize.Size11
text_6.TextColor3=c3(0.000000,0.000000,0.000000)
text_6.Text="I ship u 2 hahaha"
text_6.TextSize=11
text_6.TextDirection=Enum.TextDirection.Auto
text_6.TextStrokeColor3=c3(0.000000,0.000000,0.000000)
--text_6.FontFace=nil
text_6.TextXAlignment=Enum.TextXAlignment.Center
text_6.TextYAlignment=Enum.TextYAlignment.Center
text_6.AutomaticSize=Enum.AutomaticSize.None



local UICorner_7=i("UICorner", text_6)
UICorner_7.Name="UICorner"
UICorner_7:SetAttribute("EmoteProp", true)



local Wall_8=i("Part", char)
Wall_8.Name="Wall"
Wall_8:SetAttribute("EmoteProp", true)
Wall_8.Anchored=false
Wall_8.CanCollide=false
Wall_8.CanQuery=false
Wall_8.CanTouch=true
Wall_8.Transparency=0
Wall_8.Reflectance=0
Wall_8.Color=c3(0.223529,0.223529,0.223529)
Wall_8.Material=Enum.Material.Brick
Wall_8.Size=v3(1.000000,7.387255,7.884164)
Wall_8.CastShadow=false
Wall_8.Massless=true

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Wall"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Wall_8
H.Part0=char["HumanoidRootPart"]

local Guy_9=i("Part", char)
Guy_9.Name="Guy"
Guy_9:SetAttribute("EmoteProp", true)
Guy_9.Anchored=false
Guy_9.CanCollide=false
Guy_9.CanQuery=false
Guy_9.CanTouch=true
Guy_9.Transparency=1
Guy_9.Reflectance=0
Guy_9.Color=c3(0.639216,0.635294,0.647059)
Guy_9.Material=Enum.Material.Plastic
Guy_9.Size=v3(2.000000,2.000000,1.000000)
Guy_9.CastShadow=true
Guy_9.Massless=true



local Head_10=i("Part", Guy_9)
Head_10.Name="Head"
Head_10:SetAttribute("EmoteProp", true)
Head_10.Anchored=false
Head_10.CanCollide=false
Head_10.CanQuery=false
Head_10.CanTouch=true
Head_10.Transparency=0
Head_10.Reflectance=0
Head_10.Color=c3(0.639216,0.635294,0.647059)
Head_10.Material=Enum.Material.SmoothPlastic
Head_10.Size=v3(2.000000,1.000000,1.000000)
Head_10.Position=v3(0,1.5,0)
Head_10.CastShadow=true
Head_10.Massless=true



local Mesh_11=i("SpecialMesh", Head_10)
Mesh_11.Name="Mesh"
Mesh_11:SetAttribute("EmoteProp", true)
Mesh_11.MeshType=Enum.MeshType.Head
Mesh_11.MeshId=""
Mesh_11.TextureId=""
Mesh_11.Scale=v3(1.250000,1.250000,1.250000)
Mesh_11.Offset=v3(0.000000,0.000000,0.000000)
Mesh_11.VertexColor=v3(1.000000,1.000000,1.000000)



local face_12=i("Decal", Head_10)
face_12.Name="face"
face_12:SetAttribute("EmoteProp", true)
face_12.Texture="rbxasset://textures/face.png"
face_12.Transparency=0
face_12.Color3=c3(1.000000,1.000000,1.000000)



local LeftArm_13=i("Part", Guy_9)
LeftArm_13.Name="Left Arm"
LeftArm_13:SetAttribute("EmoteProp", true)
LeftArm_13.Anchored=false
LeftArm_13.CanCollide=false
LeftArm_13.CanQuery=false
LeftArm_13.CanTouch=true
LeftArm_13.Transparency=0
LeftArm_13.Reflectance=0
LeftArm_13.Color=c3(0.639216,0.635294,0.647059)
LeftArm_13.Material=Enum.Material.SmoothPlastic
LeftArm_13.Size=v3(1.000000,2.000000,1.000000)
LeftArm_13.Position=v3(-1.5,0,0)
LeftArm_13.CastShadow=true
LeftArm_13.Massless=true



local leftarm_14=i("SpecialMesh", LeftArm_13)
leftarm_14.Name="leftarm"
leftarm_14:SetAttribute("EmoteProp", true)
leftarm_14.MeshType=Enum.MeshType.FileMesh
leftarm_14.MeshId="rbxasset://fonts/leftarm.mesh"
leftarm_14.TextureId=""
leftarm_14.Scale=v3(1.000000,1.000000,1.000000)
leftarm_14.Offset=v3(0.000000,0.000000,0.000000)
leftarm_14.VertexColor=v3(1.000000,1.000000,1.000000)



local LeftLeg_15=i("Part", Guy_9)
LeftLeg_15.Name="Left Leg"
LeftLeg_15:SetAttribute("EmoteProp", true)
LeftLeg_15.Anchored=false
LeftLeg_15.CanCollide=false
LeftLeg_15.CanQuery=false
LeftLeg_15.CanTouch=true
LeftLeg_15.Transparency=0
LeftLeg_15.Reflectance=0
LeftLeg_15.Color=c3(0.105882,0.164706,0.207843)
LeftLeg_15.Material=Enum.Material.SmoothPlastic
LeftLeg_15.Size=v3(1.000000,2.000000,1.000000)
LeftLeg_15.Position=v3(-.5,-2.000000,0)
LeftLeg_15.CastShadow=true
LeftLeg_15.Massless=true



local leftleg_16=i("SpecialMesh", LeftLeg_15)
leftleg_16.Name="leftleg"
leftleg_16:SetAttribute("EmoteProp", true)
leftleg_16.MeshType=Enum.MeshType.FileMesh
leftleg_16.MeshId="rbxasset://fonts//leftleg.mesh"
leftleg_16.TextureId=""
leftleg_16.Scale=v3(1.000000,1.000000,1.000000)
leftleg_16.Offset=v3(0.000000,0.000000,0.000000)
leftleg_16.VertexColor=v3(1.000000,1.000000,1.000000)



local RightArm_17=i("Part", Guy_9)
RightArm_17.Name="Right Arm"
RightArm_17:SetAttribute("EmoteProp", true)
RightArm_17.Anchored=false
RightArm_17.CanCollide=false
RightArm_17.CanQuery=false
RightArm_17.CanTouch=true
RightArm_17.Transparency=0
RightArm_17.Reflectance=0
RightArm_17.Color=c3(0.639216,0.635294,0.647059)
RightArm_17.Material=Enum.Material.SmoothPlastic
RightArm_17.Size=v3(1.000000,2.000000,1.000000)
RightArm_17.Position=v3(1.5,0,0)
RightArm_17.CastShadow=true
RightArm_17.Massless=true



local rightarm_18=i("SpecialMesh", RightArm_17)
rightarm_18.Name="rightarm"
rightarm_18:SetAttribute("EmoteProp", true)
rightarm_18.MeshType=Enum.MeshType.FileMesh
rightarm_18.MeshId="rbxasset://fonts/rightarm.mesh"
rightarm_18.TextureId=""
rightarm_18.Scale=v3(1.000000,1.000000,1.000000)
rightarm_18.Offset=v3(0.000000,0.000000,0.000000)
rightarm_18.VertexColor=v3(1.000000,1.000000,1.000000)



local RightLeg_19=i("Part", Guy_9)
RightLeg_19.Name="Right Leg"
RightLeg_19:SetAttribute("EmoteProp", true)
RightLeg_19.Anchored=false
RightLeg_19.CanCollide=false
RightLeg_19.CanQuery=false
RightLeg_19.CanTouch=true
RightLeg_19.Transparency=0
RightLeg_19.Reflectance=0
RightLeg_19.Color=c3(0.105882,0.164706,0.207843)
RightLeg_19.Material=Enum.Material.SmoothPlastic
RightLeg_19.Size=v3(1.000000,2.000000,1.000000)
RightLeg_19.Position=v3(.5,-2.000000,0)
RightLeg_19.CastShadow=true
RightLeg_19.Massless=true



local rightleg_20=i("SpecialMesh", RightLeg_19)
rightleg_20.Name="rightleg"
rightleg_20:SetAttribute("EmoteProp", true)
rightleg_20.MeshType=Enum.MeshType.FileMesh
rightleg_20.MeshId="rbxasset://fonts//rightleg.mesh"
rightleg_20.TextureId=""
rightleg_20.Scale=v3(1.000000,1.000000,1.000000)
rightleg_20.Offset=v3(0.000000,0.000000,0.000000)
rightleg_20.VertexColor=v3(1.000000,1.000000,1.000000)



local Torso_21=i("Part", Guy_9)
Torso_21.Name="Torso"
Torso_21:SetAttribute("EmoteProp", true)
Torso_21.Anchored=false
Torso_21.CanCollide=false
Torso_21.CanQuery=false
Torso_21.CanTouch=true
Torso_21.Transparency=0
Torso_21.Reflectance=0
Torso_21.Color=c3(0.388235,0.372549,0.384314)
Torso_21.Material=Enum.Material.SmoothPlastic
Torso_21.Size=v3(2.000000,2.000000,1.000000)
Torso_21.CastShadow=true
Torso_21.Massless=true



local torso_22=i("SpecialMesh", Torso_21)
torso_22.Name="torso"
torso_22:SetAttribute("EmoteProp", true)
torso_22.MeshType=Enum.MeshType.FileMesh
torso_22.MeshId="rbxasset://fonts//torso.mesh"
torso_22.TextureId=""
torso_22.Scale=v3(1.000000,1.000000,1.000000)
torso_22.Offset=v3(0.000000,0.000000,0.000000)
torso_22.VertexColor=v3(1.000000,1.000000,1.000000)



local Torso_23=i("Motor6D", Guy_9)
Torso_23.Name="Torso"
Torso_23:SetAttribute("EmoteProp", true)
Torso_23.Enabled=true
Torso_23.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Torso_23.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Torso_23.Part0=Guy_9
Torso_23.Part1=Torso_21



local RightLeg_24=i("Motor6D", Guy_9)
RightLeg_24.Name="Right Leg"
RightLeg_24:SetAttribute("EmoteProp", true)
RightLeg_24.Enabled=true
RightLeg_24.C0=cf(0.5,-2,0,1,0,0,0,1,0,0,0,1)
RightLeg_24.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
RightLeg_24.Part0=Guy_9
RightLeg_24.Part1=RightLeg_19



local RightArm_25=i("Motor6D", Guy_9)
RightArm_25.Name="Right Arm"
RightArm_25:SetAttribute("EmoteProp", true)
RightArm_25.Enabled=true
RightArm_25.C0=cf(1.5,0,0,1,0,0,0,1,0,0,0,1)
RightArm_25.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
RightArm_25.Part0=Guy_9
RightArm_25.Part1=RightArm_17



local LeftLeg_26=i("Motor6D", Guy_9)
LeftLeg_26.Name="Left Leg"
LeftLeg_26:SetAttribute("EmoteProp", true)
LeftLeg_26.Enabled=true
LeftLeg_26.C0=cf(-0.5,-2,0,1,0,0,0,1,0,0,0,1)
LeftLeg_26.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
LeftLeg_26.Part0=Guy_9
LeftLeg_26.Part1=LeftLeg_15



local LeftArm_27=i("Motor6D", Guy_9)
LeftArm_27.Name="Left Arm"
LeftArm_27:SetAttribute("EmoteProp", true)
LeftArm_27.Enabled=true
LeftArm_27.C0=cf(-1.5,0,0,1,0,0,0,1,0,0,0,1)
LeftArm_27.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
LeftArm_27.Part0=Guy_9
LeftArm_27.Part1=LeftArm_13



local Head_28=i("Motor6D", Guy_9)
Head_28.Name="Head"
Head_28:SetAttribute("EmoteProp", true)
Head_28.Enabled=true
Head_28.C0=cf(0,1.5,0,1,0,0,0,1,0,0,0,1)
Head_28.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Head_28.Part0=Guy_9
Head_28.Part1=Head_10

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Guy"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Guy_9
H.Part0=char["HumanoidRootPart"]



local Talking_29=i("Part", char)
Talking_29.Name="Talking"
Talking_29:SetAttribute("EmoteProp", true)
Talking_29.Anchored=false
Talking_29.CanCollide=false
Talking_29.CanQuery=false
Talking_29.CanTouch=true
Talking_29.Transparency=1
--Talking_29.BackgroundTransparency=1
Talking_29.Reflectance=0
Talking_29.Color=c3(0.639216,0.635294,0.647059)
Talking_29.Material=Enum.Material.Plastic
Talking_29.Size=v3(0.100000,0.100000,0.100000)
Talking_29.CastShadow=true
Talking_29.Massless=true



local BillboardGui_30=i("BillboardGui", Talking_29)
BillboardGui_30.Name="BillboardGui"
BillboardGui_30:SetAttribute("EmoteProp", true)
BillboardGui_30.Size=u2(1,5,1,0)
BillboardGui_30.StudsOffsetWorldSpace=v3(0.000000,0.000000,0.000000)
BillboardGui_30.StudsOffset=v3(0.000000,0.000000,0.000000)
BillboardGui_30.Brightness=1



local TextLabel_31=i("TextLabel", BillboardGui_30)
TextLabel_31.Name="TextLabel"
TextLabel_31:SetAttribute("EmoteProp", true)
TextLabel_31.BackgroundColor3=c3(1.000000,1.000000,1.000000)
TextLabel_31.BackgroundColor3=c3(1.000000,1.000000,1.000000)
TextLabel_31.Size=u2(1,0,1,0)
TextLabel_31.Position=u2(0,0,0,0)
TextLabel_31.Rotation=0
TextLabel_31.ZIndex=1
TextLabel_31.BackgroundTransparency=1
TextLabel_31.Font=Enum.Font.Unknown
TextLabel_31.FontSize=Enum.FontSize.Size11
TextLabel_31.TextColor3=c3(0.000000,0.000000,0.000000)
TextLabel_31.Text="*Talking*"
TextLabel_31.TextSize=11
TextLabel_31.TextDirection=Enum.TextDirection.Auto
TextLabel_31.TextStrokeColor3=c3(0.000000,0.000000,0.000000)
--TextLabel_31.FontFace=nil
TextLabel_31.TextXAlignment=Enum.TextXAlignment.Center
TextLabel_31.TextYAlignment=Enum.TextYAlignment.Center
TextLabel_31.AutomaticSize=Enum.AutomaticSize.None

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Talking"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Talking_29
H.Part0=char["HumanoidRootPart"]


local Main_32=i("Part", char)
Main_32.Name="Main"
Main_32:SetAttribute("EmoteProp", true)
Main_32.Anchored=false
Main_32.CanCollide=false
Main_32.CanQuery=false
Main_32.CanTouch=true
Main_32.Transparency=1
Main_32.Reflectance=0
Main_32.Color=c3(0.639216,0.635294,0.647059)
Main_32.Material=Enum.Material.Plastic
Main_32.Size=v3(0.100000,0.100000,0.100000)
Main_32.CastShadow=true
Main_32.Massless=true

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Main"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Main_32
H.Part0=char["HumanoidRootPart"]

local BillboardGui_33=i("BillboardGui", Main_32)
BillboardGui_33.Name="BillboardGui"
BillboardGui_33:SetAttribute("EmoteProp", true)
BillboardGui_33.Size=u2(3,5,1,0)
BillboardGui_33.StudsOffsetWorldSpace=v3(0.000000,0.000000,0.000000)
BillboardGui_33.StudsOffset=v3(0.000000,0.000000,0.000000)
BillboardGui_33.Brightness=1



local pov_34=i("TextLabel", BillboardGui_33)
pov_34.Name="pov"
pov_34:SetAttribute("EmoteProp", true)
pov_34.BackgroundColor3=c3(1.000000,1.000000,1.000000)
pov_34.BackgroundColor3=c3(1.000000,1.000000,1.000000)
pov_34.Size=u2(1,0,1,0)
pov_34.Position=u2(0,0,0,0)
pov_34.Rotation=0
pov_34.ZIndex=1
pov_34.BackgroundTransparency=1
pov_34.Font=Enum.Font.Unknown
pov_34.FontSize=Enum.FontSize.Size11
pov_34.TextColor3=c3(1.000000,1.000000,1.000000)
pov_34.Text="Pov: Someone ships you with a boy"
pov_34.TextSize=11
pov_34.TextDirection=Enum.TextDirection.Auto
pov_34.TextStrokeColor3=c3(0.000000,0.000000,0.000000)
--pov_34.FontFace=nil
pov_34.TextXAlignment=Enum.TextXAlignment.Center
pov_34.TextYAlignment=Enum.TextYAlignment.Center
pov_34.AutomaticSize=Enum.AutomaticSize.None



local UIStroke_35=i("UIStroke", pov_34)
UIStroke_35.Name="UIStroke"
UIStroke_35:SetAttribute("EmoteProp", true)



end
Someone_Ships()
wait(.2)
end
Numval.Value=tonumber(v.Alpha)


if v.DanceName~="None" and v.Url~="None" and v.Id=="None" then
if v.Looped==false then 
if v.Name=="Retry Now" then
if isfile and not isfile("Theo-Dancezzz-Musics/RetryIntro.mp3") then
writefile("Theo-Dancezzz-Musics/RetryIntro.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryIntro.mp3?raw=true"))
end
if isfile and not isfile("Theo-Dancezzz-Musics/RetryNow.mp3") then
writefile("Theo-Dancezzz-Musics/RetryNow.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryNow.mp3?raw=true"))
end

local dance = LoadDance(v.DanceName, v.Url)
musicSound.SoundId=getcustomasset("Theo-Dancezzz-Musics/RetryIntro.mp3")
musicSound:Play()
local dance2 = LoadDance("Retry2", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Retry2.lua")
if dance then
local currentTrack = playanim(dance,false,false)
if currentTrack and currentTrack.OnFinished then
currentTrack.OnFinished.Event:Connect(function()
if dance2 then
playanim(dance2,true,true)
musicSound:Stop()
musicSound.SoundId=getcustomasset("Theo-Dancezzz-Musics/RetryNow.mp3")
musicSound:Play()
end
end)
end
end
end
else
local dance = LoadDance(v.DanceName, v.Url)
if dance then
if v.Name=="Someone Ships" then wait(.2) end
playanim(dance,true,v.UseSoundPos)
end
end
else
playanim(v.Id,true,v.UseSoundPos)
end


pcall(function()
if v.Name~="Retry Now" then
if getcustomasset("Theo-Dancezzz-Musics/"..v.Music) then
musicSound:Play()
else
warn("Audio Is Downloading")
end
end
end)
else
stopanim()
end
end)
tool.Unequipped:Connect(function()
char.Humanoid.WalkSpeed = 14
stopanim()
end)
end
 







pcall(function()
States=char.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
if char.Humanoid.Sit == false then 
if char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and idle == false then
walking = false
idle = true
stopanim()
fwait(1/500)
if idle == true and walking == false and char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and playanother==true then
 local dance=LoadDance("Idle2", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Idle2.lua")
if dance then
playanim(dance,true)
end
end
elseif char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and walking == false then 
char.Humanoid.WalkSpeed = 14*char:GetScale()
walking = true
idle = false
stopanim()
fwait(1/500)
if sprinting == false then
char.Humanoid.WalkSpeed = 14*char:GetScale()
if walking == true and idle == false and char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true then
 playanim(walkanim,true)
end
else
char.Humanoid.WalkSpeed = 24*char:GetScale()
if walking == true and idle == false and char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true then 
 local dance=LoadDance("Sprint", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Sprint.lua")
 if dance then
playanim(dance,true)
end
end
end
end
end
end)
end)
end
task.spawn(function()
if ReanimateVer~="Emper" then
LoadTools()
end
if ReanimateVer=="Emper" then

pcall(function()
States=char.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
if char.Humanoid.Sit == false then 
if char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and idle == false then
walking = false
idle = true
stopanim()
fwait(1/500)
if idle == true and walking == false and char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and playanother==true then
 local dance=LoadDance("Idle2", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Idle2.lua")
if dance then
playanim(dance,true)
end
end
elseif char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and walking == false then 
char.Humanoid.WalkSpeed = 14*char:GetScale()
walking = true
idle = false
stopanim()
fwait(1/500)
if sprinting == false then
char.Humanoid.WalkSpeed = 14*char:GetScale()
if walking == true and idle == false and char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true then
 playanim(walkanim,true)
end
else
char.Humanoid.WalkSpeed = 24*char:GetScale()
if walking == true and idle == false and char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true then 
 local dance=LoadDance("Sprint", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Sprint.lua")
 if dance then
playanim(dance,true)
end
end
end
end
end
end)
end)
end
do
local uis = game:GetService("UserInputService")

-- Key order matches HKdv3 exactly (same sequence per page)
local KEY_ORDER = {
"q","e","r","t","y","u","p",
"f","g","h","j","k","l",
"z","x","c","v","b","n","comma","leftbracket","rightbracket","minus"
}
-- Display label for each key (for the info HUD)
local KEY_LABEL = {
q="Q",e="E",r="R",t="T",y="Y",u="U",p="P",
f="F",g="G",h="H",j="J",k="K",l="L",
z="Z",x="X",c="C",v="V",b="B",n="N",comma=",",leftbracket="[",rightbracket="]",minus="-"
}

local KEYS_PER_PAGE = #KEY_ORDER  -- 26 per page

local pages = {}
local currentPageData = {}
for _, dance in ipairs(TableOfDances) do
table.insert(currentPageData, dance)
if #currentPageData >= KEYS_PER_PAGE then
table.insert(pages, currentPageData)
currentPageData = {}
end
end
if #currentPageData > 0 then
table.insert(pages, currentPageData)
end

local totalPages = #pages
local currentMode = 1  -- which page we're on

local function updatePageHUD()
pcall(function()
Page.Text = tostring(currentMode).."/"..tostring(totalPages)
end)
end
updatePageHUD()

local function playDanceFromEntry(v)
if not RUNNING then return end
if dancing == false then
stopanim()
dancing = true
Playsound.Volume = 0
task.wait(0.005)
pcall(function()
  
char.Humanoid.WalkSpeed = v.WalkSpeed * char:GetScale()
end)
-- Load and play the music
pcall(function()
task.spawn(function()
if v.Name=="Takino" then 
if isfile and not isfile("Theo-Dancezzz-Musics/Takino.mp3") then
writefile("Theo-Dancezzz-Musics/Takino.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Takino.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Bomb Monkey" then
if isfile and not isfile("Theo-Dancezzz-Musics/Monkey.mp3") then
writefile("Theo-Dancezzz-Musics/Monkey.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Monkey.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Cry For Me" then
if isfile and not isfile("Theo-Dancezzz-Musics/Cry For Me.mp3") then
writefile("Theo-Dancezzz-Musics/Cry For Me.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Cry For Me.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/"..v.Music)
elseif v.Name=="Someone Ships" then
if isfile and not isfile("Theo-Dancezzz-Musics/Idk.mp3") then
writefile("Theo-Dancezzz-Musics/Idk.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Idk.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Idk.mp3")
elseif v.Name=="Funny" then
if isfile and not isfile("Theo-Dancezzz-Musics/Funny.mp3") then
writefile("Theo-Dancezzz-Musics/Funny.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Funny.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Funny.mp3")
elseif v.Name=="Retry Now" then
if isfile and not isfile("Theo-Dancezzz-Musics/RetryNow.mp3") then
writefile("Theo-Dancezzz-Musics/RetryNow.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryNow.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/RetryNow.mp3")
elseif v.Name=="Looping The Rooms 2" then
if isfile and not isfile("Theo-Dancezzz-Musics/Looping 2.mp3") then
writefile("Theo-Dancezzz-Musics/Looping 2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Looping 2.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Looping 2.mp3")
elseif v.Name=="Looping The Rooms 4" then
if isfile and not isfile("Theo-Dancezzz-Musics/Looping 2.mp3") then
writefile("Theo-Dancezzz-Musics/Looping 2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Looping 2.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Looping 2.mp3")
elseif v.Name=="Golden Dandelion" then
if isfile and not isfile("Theo-Dancezzz-Musics/TsSoGolden.mp3") then
writefile("Theo-Dancezzz-Musics/TsSoGolden.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/TsSoGolden.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/TsSoGolden.mp3")
elseif v.Name=="Skeleton" then
if isfile and not isfile("Theo-Dancezzz-Musics/Skellywarcry.mp3") then
writefile("Theo-Dancezzz-Musics/Skellywarcry.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Skellywarcry.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Skellywarcry.mp3")
elseif v.Name=="Microwave" then
if isfile and not isfile("Theo-Dancezzz-Musics/Microwave.mp3") then
writefile("Theo-Dancezzz-Musics/Microwave.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Microwave.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Microwave.mp3")
elseif v.Name=="Lil Buddy Was Sick" then
if isfile and not isfile("Theo-Dancezzz-Musics/Lilbuddy.mp3") then
writefile("Theo-Dancezzz-Musics/Lilbuddy.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Lilbuddy.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Lilbuddy.mp3")
elseif v.Name=="Funny 2" then
if isfile and not isfile("Theo-Dancezzz-Musics/Funny2.mp3") then
writefile("Theo-Dancezzz-Musics/Funny2.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Funny2.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Funny2.mp3")
elseif v.Name=="Very Hot" then
if isfile and not isfile("Theo-Dancezzz-Musics/ItBurns.mp3") then
writefile("Theo-Dancezzz-Musics/ItBurns.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/ItBurns.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/ItBurns.mp3")
elseif v.Name=="Chegou 3" then
if isfile and not isfile("Theo-Dancezzz-Musics/Chegou 3.mp3") then
writefile("Theo-Dancezzz-Musics/Chegou 3.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Chegou 3.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Chegou 3.mp3")
elseif v.Name=="Dia Delicia" then
if isfile and not isfile("Theo-Dancezzz-Musics/DiaDelicia.mp3") then
writefile("Theo-Dancezzz-Musics/DiaDelicia.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/DiaDelicia.mp3?raw=true"))
end
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/DiaDelicia.mp3")
elseif v.Name=="Default Dance" then
if isfile and not isfile("Theo-Dancezzz-Musics/Fortnite.mp3") then
writefile("Theo-Dancezzz-Musics/Fortnite.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/Fortnite.mp3?raw=true"))
end
--musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/DiaDelicia.mp3")
musicSound.SoundId = getcustomasset("Theo-Dancezzz-Musics/Fortnite.mp3")

elseif v.Name=="Rat 1" or v.Name=="Rat 2" or v.Name=="Rat 3" then
if isfile and not isfile("Theo-Dancezzz-Musics/matchmaker.mp3") then
writefile("Theo-Dancezzz-Musics/matchmaker.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/matchmaker.mp3?raw=true"))
end
if math.random(1,3)==2 then 

musicSound.SoundId =getcustomasset("Theo-Dancezzz-Musics/matchmaker.mp3") 
else 
musicSound.SoundId = DanceAsset(v.Music)
end
else
musicSound.SoundId = DanceAsset(v.Music)
end

Numval.Value=tonumber(v.Alpha)
if v.Offset==0 then
musicSound.TimePosition=0
else 
musicSound.TimePosition=v.Offset
end
musicSound:Play()
end)
end)
if v.Name=="Someone Ships" then 
repeat wait() until not isAssetClean
function Someone_Ships()
local i=Instance.new 
local nr=NumberRange.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 
local v3=Vector3.new
local rgb=Color3.fromRGB
local c3=Color3.new
local v2=Vector2.new
local nr=NumberRange.new
local cf=CFrame.new
local angles=CFrame.Angles
local u2=UDim2.new
local Kasane_Teto_1=i("MeshPart", char)
Kasane_Teto_1.Name="Kasane_Teto"
Kasane_Teto_1:SetAttribute("EmoteProp", true)
Kasane_Teto_1.MeshId="rbxassetid://114643462421615"
Kasane_Teto_1.Anchored=false
Kasane_Teto_1.CanCollide=false
Kasane_Teto_1.CanQuery=false
Kasane_Teto_1.CanTouch=true
Kasane_Teto_1.Transparency=0
Kasane_Teto_1.Reflectance=0
Kasane_Teto_1.Color=c3(0.639216,0.635294,0.647059)
Kasane_Teto_1.Material=Enum.Material.Plastic
Kasane_Teto_1.Size=v3(.15,.15,0.079889)
Kasane_Teto_1.CastShadow=true
Kasane_Teto_1.Massless=true
Kasane_Teto_1.Material=Enum.Material.Plastic
Kasane_Teto_1.TextureID="rbxassetid://110660519010921"
Kasane_Teto_1.DoubleSided=false
Kasane_Teto_1.CollisionFidelity=Enum.CollisionFidelity.Default
Kasane_Teto_1.RenderFidelity=Enum.RenderFidelity.Automatic

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Kasane_Teto"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Kasane_Teto_1
H.Part0=char["HumanoidRootPart"]

local Stand_2=i("MeshPart", Kasane_Teto_1)
Stand_2.Name="Stand"
Stand_2:SetAttribute("EmoteProp", true)
Stand_2.MeshId="rbxassetid://85753545216631"
Stand_2.Anchored=false
Stand_2.CanCollide=false
Stand_2.CanQuery=false
Stand_2.CanTouch=true
Stand_2.Transparency=0
Stand_2.Reflectance=0
Stand_2.Color=c3(0.639216,0.635294,0.647059)
Stand_2.Material=Enum.Material.Plastic
Stand_2.Size=v3(.114,.2,.167)
Stand_2.Position=v3(0,0,1.1)
Stand_2.CastShadow=true
Stand_2.Massless=true
Stand_2.Material=Enum.Material.Plastic
Stand_2.TextureID="rbxassetid://110660519010921"
Stand_2.DoubleSided=false
Stand_2.CollisionFidelity=Enum.CollisionFidelity.Default
Stand_2.RenderFidelity=Enum.RenderFidelity.Automatic



local Stand_3=i("Motor6D", Kasane_Teto_1)
Stand_3.Name="Stand"
Stand_3:SetAttribute("EmoteProp", true)
Stand_3.Enabled=true
Stand_3.C0=cf(0.09758377075195312,-0.7425305843353271,1.1,1,0,0,0,1,0,0,0,1)
Stand_3.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Stand_3.Part0=Kasane_Teto_1
Stand_3.Part1=Stand_2



local ishipu2_4=i("Part", char)
ishipu2_4.Name="ishipu2"
ishipu2_4:SetAttribute("EmoteProp", true)
ishipu2_4.Anchored=false
ishipu2_4.CanCollide=false
ishipu2_4.CanQuery=false
ishipu2_4.CanTouch=true
ishipu2_4.Transparency=1
ishipu2_4.Reflectance=0
ishipu2_4.Color=c3(0.639216,0.635294,0.647059)
ishipu2_4.Material=Enum.Material.Plastic
ishipu2_4.Size=v3(0.100000,0.100000,0.100000)
ishipu2_4.CastShadow=true
ishipu2_4.Massless=true

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="ishipu2"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=ishipu2_4
H.Part0=char["HumanoidRootPart"]

local BillboardGui_5=i("BillboardGui", ishipu2_4)
BillboardGui_5.Name="BillboardGui"
BillboardGui_5:SetAttribute("EmoteProp", true)
BillboardGui_5.Size=u2(2,0,1,0)
BillboardGui_5.StudsOffsetWorldSpace=v3(0.000000,0.000000,0.000000)
BillboardGui_5.StudsOffset=v3(0.000000,0.000000,0.000000)
BillboardGui_5.Brightness=1



local text_6=i("TextLabel", BillboardGui_5)
text_6.Name="text"
text_6:SetAttribute("EmoteProp", true)
text_6.BackgroundColor3=c3(1.000000,1.000000,1.000000)
text_6.BackgroundTransparency=1
text_6.Size=u2(1,0,1,0)
text_6.Position=u2(0,0,0,0)
text_6.Rotation=0
text_6.ZIndex=1
text_6.Font=Enum.Font.Unknown
text_6.FontSize=Enum.FontSize.Size11
text_6.TextColor3=c3(0.000000,0.000000,0.000000)
text_6.Text="I ship u 2 hahaha"
text_6.TextSize=11
text_6.TextDirection=Enum.TextDirection.Auto
text_6.TextStrokeColor3=c3(0.000000,0.000000,0.000000)
--text_6.FontFace=nil
text_6.TextXAlignment=Enum.TextXAlignment.Center
text_6.TextYAlignment=Enum.TextYAlignment.Center
text_6.AutomaticSize=Enum.AutomaticSize.None



local UICorner_7=i("UICorner", text_6)
UICorner_7.Name="UICorner"
UICorner_7:SetAttribute("EmoteProp", true)



local Wall_8=i("Part", char)
Wall_8.Name="Wall"
Wall_8:SetAttribute("EmoteProp", true)
Wall_8.Anchored=false
Wall_8.CanCollide=false
Wall_8.CanQuery=false
Wall_8.CanTouch=true
Wall_8.Transparency=0
Wall_8.Reflectance=0
Wall_8.Color=c3(0.223529,0.223529,0.223529)
Wall_8.Material=Enum.Material.Brick
Wall_8.Size=v3(1.000000,7.387255,7.884164)
Wall_8.CastShadow=false
Wall_8.Massless=true

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Wall"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Wall_8
H.Part0=char["HumanoidRootPart"]

local Guy_9=i("Part", char)
Guy_9.Name="Guy"
Guy_9:SetAttribute("EmoteProp", true)
Guy_9.Anchored=false
Guy_9.CanCollide=false
Guy_9.CanQuery=false
Guy_9.CanTouch=true
Guy_9.Transparency=1
Guy_9.Reflectance=0
Guy_9.Color=c3(0.639216,0.635294,0.647059)
Guy_9.Material=Enum.Material.Plastic
Guy_9.Size=v3(2.000000,2.000000,1.000000)
Guy_9.CastShadow=true
Guy_9.Massless=true



local Head_10=i("Part", Guy_9)
Head_10.Name="Head"
Head_10:SetAttribute("EmoteProp", true)
Head_10.Anchored=false
Head_10.CanCollide=false
Head_10.CanQuery=false
Head_10.CanTouch=true
Head_10.Transparency=0
Head_10.Reflectance=0
Head_10.Color=c3(0.639216,0.635294,0.647059)
Head_10.Material=Enum.Material.SmoothPlastic
Head_10.Size=v3(2.000000,1.000000,1.000000)
Head_10.Position=v3(0,1.5,0)
Head_10.CastShadow=true
Head_10.Massless=true



local Mesh_11=i("SpecialMesh", Head_10)
Mesh_11.Name="Mesh"
Mesh_11:SetAttribute("EmoteProp", true)
Mesh_11.MeshType=Enum.MeshType.Head
Mesh_11.MeshId=""
Mesh_11.TextureId=""
Mesh_11.Scale=v3(1.250000,1.250000,1.250000)
Mesh_11.Offset=v3(0.000000,0.000000,0.000000)
Mesh_11.VertexColor=v3(1.000000,1.000000,1.000000)



local face_12=i("Decal", Head_10)
face_12.Name="face"
face_12:SetAttribute("EmoteProp", true)
face_12.Texture="rbxasset://textures/face.png"
face_12.Transparency=0
face_12.Color3=c3(1.000000,1.000000,1.000000)



local LeftArm_13=i("Part", Guy_9)
LeftArm_13.Name="Left Arm"
LeftArm_13:SetAttribute("EmoteProp", true)
LeftArm_13.Anchored=false
LeftArm_13.CanCollide=false
LeftArm_13.CanQuery=false
LeftArm_13.CanTouch=true
LeftArm_13.Transparency=0
LeftArm_13.Reflectance=0
LeftArm_13.Color=c3(0.639216,0.635294,0.647059)
LeftArm_13.Material=Enum.Material.SmoothPlastic
LeftArm_13.Size=v3(1.000000,2.000000,1.000000)
LeftArm_13.Position=v3(-1.5,0,0)
LeftArm_13.CastShadow=true
LeftArm_13.Massless=true



local leftarm_14=i("SpecialMesh", LeftArm_13)
leftarm_14.Name="leftarm"
leftarm_14:SetAttribute("EmoteProp", true)
leftarm_14.MeshType=Enum.MeshType.FileMesh
leftarm_14.MeshId="rbxasset://fonts/leftarm.mesh"
leftarm_14.TextureId=""
leftarm_14.Scale=v3(1.000000,1.000000,1.000000)
leftarm_14.Offset=v3(0.000000,0.000000,0.000000)
leftarm_14.VertexColor=v3(1.000000,1.000000,1.000000)



local LeftLeg_15=i("Part", Guy_9)
LeftLeg_15.Name="Left Leg"
LeftLeg_15:SetAttribute("EmoteProp", true)
LeftLeg_15.Anchored=false
LeftLeg_15.CanCollide=false
LeftLeg_15.CanQuery=false
LeftLeg_15.CanTouch=true
LeftLeg_15.Transparency=0
LeftLeg_15.Reflectance=0
LeftLeg_15.Color=c3(0.105882,0.164706,0.207843)
LeftLeg_15.Material=Enum.Material.SmoothPlastic
LeftLeg_15.Size=v3(1.000000,2.000000,1.000000)
LeftLeg_15.Position=v3(-.5,-2.000000,0)
LeftLeg_15.CastShadow=true
LeftLeg_15.Massless=true



local leftleg_16=i("SpecialMesh", LeftLeg_15)
leftleg_16.Name="leftleg"
leftleg_16:SetAttribute("EmoteProp", true)
leftleg_16.MeshType=Enum.MeshType.FileMesh
leftleg_16.MeshId="rbxasset://fonts//leftleg.mesh"
leftleg_16.TextureId=""
leftleg_16.Scale=v3(1.000000,1.000000,1.000000)
leftleg_16.Offset=v3(0.000000,0.000000,0.000000)
leftleg_16.VertexColor=v3(1.000000,1.000000,1.000000)



local RightArm_17=i("Part", Guy_9)
RightArm_17.Name="Right Arm"
RightArm_17:SetAttribute("EmoteProp", true)
RightArm_17.Anchored=false
RightArm_17.CanCollide=false
RightArm_17.CanQuery=false
RightArm_17.CanTouch=true
RightArm_17.Transparency=0
RightArm_17.Reflectance=0
RightArm_17.Color=c3(0.639216,0.635294,0.647059)
RightArm_17.Material=Enum.Material.SmoothPlastic
RightArm_17.Size=v3(1.000000,2.000000,1.000000)
RightArm_17.Position=v3(1.5,0,0)
RightArm_17.CastShadow=true
RightArm_17.Massless=true



local rightarm_18=i("SpecialMesh", RightArm_17)
rightarm_18.Name="rightarm"
rightarm_18:SetAttribute("EmoteProp", true)
rightarm_18.MeshType=Enum.MeshType.FileMesh
rightarm_18.MeshId="rbxasset://fonts/rightarm.mesh"
rightarm_18.TextureId=""
rightarm_18.Scale=v3(1.000000,1.000000,1.000000)
rightarm_18.Offset=v3(0.000000,0.000000,0.000000)
rightarm_18.VertexColor=v3(1.000000,1.000000,1.000000)



local RightLeg_19=i("Part", Guy_9)
RightLeg_19.Name="Right Leg"
RightLeg_19:SetAttribute("EmoteProp", true)
RightLeg_19.Anchored=false
RightLeg_19.CanCollide=false
RightLeg_19.CanQuery=false
RightLeg_19.CanTouch=true
RightLeg_19.Transparency=0
RightLeg_19.Reflectance=0
RightLeg_19.Color=c3(0.105882,0.164706,0.207843)
RightLeg_19.Material=Enum.Material.SmoothPlastic
RightLeg_19.Size=v3(1.000000,2.000000,1.000000)
RightLeg_19.Position=v3(.5,-2.000000,0)
RightLeg_19.CastShadow=true
RightLeg_19.Massless=true



local rightleg_20=i("SpecialMesh", RightLeg_19)
rightleg_20.Name="rightleg"
rightleg_20:SetAttribute("EmoteProp", true)
rightleg_20.MeshType=Enum.MeshType.FileMesh
rightleg_20.MeshId="rbxasset://fonts//rightleg.mesh"
rightleg_20.TextureId=""
rightleg_20.Scale=v3(1.000000,1.000000,1.000000)
rightleg_20.Offset=v3(0.000000,0.000000,0.000000)
rightleg_20.VertexColor=v3(1.000000,1.000000,1.000000)



local Torso_21=i("Part", Guy_9)
Torso_21.Name="Torso"
Torso_21:SetAttribute("EmoteProp", true)
Torso_21.Anchored=false
Torso_21.CanCollide=false
Torso_21.CanQuery=false
Torso_21.CanTouch=true
Torso_21.Transparency=0
Torso_21.Reflectance=0
Torso_21.Color=c3(0.388235,0.372549,0.384314)
Torso_21.Material=Enum.Material.SmoothPlastic
Torso_21.Size=v3(2.000000,2.000000,1.000000)
Torso_21.CastShadow=true
Torso_21.Massless=true



local torso_22=i("SpecialMesh", Torso_21)
torso_22.Name="torso"
torso_22:SetAttribute("EmoteProp", true)
torso_22.MeshType=Enum.MeshType.FileMesh
torso_22.MeshId="rbxasset://fonts//torso.mesh"
torso_22.TextureId=""
torso_22.Scale=v3(1.000000,1.000000,1.000000)
torso_22.Offset=v3(0.000000,0.000000,0.000000)
torso_22.VertexColor=v3(1.000000,1.000000,1.000000)



local Torso_23=i("Motor6D", Guy_9)
Torso_23.Name="Torso"
Torso_23:SetAttribute("EmoteProp", true)
Torso_23.Enabled=true
Torso_23.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Torso_23.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Torso_23.Part0=Guy_9
Torso_23.Part1=Torso_21



local RightLeg_24=i("Motor6D", Guy_9)
RightLeg_24.Name="Right Leg"
RightLeg_24:SetAttribute("EmoteProp", true)
RightLeg_24.Enabled=true
RightLeg_24.C0=cf(0.5,-2,0,1,0,0,0,1,0,0,0,1)
RightLeg_24.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
RightLeg_24.Part0=Guy_9
RightLeg_24.Part1=RightLeg_19



local RightArm_25=i("Motor6D", Guy_9)
RightArm_25.Name="Right Arm"
RightArm_25:SetAttribute("EmoteProp", true)
RightArm_25.Enabled=true
RightArm_25.C0=cf(1.5,0,0,1,0,0,0,1,0,0,0,1)
RightArm_25.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
RightArm_25.Part0=Guy_9
RightArm_25.Part1=RightArm_17



local LeftLeg_26=i("Motor6D", Guy_9)
LeftLeg_26.Name="Left Leg"
LeftLeg_26:SetAttribute("EmoteProp", true)
LeftLeg_26.Enabled=true
LeftLeg_26.C0=cf(-0.5,-2,0,1,0,0,0,1,0,0,0,1)
LeftLeg_26.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
LeftLeg_26.Part0=Guy_9
LeftLeg_26.Part1=LeftLeg_15



local LeftArm_27=i("Motor6D", Guy_9)
LeftArm_27.Name="Left Arm"
LeftArm_27:SetAttribute("EmoteProp", true)
LeftArm_27.Enabled=true
LeftArm_27.C0=cf(-1.5,0,0,1,0,0,0,1,0,0,0,1)
LeftArm_27.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
LeftArm_27.Part0=Guy_9
LeftArm_27.Part1=LeftArm_13



local Head_28=i("Motor6D", Guy_9)
Head_28.Name="Head"
Head_28:SetAttribute("EmoteProp", true)
Head_28.Enabled=true
Head_28.C0=cf(0,1.5,0,1,0,0,0,1,0,0,0,1)
Head_28.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
Head_28.Part0=Guy_9
Head_28.Part1=Head_10

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Guy"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Guy_9
H.Part0=char["HumanoidRootPart"]



local Talking_29=i("Part", char)
Talking_29.Name="Talking"
Talking_29:SetAttribute("EmoteProp", true)
Talking_29.Anchored=false
Talking_29.CanCollide=false
Talking_29.CanQuery=false
Talking_29.CanTouch=true
Talking_29.Transparency=1
--Talking_29.BackgroundTransparency=1
Talking_29.Reflectance=0
Talking_29.Color=c3(0.639216,0.635294,0.647059)
Talking_29.Material=Enum.Material.Plastic
Talking_29.Size=v3(0.100000,0.100000,0.100000)
Talking_29.CastShadow=true
Talking_29.Massless=true



local BillboardGui_30=i("BillboardGui", Talking_29)
BillboardGui_30.Name="BillboardGui"
BillboardGui_30:SetAttribute("EmoteProp", true)
BillboardGui_30.Size=u2(1,5,1,0)
BillboardGui_30.StudsOffsetWorldSpace=v3(0.000000,0.000000,0.000000)
BillboardGui_30.StudsOffset=v3(0.000000,0.000000,0.000000)
BillboardGui_30.Brightness=1



local TextLabel_31=i("TextLabel", BillboardGui_30)
TextLabel_31.Name="TextLabel"
TextLabel_31:SetAttribute("EmoteProp", true)
TextLabel_31.BackgroundColor3=c3(1.000000,1.000000,1.000000)
TextLabel_31.BackgroundColor3=c3(1.000000,1.000000,1.000000)
TextLabel_31.Size=u2(1,0,1,0)
TextLabel_31.Position=u2(0,0,0,0)
TextLabel_31.Rotation=0
TextLabel_31.ZIndex=1
TextLabel_31.BackgroundTransparency=1
TextLabel_31.Font=Enum.Font.Unknown
TextLabel_31.FontSize=Enum.FontSize.Size11
TextLabel_31.TextColor3=c3(0.000000,0.000000,0.000000)
TextLabel_31.Text="*Talking*"
TextLabel_31.TextSize=11
TextLabel_31.TextDirection=Enum.TextDirection.Auto
TextLabel_31.TextStrokeColor3=c3(0.000000,0.000000,0.000000)
--TextLabel_31.FontFace=nil
TextLabel_31.TextXAlignment=Enum.TextXAlignment.Center
TextLabel_31.TextYAlignment=Enum.TextYAlignment.Center
TextLabel_31.AutomaticSize=Enum.AutomaticSize.None

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Talking"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Talking_29
H.Part0=char["HumanoidRootPart"]


local Main_32=i("Part", char)
Main_32.Name="Main"
Main_32:SetAttribute("EmoteProp", true)
Main_32.Anchored=false
Main_32.CanCollide=false
Main_32.CanQuery=false
Main_32.CanTouch=true
Main_32.Transparency=1
Main_32.Reflectance=0
Main_32.Color=c3(0.639216,0.635294,0.647059)
Main_32.Material=Enum.Material.Plastic
Main_32.Size=v3(0.100000,0.100000,0.100000)
Main_32.CastShadow=true
Main_32.Massless=true

local H=i("Motor6D", char["HumanoidRootPart"])
H.Name="Main"
H:SetAttribute("EmoteProp", true)
H.Enabled=true
H.C0=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.C1=cf(0,0,0,1,0,0,0,1,0,0,0,1)
H.Part1=Main_32
H.Part0=char["HumanoidRootPart"]

local BillboardGui_33=i("BillboardGui", Main_32)
BillboardGui_33.Name="BillboardGui"
BillboardGui_33:SetAttribute("EmoteProp", true)
BillboardGui_33.Size=u2(3,5,1,0)
BillboardGui_33.StudsOffsetWorldSpace=v3(0.000000,0.000000,0.000000)
BillboardGui_33.StudsOffset=v3(0.000000,0.000000,0.000000)
BillboardGui_33.Brightness=1



local pov_34=i("TextLabel", BillboardGui_33)
pov_34.Name="pov"
pov_34:SetAttribute("EmoteProp", true)
pov_34.BackgroundColor3=c3(1.000000,1.000000,1.000000)
pov_34.BackgroundColor3=c3(1.000000,1.000000,1.000000)
pov_34.Size=u2(1,0,1,0)
pov_34.Position=u2(0,0,0,0)
pov_34.Rotation=0
pov_34.ZIndex=1
pov_34.BackgroundTransparency=1
pov_34.Font=Enum.Font.Unknown
pov_34.FontSize=Enum.FontSize.Size11
pov_34.TextColor3=c3(1.000000,1.000000,1.000000)
pov_34.Text="Pov: Someone ships you with a boy"
pov_34.TextSize=11
pov_34.TextDirection=Enum.TextDirection.Auto
pov_34.TextStrokeColor3=c3(0.000000,0.000000,0.000000)
--pov_34.FontFace=nil
pov_34.TextXAlignment=Enum.TextXAlignment.Center
pov_34.TextYAlignment=Enum.TextYAlignment.Center
pov_34.AutomaticSize=Enum.AutomaticSize.None



local UIStroke_35=i("UIStroke", pov_34)
UIStroke_35.Name="UIStroke"
UIStroke_35:SetAttribute("EmoteProp", true)



end
Someone_Ships()
wait(.2)
end
-- Load and play the dance animation
if v.DanceName~="None" and v.Url~="None" and v.Id=="None" then
if v.Looped==false then 
if v.Name=="Retry Now" then
if isfile and not isfile("Theo-Dancezzz-Musics/RetryIntro.mp3") then
writefile("Theo-Dancezzz-Musics/RetryIntro.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryIntro.mp3?raw=true"))
end
if isfile and not isfile("Theo-Dancezzz-Musics/RetryNow.mp3") then
writefile("Theo-Dancezzz-Musics/RetryNow.mp3",game:HttpGet("https://github.com/Solary-3/Scripts/blob/Audios-1/RetryNow.mp3?raw=true"))
end

local dance = LoadDance(v.DanceName, v.Url)
musicSound.SoundId=getcustomasset("Theo-Dancezzz-Musics/RetryIntro.mp3")
musicSound:Play()
local dance2 = LoadDance("Retry2", "https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Retry2.lua")
if dance then
local currentTrack = playanim(dance,false,false)
if currentTrack and currentTrack.OnFinished then
currentTrack.OnFinished.Event:Connect(function()
if dance2 then
playanim(dance2,true,true)
musicSound:Stop()
musicSound.SoundId=getcustomasset("Theo-Dancezzz-Musics/RetryNow.mp3")
musicSound:Play()
end
end)
end
end
end
else
local dance = LoadDance(v.DanceName, v.Url)
if dance then
if v.Name=="Someone Ships" then wait(.2) end
playanim(dance,true,v.UseSoundPos)
end
end
else
playanim(v.Id,true,v.UseSoundPos)
end
else
stopanim()
end
end

INPUTLOOP = uis.InputBegan:Connect(function(input, chatting)
if chatting then return end
pcall(function()
if char and char.Humanoid and char.Humanoid.Sit then return end
end)
local k = string.lower(string.gsub(tostring(input.KeyCode), "Enum.KeyCode.", ""))

-- Page cycling with M key (same as HKdv3)
if k == "m" then
currentMode = (currentMode % totalPages) + 1
updatePageHUD()
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "R6 Tool Dance";
Duration = 3;
Text = "Page " .. currentMode .. " / " .. totalPages
})

pcall(function()
local pageData = pages[currentMode]
if pageData and pageData[1] then
Dance.Text = pageData[1].Name
end
end)
elseif k=="leftcontrol" then
sprinting=not sprinting
end

-- Find which slot this key is in
local keySlot = nil
for slot, keyName in ipairs(KEY_ORDER) do
if keyName == k then
keySlot = slot
break
end
end
if not keySlot then return end

-- Get the dance for this page + slot
local pageData = pages[currentMode]
if not pageData then return end
local entry = pageData[keySlot]
if not entry then return end

-- Update HUD
--[[pcall(function()
Dance.Text = entry.Name
Key.Text = KEY_LABEL[k] or k:upper()
end)]]

playDanceFromEntry(entry)
end)
end
end)


local Player = game:GetService("Players").LocalPlayer
local PlayerMouse = Player:GetMouse()
local Camera = workspace.CurrentCamera
local Character =char
local Humanoid = Character:WaitForChild("Humanoid")
local IsR6 = (Humanoid.RigType == Enum.HumanoidRigType.R6)
local Head = Character:WaitForChild("Head")
local Torso = if IsR6 then Character:WaitForChild("Torso") else Character:WaitForChild("UpperTorso")
local Neck = if IsR6 then Torso:WaitForChild("Neck") else Head:WaitForChild("Neck")
local Waist = if IsR6 then nil else Torso:WaitForChild("Waist")
local NeckOriginC0 = Neck.C0
local WaistOriginC0 = if Waist then Waist.C0 else nil
Neck.MaxVelocity = 1/3
local AllowedStates = {Enum.HumanoidStateType.Running, Enum.HumanoidStateType.Climbing, Enum.HumanoidStateType.Swimming, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Seated}
local IsAllowedState = (table.find(AllowedStates, Humanoid:GetState()) ~= nil)
local find = table.find
local atan = math.atan
local atan2 = math.atan2
Humanoid.StateChanged:Connect(function(_, new)
IsAllowedState = (find(AllowedStates, new) ~= nil)
end)
local oldC0N = Neck.C0
local updatesPerSecond = 10
local Character = char 
local Root = char.HumanoidRootPart
function stareFIXER()
  local cam=ws.CurrentCamera
  	local root = ws[StringVal.Value].HumanoidRootPart
--	if not root then return end
  	local pos = cam.CFrame.Position
  	local flatTarget = Vector3.new(pos.X*root.Position.X, pos.Y, pos.Z*root.Position.Z)
  	--if (flatTarget - pos).Magnitude < 0.1 then return end
  	cam.CFrame = cam.CFrame:Lerp(CFrame.lookAt(pos,flatTarget),.1)
end
local hum = char.Humanoid
local cf = CFrame.new
local DIEDLOOP 
local HEADLOOP
local deltaTime=1
local f66=nil
local f67=nil
local LoudnessSmoothing=0
local BobbingIntensity=0.15
if ReanimateVer=="Emper" then 
con1=game:GetService("RunService").PostSimulation:Connect(function(deltaTime: number)
if not RUNNING then
if f66 then 
f66:Disconnect()
f66=nil
end
if f67 then 
f67:Disconnect()
f67=nil
end
for _,v in ipairs(game:GetService("RunService"):GetChildren()) do
if v:IsA("Sound") then 
v.TimePosition=0 
v:Stop()
end
end
pcall(function()
G2L["1"]:Destroy()
end)
con1:Disconnect()

stopanim()
end
local function Alpha(n)
return math.clamp(n*deltaTime*60,0,1)
end
--stareFIXER()
if RUNNING then
local target=musicSound.PlaybackLoudness or Playsound.PlaybackLoudness
LoudnessSmoothing=LoudnessSmoothing + (target - LoudnessSmoothing) * BobbingIntensity
local bob=math.clamp(LoudnessSmoothing / 100, 0, 30)
workspace.CurrentCamera.FieldOfView =70-bob*1.5
else 
workspace.CurrentCamera.FieldOfView =70
--llllll:Disconnect()
end
--print("aaaaa")
pcall(function()
local rig = workspace:FindFirstChild("ReanimatedRig")
if not rig then return end
local h   = rig:FindFirstChild("Head")
local hrp = rig:FindFirstChild("HumanoidRootPart")
local remHum = rig:FindFirstChild("Humanoid")

rig:FindFirstChild("Humanoid").CameraOffset =rig:FindFirstChild("Humanoid").CameraOffset:Lerp((hrp.CFrame*cf(0,1.5,0)):PointToObjectSpace(h.Position),Alpha(.025))
end)
end)
else
con=game:GetService("RunService").PostSimulation:Connect(function(deltaTime: number)
if not RUNNING then
if f66 then 
f66:Disconnect()
f66=nil
end
if f67 then 
f67:Disconnect()
f67=nil
end
for _,v in ipairs(game:GetService("RunService"):GetChildren()) do
if v:IsA("Sound") then 
v.TimePosition=0 
v:Stop()
end
end
pcall(function()
G2L["1"]:Destroy()
end)
con:Disconnect()

stopanim()
end
--stareFIXER()
if ReanimateVer~="Emper" then
if Place == 17574618959 or Place == 88308889239232 or Place==123974602339071 then
if not RUNNING then
for _,v in ipairs(game:GetService("RunService"):GetChildren()) do
if v:IsA("Sound") then 
v.TimePosition=0 
v:Stop()
end
end
pcall(function()
G2L["1"]:Destroy()
end)
RUNNING=false
RUNNING=false
con:Disconnect()

return
end
else 
if not RUNNING then
for _,v in ipairs(game:GetService("RunService"):GetChildren()) do 
if v:IsA("Sound") then 
v.TimePosition=0 
v:Stop()
end
end
pcall(function()
G2L["1"]:Destroy()
end)
wait(1)
RUNNING=false
RUNNING=false
con:Disconnect()
end
end
end
local function Alpha(n)
return math.clamp(n*deltaTime*60,0,1)
end
if RUNNING then
local target=musicSound.PlaybackLoudness or Playsound.PlaybackLoudness
LoudnessSmoothing=LoudnessSmoothing + (target - LoudnessSmoothing) * BobbingIntensity
local bob=math.clamp(LoudnessSmoothing / 100, 0, 30)
workspace.CurrentCamera.FieldOfView =70-bob*1.5
else 
workspace.CurrentCamera.FieldOfView =70
--llllll:Disconnect()
end
if ReanimateVer~="Emper" then
pcall(function()
if workspace:FindFirstChild("GelatekReanimate")then
hum=workspace:FindFirstChild("GelatekReanimate").Humanoid
ws.CurrentCamera.CameraSubject=hum
local hrp=workspace:FindFirstChild("GelatekReanimate").HumanoidRootPart
local h=workspace:FindFirstChild("GelatekReanimate").Head
hum.CameraOffset =hum.CameraOffset:Lerp((hrp.CFrame*cf(0,1.5,0)):PointToObjectSpace(h.Position),Alpha(.025))
elseif workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then
hum=workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake").Humanoid
ws.CurrentCamera.CameraSubject=hum
local hrp=workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake").HumanoidRootPart 
local h=workspace:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake").Head 
hum.CameraOffset =hum.CameraOffset:Lerp((hrp.CFrame*cf(0,1.5,0)):PointToObjectSpace(h.Position),Alpha(.025))
end
if not game.Players.LocalPlayer.Character:FindFirstChildOfClass("ForceField") then 
local ff=Instance.new("ForceField",game.Players.LocalPlayer.Character)
ff.Visible=false
end

end)

pcall(function()
if dancing==false and char.Humanoid.MoveDirection == Vector3.new(0,0,0) then
walking = false 
idle = true 
else 
walking = true 
idle = false 
end
end)
end 
end)
end
if Place ~= 17574618959 or Place ~= 88308889239232 or Place~=123974602339071 then 
if ReanimateVer=="Emper" then return end
f67=game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Connect(function()
if ReanimateVer=="Emper" then return end
stopanim()
wait(.5)
pcall(function()
ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake"):Destroy()
end)
StringVal.Value="None!"
end)
f66=game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
if ReanimateVer=="Emper" then return end
task.wait(game:GetService("Players").RespawnTime+.1)
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then return end
repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health>1 
if REANIMATION then return end 
print("1")
wait(.1)
Backup()
repeat wait() until ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake")
LoadTools()
REANIMATION=false
char=ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake")
StringVal.Value=char.Name
hum=char.Humanoid
repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health<1 
stopanim()
StopAllAnimations()
end)
end


end


Stop1.MouseButton1Click:Connect(function()
if ReanimateVer=="Emper" then 
if workspace:FindFirstChild("ReanimatedRig") then
notify("Manually Respawn First Then Click This Again.")
return
end
end
RUNNING = false
print(RUNNING)
wait(.2)
for _,v in ipairs(game:GetService("RunService"):GetChildren()) do 
if v:IsA("Sound") then 
v.TimePosition=0 
v:Stop()
end
end
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
if STATES then 
STATES:Disconnect()
STATES = nil 
end
if Place == 17574618959 or Place == 88308889239232 or Place==123974602339071 then
if ReanimateVer=="Gelatek" then 
StopScript()
wait(1)
end
game.ReplicatedStorage["01_server"]:FireServer("cmd", "-re ")
if ReanimateVer=="Current" then
wait(1)
--game.ReplicatedStorage["01_server"]:FireServer("cmd", "-rs ")
respawn()
end
else
wait(1)
respawn()
end
end)



Run1.MouseButton1Click:Connect(function()
if RUNNING then return notify("SCRIPT IS RUNNING!!") end
if REANIMATION then return notify("Reanimating please wait") end
if ReanimateVer=="Emper" then 

if ReanimateVer=="Emper" then
if ws:FindFirstChild("ReanimatedRig") then
if ReanimateVer=="Emper" then
if ws:FindFirstChild("ReanimatedRig") then
MainScript()
Run1.Position = UDim2.new(10, 0, 0.629999971, 0)
RUNNING = true
end
end
else
notify("Not Reanimated")
end
end
else
if Place == 17574618959 or Place == 88308889239232 or Place==123974602339071 then
if ReanimateVer=="Gelatek" then
if ws:FindFirstChild("GelatekReanimate") then
if ReanimateVer=="Gelatek" then
if ws:FindFirstChild("GelatekReanimate") then
MainScript()
Run1.Position = UDim2.new(10, 0, 0.629999971, 0)
RUNNING = true
end
end
else
notify("Not Reanimated")
end
end
if ReanimateVer=="Current" then
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then
if ReanimateVer=="Current" then
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then
Run1.Position = UDim2.new(10, 0, 0.629999971, 0)
--RUNNING = true
MainScript()
end
end
else
notify("Not Reanimated")
end
end
else 
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then
if ws:FindFirstChild(game.Players.LocalPlayer.Name.."_Fake") then
Run1.Position = UDim2.new(10, 0, 0.629999971, 0)
MainScript()
end

else
notify("Not Reanimated")
end
end
end
end)
