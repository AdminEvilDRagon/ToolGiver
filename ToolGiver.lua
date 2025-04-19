local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local ThemeToggle = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.061, 0, 0.093, 0)
Frame.Size = UDim2.new(0, 230, 0, 250)

local corner1 = Instance.new("UICorner", Frame)
corner1.CornerRadius = UDim.new(0, 12)

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.065, 0, 0.18, 0)
ScrollingFrame.Size = UDim2.new(0, 200, 0, 145)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 35, 0)

local corner2 = Instance.new("UICorner", ScrollingFrame)
corner2.CornerRadius = UDim.new(0, 10)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

TextButton.Parent = ScrollingFrame
TextButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0, 170, 0, 40)
TextButton.Visible = false
TextButton.Font = Enum.Font.Gotham
TextButton.TextColor3 = Color3.fromRGB(50, 50, 50)
TextButton.TextSize = 16
TextButton.TextWrapped = true

local buttonCorner = Instance.new("UICorner", TextButton)
buttonCorner.CornerRadius = UDim.new(0, 8)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 230, 0, 30)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "🔧 Tool Giver"
TextLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
TextLabel.TextSize = 16

local labelCorner = Instance.new("UICorner", TextLabel)
labelCorner.CornerRadius = UDim.new(0, 8)

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.07, 0, 0.83, 0)
TextButton_2.Size = UDim2.new(0, 200, 0, 30)
TextButton_2.Font = Enum.Font.Gotham
TextButton_2.Text = "🔄 Update list"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextSize = 14

local updateCorner = Instance.new("UICorner", TextButton_2)
updateCorner.CornerRadius = UDim.new(0, 8)

ThemeToggle.Name = "ThemeToggle"
ThemeToggle.Parent = Frame
ThemeToggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ThemeToggle.BorderSizePixel = 0
ThemeToggle.Position = UDim2.new(1, -28, 0, 2)
ThemeToggle.Size = UDim2.new(0, 24, 0, 24)
ThemeToggle.Font = Enum.Font.Gotham
ThemeToggle.Text = "☀️"
ThemeToggle.TextColor3 = Color3.fromRGB(50, 50, 50)
ThemeToggle.TextSize = 12

local toggleCorner = Instance.new("UICorner", ThemeToggle)
toggleCorner.CornerRadius = UDim.new(1, 0)

local isDarkMode = true

local function applyTheme()
	if isDarkMode then
		Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		TextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
		TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 150, 90)
		ThemeToggle.Text = "🌙"
		ThemeToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	else
		Frame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
		TextLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
		TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
		ThemeToggle.Text = "☀️"
		ThemeToggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	end
end

ThemeToggle.MouseButton1Click:Connect(function()
	isDarkMode = not isDarkMode
	applyTheme()
end)

applyTheme()

local function FNDR_fake_script()
	local script = Instance.new('LocalScript', Frame)

	local button = script.Parent.ScrollingFrame.TextButton
	button.Parent = nil
	button.Name = "slaves"

	local function updatelist()
		for i, v in script.Parent.ScrollingFrame:GetDescendants() do
			if v:IsA("TextButton") then
				v:Destroy()
			end
		end

		local function cloneToBackpack(toolName)
			local clonedTool = toolName:Clone()
			clonedTool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
		end

		for i, v in pairs(game:GetDescendants()) do
			if v:IsA("Tool") and v.Parent.Parent ~= game:GetService("Players").LocalPlayer then
				local clonebutton = button:Clone()
				clonebutton.Parent = script.Parent.ScrollingFrame
				clonebutton.Visible = true
				clonebutton.Text = v.Name
				clonebutton.MouseButton1Click:Connect(function()
					cloneToBackpack(v)
				end)

				local c = Instance.new("UICorner", clonebutton)
				c.CornerRadius = UDim.new(0, 6)
			end
		end
	end

	script.Parent.TextButton.MouseButton1Click:Connect(updatelist)
end
coroutine.wrap(FNDR_fake_script)()

local function SGRWUDK_fake_script()
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {
			Position = position
		}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(SGRWUDK_fake_script)()
