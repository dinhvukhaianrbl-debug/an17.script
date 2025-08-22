-- Gui Script: void ware andepztrai17
-- GUI cơ bản test hiển thị + avatar xoay
-- by An17

-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidWareGui"
ScreenGui.Parent = game:GetService("CoreGui")

-- Tạo Frame chính
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Bo góc
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "void ware - andepztrai17"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- Nút thu nhỏ (_)
local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -70, 0, 5)
Minimize.Text = "_"
Minimize.TextSize = 20
Minimize.BackgroundColor3 = Color3.fromRGB(40,40,40)
Minimize.TextColor3 = Color3.fromRGB(255,255,255)
Minimize.Parent = MainFrame
Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1,0)

-- Nút thoát (X)
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.Text = "X"
Close.TextSize = 20
Close.BackgroundColor3 = Color3.fromRGB(120,0,0)
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.Parent = MainFrame
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-- Cục tròn avatar xoay
local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0,120,0,120)
Avatar.Position = UDim2.new(0.5, -60, 0.5, -60)
Avatar.BackgroundTransparency = 1
Avatar.Parent = MainFrame

-- Load ảnh avatar Roblox (theo user ID)
local Players = game:GetService("Players")
local userId = Players.LocalPlayer.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
Avatar.Image = content

-- Xoay avatar liên tục
spawn(function()
    while task.wait(0.03) do
        Avatar.Rotation = Avatar.Rotation + 2
    end
end)

-- Chức năng nút
local minimized = false
Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, child in pairs(MainFrame:GetChildren()) do
        if child ~= Title and child ~= Minimize and child ~= Close then
            child.Visible = not minimized
        end
    end
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
