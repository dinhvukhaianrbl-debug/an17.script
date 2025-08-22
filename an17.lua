-- GUI có Minimize + Close
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Khung chính
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Label tiêu đề
local title = Instance.new("TextLabel")
title.Text = "Demo GUI"
title.Size = UDim2.new(1, -60, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = mainFrame

-- Nút minimize "_"
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Text = "_"
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -60, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Parent = mainFrame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

-- Nút close "X"
local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- Nút mở lại (floating circle)
local reopenBtn = Instance.new("TextButton")
reopenBtn.Text = "+"
reopenBtn.Size = UDim2.new(0, 40, 0, 40)
reopenBtn.Position = UDim2.new(0, 10, 0.8, 0)
reopenBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
reopenBtn.TextColor3 = Color3.fromRGB(255,255,255)
reopenBtn.Visible = false
reopenBtn.Parent = gui
local reopenCorner = Instance.new("UICorner")
reopenCorner.CornerRadius = UDim.new(1, 0)
reopenCorner.Parent = reopenBtn

-- Nút test trong GUI
local testBtn = Instance.new("TextButton")
testBtn.Text = "Bấm thử"
testBtn.Size = UDim2.new(0, 120, 0, 40)
testBtn.Position = UDim2.new(0.5, -60, 0.6, 0)
testBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
testBtn.TextColor3 = Color3.fromRGB(255,255,255)
testBtn.Parent = mainFrame
Instance.new("UICorner", testBtn).CornerRadius = UDim.new(0, 10)

testBtn.MouseButton1Click:Connect(function()
	testBtn.Text = "Đã bấm!"
end)

-- Sự kiện minimize
minimizeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	reopenBtn.Visible = true
end)

-- Sự kiện reopen
reopenBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	reopenBtn.Visible = false
end)

-- Sự kiện close
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
