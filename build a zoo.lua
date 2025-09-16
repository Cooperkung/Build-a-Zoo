local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
    SchemeColor = Color3.fromRGB(248,223,225),
    Background = Color3.fromRGB(97,75,73),
    Header = Color3.fromRGB(88,78,98),
    TextColor = Color3.fromRGB(0, 0, 0),
    ElementColor = Color3.fromRGB(234,155,162)
}
local Window = Library.CreateLib("CooperHub | Fish it! Premium Script", colors)


local fish = false 

function Fishing()
    wait(1)
    local args = {
	"Focus",
	"FishRob"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("CharacterRE"):FireServer(unpack(args))
    
    wait(1)

    local args = {
	"Start"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("FishingRE"):FireServer(unpack(args))

    local args = {
        "Throw",
        {
            Bait = "FishingBait3",
            Pos = vector.create(-272.5762634277344, 11, -211.99778747558594)
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("FishingRE"):FireServer(unpack(args))

    wait(6)

    local args = {
        "POUT",
        {
            SUC = 1
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("FishingRE"):FireServer(unpack(args))    

    wait(2)

end


task.spawn(function()
    while true do
        if fish then
            Fishing()
        end
        task.wait(0.01)
    end
end)


local buyfood = false 

local function BuyFood()
    local foods = {
        "Banana","Grape", "Pear", "PineApple", "GoldMango", "BloodstoneCycad",
        "ColossalPinecone", "VoltGinkgo", "DeepseaPearlFruit"
    }

    for _, food in pairs(foods) do
        local args = {food}
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("FoodStoreRE"):FireServer(unpack(args))
    end
end

-- Loop ทำงานตลอด แต่ควบคุมด้วย buyfood
task.spawn(function()
    while true do
        if buyfood then
            BuyFood()
        end
        task.wait(0.01)
    end
end)















local Tab = Window:NewTab("Main Function")

local Section = Tab:NewSection("Auto")


-- Toggle UI
Section:NewToggle("Auto Buy Food", "Toggle For Buy Food", function(state)
    if state then
        print("Toggle On")
        buyfruit = true
    else
        print("Toggle Off")
        buyfruit = false
    end
end)

Section:NewToggle("Auto Fishing", "Toggle For Fishing", function(state)
    if state then
        print("Toggle On")
        fish = true
    else
        print("Toggle Off")
        fish = false
    end
end)


local Tab = Window:NewTab("Admin Function")
local Section = Tab:NewSection("HRP")

Section:NewSlider("Speed", "Change Speed (Base 16)", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump", "Change Jump Power (Base 50)", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    Humanoid.JumpPower = s
end)

local Tab = Window:NewTab("Miscellaneous")
local Section = Tab:NewSection("Toggle")

Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)