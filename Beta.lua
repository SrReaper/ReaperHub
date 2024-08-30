local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()

library.rank = "developer"
local Wm = library:Watermark("Reaper & Jvoids ScriptHub | v" .. library.version ..  " | " .. library:GetUsername() .. " | rank: " .. library.rank)
local FpsWm = Wm:AddWatermark("fps: " .. library.fps)
coroutine.wrap(function()
    while wait(.75) do
        FpsWm:Text("fps: " .. library.fps)
    end
end)()

local Notif = library:InitNotifications()

for i = 1,0,-1 do 
    task.wait(0.05)
    local LoadingXSX = Notif:Notify("Loading", 3, "information")
end 

library.title = "Reaper & Jvoids Hub"

library:Introduction()
wait(1)
local Init = library:Init()

local Tab1 = Init:NewTab("DaHood")
local Tab2 = Init:NewTab("Tools")
local Tab3 = Init:NewTab("Jvoidluxx's Tools")
local Tab4 = Init:NewTab("Rivals")

local Section1 = Tab1:NewSection("Da Hood")
local Section1 = Tab1:NewSection("Rivals")
local Section2 = Tab3:NewSection("Tools")
local Section3 = Tab4:NewSection("Jvoidluxx's Tools")

local Label2 = Tab2:NewLabel("By ilyreaper on discord")
local Label3 = Tab2:NewLabel("Fly is W.I.P so it doesnt work")

local Button1 = Tab2:NewButton("InfiniteYield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

local Button2 = Tab1:NewButton("Dahood Best Free Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
end)

local Button3 = Tab1:NewButton("Working Silent Aim", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/G5123r35/Working-Silent-Aim-On-Dh/main/SharpSilentAim.lua"))()
end)

local Button4 = Tab4:NewButton("Rivals ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/G5123r35/Rivals-ESP/main/RivalsESP.lua"))()
end)

local Slider1 = Tab2:NewSlider("Speed Amount", "", true, "/", {min = 15, max = 100, default = 5}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

local Slider2 = Tab3:NewSlider("Speed Amount","", true, "/", {min = 15, max = 100, default = 15}, function(value)                                           
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

local Slider3 = Tab2:NewSlider("Fly Speed", "", true, "/", {min = 15, max = 100, default = 50}, function(value)
    -- Placeholder for fly speed value
    print("Fly Speed: " .. value)
end)

local FinishedLoading = Notif:Notify("Loaded Successfully", 4, "success")
