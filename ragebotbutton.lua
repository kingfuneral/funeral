-- Simple Toggle UI Script
-- Put your custom code inside the Enable() and Disable() functions

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ToggleUI"
ScreenGui.DisplayOrder = 999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 150, 0, 50)
Button.Position = UDim2.new(0.5, -75, 0.5, -25)
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "Enable Script"
Button.Parent = ScreenGui


-- ==========================
-- YOUR CUSTOM SCRIPT HERE
-- ==========================

local Enabled = false
local Connections = {}

function Enable()
    print("Script Enabled")

    -- Example:
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kingfuneral/skidhub/refs/heads/main/ragebotalone.lua"))()
    
    -- Example connection:
    -- table.insert(Connections, game:GetService("RunService").Heartbeat:Connect(function()
    --     print("Running")
    -- end))
end


function Disable()
    print("Script Disabled")

    -- Disconnect UI-created connections
    for _, connection in pairs(Connections) do
        if connection then
            connection:Disconnect()
        end
    end

    table.clear(Connections)

    -- Shutdown loaded script
    local env = getgenv()

    if env.__s9t0u1 then
        env.__s9t0u1:Shutdown()
        env.__s9t0u1 = nil
        print("Loaded script cleaned up")
    else
        print("No loaded script found")
    end
    

-- Example:
-- Script.Connections[#Script.Connections+1] = game:GetService("RunService").Heartbeat:Connect(function()
--     if not Script.Enabled then return end
-- end)

-- To unload:
-- Script:Unload()
end


-- ==========================
-- BUTTON TOGGLE
-- ==========================

Button.MouseButton1Click:Connect(function()
    Enabled = not Enabled

    if Enabled then
        Button.Text = "Disable Script"
        Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        Enable()
    else
        Button.Text = "Enable Script"
        Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Disable()
    end
end)
