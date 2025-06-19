local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
	Name = "TIENTHANHx Hub - Cộng đồng Việt Nam",
	LoadingTitle = "Đang tải menu...",
	LoadingSubtitle = "by TIENTHANHx",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "TienThanhHub",
		FileName = "CDVN_Config"
	},
	Discord = {
		Enabled = false,
	},
	KeySystem = false,
	StartVisible = true,
	Draggable = true,
	Position = UDim2.new(0.5, -250, 0.5, -200),
	Size = UDim2.new(0, 500, 0, 400),
})

Rayfield:Notify({
	Title = "Đã bật menu!",
	Content = "TIENTHANHx Hub đã sẵn sàng!",
	Duration = 5,
})

local AutoTab = Window:CreateTab("⚔️ Auto Farm", 4483362458)
local UtilityTab = Window:CreateTab("⚙️ Tiện ích", 4483362458)

-- Auto Farm NPC
AutoTab:CreateToggle({
	Name = "Auto Farm NPC (bay trên đầu)",
	CurrentValue = false,
	Callback = function(Value)
		_G.farmNPC = Value
		while _G.farmNPC and task.wait() do
			for _, npc in pairs(workspace.NPCs:GetChildren()) do
				if npc:FindFirstChild("HumanoidRootPart") then
					local plr = game.Players.LocalPlayer
					plr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame + Vector3.new(0,10,0)
					firetouchinterest(plr.Character.Weapon, npc.HumanoidRootPart, 0)
					firetouchinterest(plr.Character.Weapon, npc.HumanoidRootPart, 1)
				end
			end
		end
	end,
})

-- Auto Farm Grap
AutoTab:CreateToggle({
	Name = "Auto Farm Grap",
	CurrentValue = false,
	Callback = function(Value)
		_G.autoGrap = Value
		while _G.autoGrap and task.wait(1) do
			game:GetService("ReplicatedStorage").Events.Grap:FireServer()
		end
	end,
})

-- Auto Sửa điện
AutoTab:CreateToggle({
	Name = "Auto sửa điện",
	CurrentValue = false,
	Callback = function(Value)
		_G.autoFix = Value
		while _G.autoFix and task.wait(2) do
			local part = workspace:FindFirstChild("Suadien")
			if part then
				fireclickdetector(part:FindFirstChildWhichIsA("ClickDetector"))
			end
		end
	end,
})

-- Tăng hitbox x10
UtilityTab:CreateButton({
	Name = "Tăng Hitbox x10",
	Callback = function()
		for _, v in pairs(workspace.NPCs:GetDescendants()) do
			if v:IsA("HumanoidRootPart") or v:IsA("Part") then
				v.Size = v.Size * 10
				v.Transparency = 0.5
				v.Material = Enum.Material.ForceField
			end
		end
	end,
})

-- Teleport đến sửa điện
UtilityTab:CreateButton({
	Name = "Đến chỗ sửa điện",
	Callback = function()
		local plr = game.Players.LocalPlayer
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(100, 5, -200) -- toạ độ mẫu
	end,
})

-- Dừng tất cả
UtilityTab:CreateButton({
	Name = "❌ Dừng toàn bộ Auto",
	Callback = function()
		_G.farmNPC = false
		_G.autoFix = false
		_G.autoGrap = false
	end,
})
