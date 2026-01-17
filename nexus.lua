-- 🧠 BRAINROT FORCE TP - DELTA PC 🧠
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local basePosition = Vector3.new(0, 10, 0)

pcall(function()
    player.PlayerGui:FindFirstChild("ForceTP"):Destroy()
end)

local gui = Instance.new("ScreenGui")
gui.Name = "ForceTP"
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 140, 0, 45)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.2)
frame.BorderColor3 = Color3.new(1, 1, 1)
frame.BorderSizePixel = 1
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 15)
title.BackgroundColor3 = Color3.new(1, 0.2, 0.8)
title.Text = "FORCE TP"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 10
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.6, 0, 0, 12)
saveBtn.Position = UDim2.new(0.02, 0, 0, 17)
saveBtn.BackgroundColor3 = Color3.new(0, 0.7, 0)
saveBtn.Text = "SAVE"
saveBtn.TextColor3 = Color3.new(1, 1, 1)
saveBtn.TextSize = 8
saveBtn.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.35, 0, 0, 12)
status.Position = UDim2.new(0.63, 0, 0, 17)
status.BackgroundColor3 = Color3.new(0, 0.5, 0)
status.Text = "ON"
status.TextColor3 = Color3.new(1, 1, 1)
status.TextSize = 8
status.Parent = frame

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, 0, 0, 10)
info.Position = UDim2.new(0, 0, 0, 32)
info.BackgroundTransparency = 1
info.Text = "Ramasse = Force TP"
info.TextColor3 = Color3.new(0.8, 0.8, 0.8)
info.TextSize = 7
info.Parent = frame

-- FORCE TP avec multiple méthodes
local function forceTP()
    spawn(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            
            -- Méthode 1: TP direct
            hrp.CFrame = CFrame.new(basePosition)
            
            -- Méthode 2: Ancrage pour éviter le retour
            hrp.Anchored = true
            wait(0.1)
            hrp.CFrame = CFrame.new(basePosition)
            wait(0.1)
            hrp.Anchored = false
            
            -- Méthode 3: Force la position plusieurs fois
            for i = 1, 5 do
                hrp.CFrame = CFrame.new(basePosition)
                RunService.Heartbeat:Wait()
            end
            
            status.Text = "TP!"
            status.BackgroundColor3 = Color3.new(1, 0, 1)
            wait(1)
            status.Text = "ON"
            status.BackgroundColor3 = Color3.new(0, 0.5, 0)
        end
    end)
end

saveBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        basePosition = char.HumanoidRootPart.Position
        saveBtn.Text = "OK!"
        saveBtn.BackgroundColor3 = Color3.new(0, 1, 0)
        wait(1)
        saveBtn.Text = "SAVE"
        saveBtn.BackgroundColor3 = Color3.new(0, 0.7, 0)
        print("Position saved: " .. tostring(basePosition))
    end
end)

player.Backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        forceTP()
    end
end)

if player.Character then
    player.Character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            forceTP()
        end
    end)
end

player.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            forceTP()
        end
    end)
end)

print("FORCE TP LOADED!")
