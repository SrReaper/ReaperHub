local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()

-- Set up the library
library.rank = "developer"
local Wm = library:Watermark("ReaperHUB | v" .. library.version .. " | " .. library:GetUsername() .. " | rank: " .. library.rank)
local FpsWm = Wm:AddWatermark("fps: " .. library.fps)

-- Update FPS watermark periodically
coroutine.wrap(function()
    while wait(0.75) do
        FpsWm:Text("fps: " .. library.fps)
    end
end)()

-- Initialize notifications
local Notif = library:InitNotifications()

-- Notify loading status
for i = 1, 0, -1 do 
    task.wait(0.05)
    Notif:Notify("Loading", 3, "information")
end 

-- Set the library title
library.title = "Reaper & Jvoids Hub"

-- Initialize the library
library:Introduction()
wait(1)
local Init = library:Init()

-- Create Tabs
local Tab1 = Init:NewTab("DaHood")
local Tab2 = Init:NewTab("Tools")
local Tab3 = Init:NewTab("Jvoidluxx's Tools")
local Tab4 = Init:NewTab("Rivals")
local Tab5 = Init:NewTab("Combat Warriors")

-- Create Sections
local Section1 = Tab1:NewSection("Da Hood")
local Section2 = Tab2:NewSection("Tools")
local Section3 = Tab3:NewSection("Jvoidluxx's Tools")
local Section4 = Tab4:NewSection("Rivals")
local Section5 = Tab5:NewSection("Combat Warriors")

-- Labels
local Label2 = Tab2:NewLabel("By ilyreaper on discord")
local Label3 = Tab2:NewLabel("Fly is W.I.P so it doesn't work")

-- Buttons
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

local Button5 = Tab4:NewButton("Rivals SilentAim", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/G5123r35/Rivals-SilentAim/main/RivalsSilentAim.lua"))()
end)

local Button6 = Tab5:NewButton("Combat Warriors Script", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XorV2/script/main/Unfair'))()
end)

-- Speed Sliders
local Slider1 = Tab2:NewSlider("Speed Amount", "", true, "/", {min = 15, max = 100, default = 5}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

local Slider2 = Tab3:NewSlider("Speed Amount", "", true, "/", {min = 15, max = 100, default = 15}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

-- Fly functionality
local isFlying = false
local flySpeed = 50
local bodyGyro, bodyVelocity

local function startFly()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.maxTorque = Vector3.new(9e4, 9e4, 9e4)
    bodyGyro.cframe = humanoidRootPart.CFrame
    bodyGyro.Parent = humanoidRootPart

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.velocity = Vector3.zero
    bodyVelocity.maxForce = Vector3.new(9e4, 9e4, 9e4)
    bodyVelocity.Parent = humanoidRootPart

    isFlying = true

    -- Fly loop
    coroutine.wrap(function()
        while isFlying do
            local camera = workspace.CurrentCamera
            local lookVector = camera.CFrame.lookVector

            bodyGyro.cframe = camera.CFrame
            bodyVelocity.velocity = lookVector * flySpeed

            task.wait()
        end
    end)()
end

local function stopFly()
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
    isFlying = false
end

local function toggleFly()
    if isFlying then
        stopFly()
    else
        startFly()
    end
end

-- Slider to control fly speed
local Slider3 = Tab2:NewSlider("Fly Speed", "", true, "/", {min = 15, max = 100, default = 50}, function(value)
    flySpeed = value
end)

-- Bind X to toggle fly
library:UpdateKeybind(Enum.KeyCode.X, toggleFly)

-- Notify on load complete
local FinishedLoading = Notif:Notify("Loaded Successfully", 4, "success")
