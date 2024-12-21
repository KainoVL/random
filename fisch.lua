local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local GuiService = game:GetService("GuiService")
local Lighting = game:GetService("Lighting")
local Connections = {}

local HyperionUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KainoVL/meow/refs/heads/main/uilibrary.lua"))()
local ui = HyperionUI.new("Fishing")

local mainTab = ui:NewTab("Fishing")
local teleportsTab = ui:NewTab("Teleports")
local miscTab = ui:NewTab("Misc")
task.wait(0.1)

local teleportLocations = {
    ["Moosewood"] = Vector3.new(387, 134, 228),
    ["Keeper's Altar"] = Vector3.new(1310, -802, -91),
    ["Sunstone Island"] = Vector3.new(-1038, 212, -1066),
    ["The Depths"] = Vector3.new(939, -715, 1267),
    ["Ancient Isles"] = Vector3.new(6054, 195, 295),
    ["Forsaken Shores"] = Vector3.new(-2584, 149, 1644),
    ["Trident Pedestals"] = Vector3.new(-1479, -225, -2341),
    ["Vertigo"] = Vector3.new(-134, -515, 1148),
    ["Snowcap Island"] = Vector3.new(2684, 153, 2398),
    ["Birch Cray"] = Vector3.new(1756, 143, -2461),
    ["Mushgrove Swamp"] = Vector3.new(2581, 131, -793),
    ["Roslit Bay"] = Vector3.new(-1441, 133, 729),
    ["Roslit Volcano"] = Vector3.new(-1955, 193, 271),
    ["Terrapin"] = Vector3.new(-57, 132, 2029),
    ["Harvester's Spike"] = Vector3.new(-1356, 400, 1580),
    ["Statue of Sovereignty"] = Vector3.new(33, 144, -1019),
    ["Desolate Pocket"] = Vector3.new(-1633, -231, -2895),
    ["Desolate Left Cave"] = Vector3.new(-966, -245, -2703),
    ["Desolate Brine Pool"] = Vector3.new(-1796, -143, -3338),
    ["The Arch"] = Vector3.new(997, 131, -1234)
}

teleportLocations["Crafting Table"] = Vector3.new(-3161, -745, 1674)

local rodLocations = {
    ["Carbon/Training"] = Vector3.new(450, 151, 226),
    ["Plastic/Fast"] = Vector3.new(450, 151, 226),
    ["Lucky"] = Vector3.new(450, 151, 226),
    ["Stone"] = Vector3.new(5502, 146, -317),
    ["Long"] = Vector3.new(483, 174, 148),
    ["Magma [Give Orc Pufferfish]"] = Vector3.new(-1850, 165, 160),
    ["Fungal [Give Agaric Alligator]"] = Vector3.new(2600, 130, -730),
    ["Steady/Fortune/Rapid"] = Vector3.new(-1513, 142, 764),
    ["Magnet"] = Vector3.new(-198, 133, 1930),
    ["Nocturnal"] = Vector3.new(-144, -515, 1143),
    ["Reinforced"] = Vector3.new(-989, -245, -2695),
    ["Phoenix"] = Vector3.new(5967, 270, 851),
    ["Scurvy"] = Vector3.new(-2827, 215, 1513),
    ["Aurora [Needs Borealis]"] = Vector3.new(-144, -515, 1132),
    ["King's"] = Vector3.new(1378, -808, -301),
    ["Destiny [Need's 70% Bestiary]"] = Vector3.new(983, 131, -1233)
}

local fragmentLocations = {
    ["Earth"] = Vector3.new(5970, 274, 846),
    ["Deep Sea"] = Vector3.new(5843, 79, 383),
    ["Solar [Needs Eclipse]"] = Vector3.new(6073, 443, 684),
    ["Ancient [Fish For it]"] = Vector3.new(5793, 135, 403)
}

local totemLocations = {
    ["Aurora"] = Vector3.new(-1811, -137, -3281),
    ["Sundial"] = Vector3.new(-1149, 137, -1077),
    ["Tempest"] = Vector3.new(36, 135, 1946),
    ["Smokescreen"] = Vector3.new(2792, 140, -629),
    ["Windset"] = Vector3.new(2792, 140, -629),
    ["Eclipse"] = Vector3.new(5968, 274, 839),
    ["Meteor"] = Vector3.new(-1945, 277, 231),
    ["Blizzard"] = Vector3.new(20146, 743, 5805)
}

local locationNames = {}
for name, _ in pairs(teleportLocations) do
    table.insert(locationNames, name)
end
table.sort(locationNames)

local rodNames = {}
for name, _ in pairs(rodLocations) do
    table.insert(rodNames, name)
end
table.sort(rodNames)

local fragmentNames = {}
for name, _ in pairs(fragmentLocations) do
    table.insert(fragmentNames, name)
end
table.sort(fragmentNames)

local totemNames = {}
for name, _ in pairs(totemLocations) do
    table.insert(totemNames, name)
end
table.sort(totemNames)

ui:CreateDropdown(teleportsTab, "Locations", "Select location to teleport", locationNames, locationNames[1], function(selected)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local location = teleportLocations[selected]
        if location then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
        end
    end
end)

ui:CreateButton(teleportsTab, "Crafting Table", "Teleport to Crafting Table", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3161, -745, 1674)
    end
end)

ui:CreateDropdown(teleportsTab, "Rods", "Select rod location to teleport", rodNames, rodNames[1], function(selected)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local location = rodLocations[selected]
        if location then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
        end
    end
end)

ui:CreateDropdown(teleportsTab, "Fragments", "Select fragment location to teleport", fragmentNames, fragmentNames[1], function(selected)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local location = fragmentLocations[selected]
        if location then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
        end
    end
end)

ui:CreateDropdown(teleportsTab, "Totems", "Select totem location to teleport", totemNames, totemNames[1], function(selected)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local location = totemLocations[selected]
        if location then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(location)
        end
    end
end)

local autoShakeEnabled = false
local autoReelEnabled = false
local autoCastEnabled = false

ui:CreateToggle(mainTab, "Auto Shake", "Automatically shakes once rod is cast", false, function(state)
    autoShakeEnabled = state
    if state then
        table.insert(Connections, PlayerGui.DescendantAdded:Connect(function(object)
            if object:IsA("Frame") then
                task.defer(function()
                    if object:IsA("Frame") and object.Name == "safezone" then
                        for _, child in ipairs(object:GetChildren()) do
                            if child.Name == "button" and child:IsA("GuiObject") then
                                task.spawn(function()
                                    while child.Parent ~= nil and autoShakeEnabled do
                                        local viewportSize = workspace.CurrentCamera.ViewportSize
                                        child.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        child.AnchorPoint = Vector2.new(0.5, 0.5)
                                        task.wait()
                                    end
                                end)
                                
                                wait()
                                local VirtualInputManager = game:GetService("VirtualInputManager")
                                local viewportSize = workspace.CurrentCamera.ViewportSize
                                local centerX, centerY = viewportSize.X / 2, viewportSize.Y / 2
                                
                                VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
                                VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
                            end
                        end

                        table.insert(Connections, object.ChildAdded:Connect(function(v)
                            if v.Name == "button" and v:IsA("GuiObject") then
                                task.spawn(function()
                                    while v.Parent ~= nil and autoShakeEnabled do
                                        local viewportSize = workspace.CurrentCamera.ViewportSize
                                        v.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        v.AnchorPoint = Vector2.new(0.5, 0.5)
                                        task.wait()
                                    end
                                end)
                                
                                wait()
                                local VirtualInputManager = game:GetService("VirtualInputManager")
                                local viewportSize = workspace.CurrentCamera.ViewportSize
                                local centerX, centerY = viewportSize.X / 2, viewportSize.Y / 2
                                
                                VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
                                VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
                            end
                        end))
                    end
                end)
            end
        end))
    else
        for _, connection in ipairs(Connections) do
            connection:Disconnect()
        end
        table.clear(Connections)
    end
end)

task.wait(0.1)

ui:CreateToggle(mainTab, "Auto Reel", "Automatically reels in fish", false, function(state)
    autoReelEnabled = state
    if state then
        task.spawn(function()
            while autoReelEnabled and task.wait() do
                local reel = PlayerGui:FindFirstChild("reel")
                if reel then
                    task.wait(0.1)
                    local args = {
                        [1] = 100,
                        [2] = true
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
                end
            end
        end)
    end
end)

task.wait(0.1)

ui:CreateToggle(mainTab, "Auto Cast", "Automatically casts fishing rod", false, function(state)
    autoCastEnabled = state
    if state then
        task.spawn(function()
            while autoCastEnabled and task.wait(1) do
                if not autoCastEnabled then break end
                
                local rod
                for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
                    if item.Name:find("Rod") then
                        rod = item
                        break
                    end
                end
                
                if not rod then
                    for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
                        if item.Name:find("Rod") then
                            rod = item
                            break
                        end
                    end
                end
                
                if rod then
                    local args = {
                        [1] = 100,
                        [2] = 1
                    }
                    rod.events.cast:FireServer(unpack(args))
                end
            end
        end)
    end
end)

local freezeEnabled = false
local freezeCFrame = nil

ui:CreateToggle(mainTab, "Freeze Character", "Freezes character in their current position", false, function(state)
    freezeEnabled = state
    if state then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            freezeCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            
            task.spawn(function()
                while freezeEnabled and task.wait() do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = freezeCFrame
                    end
                end
            end)
        end
    end
end)

ui:CreateButton(mainTab, "Sell All Fish", "Automatically sells all fish and returns when completed", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local originalPosition = LocalPlayer.Character.HumanoidRootPart.Position
        local originalMoney = LocalPlayer:WaitForChild("leaderstats"):WaitForChild("C$").Value
        
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(465, 151, 230)
        
        task.wait(2)
        
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant")
            :WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
        
        local startTime = tick()
        while tick() - startTime < 150 do  
            if LocalPlayer.leaderstats["C$"].Value > originalMoney then
                break
            end
            task.wait(0.1)
        end
        
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
    end
end)

task.wait(0.1)

local selectedAmount = 1

ui:CreateSlider(miscTab, "Purchase Amount", "Select amount to purchase", 1, 100, 1, function(value)
    selectedAmount = value
end)

local function teleportAndBuy(action)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local originalPosition = LocalPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-928, 226, -993)
        task.wait(3)
        
        for i = 1, selectedAmount do
            if action == "enchant" then
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin")
                    :WaitForChild("Merlin"):WaitForChild("power"):InvokeServer()
            else
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin")
                    :WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
            end
            task.wait(0.1)
        end
        
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
    end
end

ui:CreateButton(miscTab, "Buy Enchant Relics", "Purchases selected amount of enchant relics", function()
    teleportAndBuy("enchant")
end)

ui:CreateButton(miscTab, "Buy Luck", "Purchases selected amount of luck", function()
    teleportAndBuy("luck")
end)

ui:CreateButton(miscTab, "Infinite Oxygen", "Removes oxygen bar", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("client") then
        if LocalPlayer.Character.client:FindFirstChild("oxygen") then
            LocalPlayer.Character.client.oxygen:Destroy()
        end
    end
end)

local walkspeedEnabled = false
local defaultWalkSpeed = 16
local selectedWalkspeed = defaultWalkSpeed

ui:CreateSlider(miscTab, "Walkspeed", "Adjust walking speed", 16, 100, defaultWalkSpeed, function(value)
    selectedWalkspeed = value
    if walkspeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = selectedWalkspeed
    end
end)

ui:CreateToggle(miscTab, "Enable Walkspeed", "Toggle custom walkspeed", false, function(state)
    walkspeedEnabled = state
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = state and selectedWalkspeed or defaultWalkSpeed
    end
end)

local fullbrightEnabled = false
local originalAmbient = Lighting.Ambient
local originalOutdoorAmbient = Lighting.OutdoorAmbient
local originalBrightness = Lighting.Brightness
local originalExposure = Lighting.ExposureCompensation

ui:CreateToggle(miscTab, "Fullbright", "Toggles fullbright mode", false, function(state)
    fullbrightEnabled = state
    if state then
        Lighting.Ambient = Color3.fromRGB(178, 178, 178)
        Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
        Lighting.Brightness = 1
        Lighting.ExposureCompensation = 1
    else
        Lighting.Ambient = originalAmbient
        Lighting.OutdoorAmbient = originalOutdoorAmbient
        Lighting.Brightness = originalBrightness
        Lighting.ExposureCompensation = originalExposure
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        ui:Toggle()
    end
end)
