-- Expedition 33 Camera Mod
-- Main UE4SS Lua Script

local UEHelpers = {}
function UEHelpers:GetPlayerController()
    local World = FindFirstOf("World")
    if not World then return nil end
    
    local GameInstance = World:GetGameInstance()
    if not GameInstance then return nil end
    
    local LocalPlayer = GameInstance:GetLocalPlayers()[1]
    if not LocalPlayer then return nil end
    
    return LocalPlayer:GetPlayerController()
end

function UEHelpers:GetPlayerCharacter()
    local PlayerController = self:GetPlayerController()
    if not PlayerController then return nil end
    
    return PlayerController:GetCharacter()
end

-- Global variables
local bIsFirstPerson = false
local DefaultFOV = 95.0
local FirstPersonFOV = 95.0
local ThirdPersonFOV = 85.0
local MinCameraDistance = 0.0
local MaxCameraDistance = 600.0
local DefaultCameraDistance = 300.0
local CurrentCameraDistance = DefaultCameraDistance
local CameraTransitionSpeed = 5.0

-- Toggle between first-person and third-person views
RegisterKeyBind("V", {}, function()
    ExecuteInGameThread(function()
        local PlayerController = UEHelpers:GetPlayerController()
        if not PlayerController then return end
        
        local Character = UEHelpers:GetPlayerCharacter()
        if not Character then return end
        
        -- Find camera components
        local Components = Character:GetComponents()
        local SpringArm = nil
        local Camera = nil
        
        for _, Component in ipairs(Components) do
            if Component:IsA("SpringArmComponent") then
                SpringArm = Component
            elseif Component:IsA("CameraComponent") then
                Camera = Component
            end
        end
        
        if not SpringArm or not Camera then return end
        
        -- Toggle perspective
        bIsFirstPerson = not bIsFirstPerson
        
        if bIsFirstPerson then
            -- Set to first-person
            SpringArm.TargetArmLength = 0.0
            Camera.FieldOfView = FirstPersonFOV
        else
            -- Set to third-person
            SpringArm.TargetArmLength = CurrentCameraDistance
            Camera.FieldOfView = ThirdPersonFOV
        end
    end)
end)

-- Adjust camera distance with mouse wheel
RegisterKeyBind("MouseWheelUp", {}, function()
    if bIsFirstPerson then return end
    
    ExecuteInGameThread(function()
        local Character = UEHelpers:GetPlayerCharacter()
        if not Character then return end
        
        -- Find SpringArm component
        local Components = Character:GetComponents()
        local SpringArm = nil
        
        for _, Component in ipairs(Components) do
            if Component:IsA("SpringArmComponent") then
                SpringArm = Component
                break
            end
        end
        
        if not SpringArm then return end
        
        -- Decrease camera distance
        CurrentCameraDistance = math.max(MinCameraDistance, CurrentCameraDistance - 50.0)
        SpringArm.TargetArmLength = CurrentCameraDistance
    end)
end)

RegisterKeyBind("MouseWheelDown", {}, function()
    if bIsFirstPerson then return end
    
    ExecuteInGameThread(function()
        local Character = UEHelpers:GetPlayerCharacter()
        if not Character then return end
        
        -- Find SpringArm component
        local Components = Character:GetComponents()
        local SpringArm = nil
        
        for _, Component in ipairs(Components) do
            if Component:IsA("SpringArmComponent") then
                SpringArm = Component
                break
            end
        end
        
        if not SpringArm then return end
        
        -- Increase camera distance
        CurrentCameraDistance = math.min(MaxCameraDistance, CurrentCameraDistance + 50.0)
        SpringArm.TargetArmLength = CurrentCameraDistance
    end)
end)

-- Reset camera settings
RegisterKeyBind("R", { ModifierKey.SHIFT }, function()
    ExecuteInGameThread(function()
        local PlayerController = UEHelpers:GetPlayerController()
        if not PlayerController then return end
        
        local Character = UEHelpers:GetPlayerCharacter()
        if not Character then return end
        
        -- Find camera components
        local Components = Character:GetComponents()
        local SpringArm = nil
        local Camera = nil
        
        for _, Component in ipairs(Components) do
            if Component:IsA("SpringArmComponent") then
                SpringArm = Component
            elseif Component:IsA("CameraComponent") then
                Camera = Component
            end
        end
        
        if not SpringArm or not Camera then return end
        
        -- Reset to default settings
        bIsFirstPerson = false
        CurrentCameraDistance = DefaultCameraDistance
        SpringArm.TargetArmLength = CurrentCameraDistance
        Camera.FieldOfView = DefaultFOV
    end)
end)

-- Initialize mod when script loads
NotifyOnGameStart(function()
    print("Expedition 33 Camera Mod initialized!")
    
    ExecuteInGameThread(function()
        local PlayerController = UEHelpers:GetPlayerController()
        if not PlayerController then return end
        
        local PlayerCameraManager = PlayerController.PlayerCameraManager
        if PlayerCameraManager then
            -- Set initial FOV
            PlayerCameraManager.DefaultFOV = DefaultFOV
        end
    end)
end)