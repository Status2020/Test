local GuiColor = {
	Base_	= Color3.new(0.184314,0.105882,0.4431373),
	Red_	= Color3.new(1,0.8,0.8),
	Green_	= Color3.new(0.8,1,0.8),
	Blue_	= Color3.new(0.8,0.8,1),
	
	Color_LWhite_= Color3.new(0.7,0.7,0.7),
	Color_LBlack_= Color3.new(0.3,0.3,0.3),
	Text_White_	= Color3.new(1,1,1),
	Text_Black_	= Color3.new(0,0,0),
	Text_Red_	= Color3.new(1,0.7,0.7),
	Text_Green_	= Color3.new(0.7,1,0.7),
	Text_Blue_	= Color3.new(0.7,0.7,1),
	
	On_Color_G	= Color3.new(0, 1, 0),
	On_Color_B	= Color3.new(0, 1, 1),
	On_Color_Y	= Color3.new(1, 1, 0)}

local CreateObject = {}; do
	CreateInstance = function(class,properties)
		local instance_ = Instance.new(class)
		for i,v in pairs(properties) do
			instance_[i] = v
		end
		return instance_
	end
	
	CreateCorner = function(object,r)
		local Corner = Instance.new("UICorner")
		Corner.CornerRadius = UDim.new(0, r)
		Corner.Parent = object
		return object
	end

	CreateButton = function(properties)
		local button_ = CreateInstance("TextButton",{BackgroundColor3=GuiColor.Base_,BackgroundTransparency=0.4,BorderSizePixel=3,
			AutoButtonColor=true,TextColor3=GuiColor.Text_White_,Font=Enum.Font.GothamBold,TextSize=12,TextTransparency=0,TextWrapped=false})
		for i,v in pairs(properties) do
			button_[i] = v
		end
		CreateCorner(button_,2)
		return button_
	end
end

local ButtonState = {}, do
	ButtonState.Forms = function(button,row,column,segment)
		button.Row = row
		button.Column = column
		button.Segment = segment
	end,
	
	ButtonState.Position = function(buTTon)
		local X = buTTon.Column * buTTon.GapX + (buTTon.Column - 1) * buTTon.SizeX
		local Y = (buTTon.Row + buTTon.Segment - 1) * buTTon.GapY + (buTTon.Row - 1) * buTTon.SizeY
		return UDim2.new(0, X, 0, Y)
	end,

	ButtonState.Size = function(buTTon)
		return UDim2.new(0, buTTon.SizeX, 0, buTTon.SizeY)
	end,

	ButtonState.On = function(button)
		button.BackgroundColor3 = GuiColor.On_Color_G
		print(button.Name, "on")
	end,

	ButtonState.Off = function(button)
		button.AutoButtonColor = false
		button.BackgroundColor3 = GuiColor.Color_LBlack_
		print(button.Name, "off")
	end,

	ButtonState.OnOff = function(button)
		if	button.BackgroundColor3 == GuiColor.Base_ then
			ButtonState.On(button)
			return true
		else
			button.AutoButtonColor = false
			ButtonState.Off(button)
			return false
		end
	end,

	ButtonState.Activation = function (button)
		button.AutoButtonColor = true
		button.BackgroundColor3 = GuiColor.Base_
		print(button.Name, "actived")
	end,

	ButtonState.LaunchPeriod = function (button, second)
		for i = 1, math.floor(second) do
			if	not button.AutoButtonColor then
				return false
			end
			wait(1)
		end
		return true
	end
end

local ButtonSet = {Row=1;Column=1;Segment=1;GapX=4;GapY=4;SizeX=90;SizeY=16}
local FieldButtonSet = {Row=1;Column=1;Segment=1;GapX=4;GapY=4;SizeX=110;SizeY=16}
local MenuSet = {Row=1;Column=1;Segment=1;GapX=5;GapY=5;SizeX=70;SizeY=20}

createGui = function()-----createGui-----
	local VioletMainGUI = CreateInstance("ScreenGui",{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,
		Name="[VioletGUI]MainGUI"})

	local dark_Frame = CreateInstance("Frame",{Active=false, Selectable=false, Draggable=false,
		BackgroundColor3=GuiColor.Text_Black_,Transparency=1,BorderSizePixel=0,
		Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, -36),Name="dark_Frame",Parent=VioletMainGUI})

	local start_Frame = CreateInstance("Frame",{Active=true, Selectable=true, Draggable=true,
		BackgroundColor3=GuiColor.Text_Black_,Transparency=1,BorderSizePixel=0,
		Size=UDim2.new(0, 230, 0, 65),Position=UDim2.new(0.01, 0, 0.18, 0),Name="start_Frame",Parent=VioletMainGUI})	
	local main_Frame = CreateInstance("Frame",{Active=true, Selectable=true,
		BackgroundColor3=GuiColor.Base_,Transparency=0.8,BorderSizePixel=0,
		Size=UDim2.new(0, 220, 0, 55),Position=UDim2.new(0, 5, 0, 5),Name="main_Frame",Parent=start_Frame})
	local menu_Frame = CreateInstance("Frame",{Active=true, Selectable=true,
		BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,Visible=false,
		Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 5, 0, 65),Name="menu_Frame",Parent=start_Frame})
	local field_Frame = CreateInstance("Frame",{Active=true, Selectable=true,
		BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,Visible=false,
		Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 80, 0, 0),Name="field_Frame",Parent=menu_Frame})	
	local actions_Frame = CreateInstance("Frame",{Active=true, Selectable=true,
		BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,Visible=false,
		Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 80, 0, 0),Name="actions_Frame",Parent=menu_Frame})	
	local settings_Frame = CreateInstance("Frame",{Active=true, Selectable=true,
		BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,Visible=false,
		Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 80, 0, 0),Name="settings_Frame",Parent=menu_Frame})

------------------main_Frame------------------
	local buttonTPTop = CreateButton({Size=UDim2.new(0, 20, 0, 10),Position=UDim2.new(0, 1, 0, 1),
		Text=" ",Name="buttonTPTop",Parent=main_Frame})
	local buttonTPPep = CreateButton({Size=UDim2.new(0, 20, 0, 10),Position=UDim2.new(0, 1, 0, 15),
		Text=" ",Name="buttonTPPep",Parent=main_Frame})
	local textView = CreateInstance("TextLabel",{Size=UDim2.new(0, 140, 0, 20),Position=UDim2.new(0, 20, 0, 5),
		BackgroundColor3=GuiColor.Base_,BackgroundTransparency=1,BorderSizePixel=0,TextTransparency=0,
		TextColor3=GuiColor.Text_White_,Font=Enum.Font.GothamBold,TextSize=14,TextWrapped=false,
		Text = "Stump Field",Name="textView",Parent=main_Frame})
	local buttonTPVicious = CreateButton({Size=UDim2.new(0, 25, 0, 10),Position=UDim2.new(0, 160, 0, 1),
		Text="Vicious",Name="buttonTPVicious",Parent=main_Frame,TextSize = 4,
		Visible=false,BackgroundColor3=GuiColor.Red_})
	local buttonTPWindy = CreateButton({Size=UDim2.new(0, 25, 0, 10),Position=UDim2.new(0, 160, 0, 15),
		Text="Windy",Name="buttonTPWindy",Parent=main_Frame,TextSize=4,
		Visible=false,BackgroundColor3=GuiColor.Color_LBlack_})
	local buttonSeeMushroom = CreateButton({Size=UDim2.new(0, 25, 0, 20),Position=UDim2.new(0, 160, 0, 30),
		Text="0",Name="buttonSeeMushroom",Parent=main_Frame,TextSize = 16,Transparency = 1})
	local buttonMenu = CreateButton({Size=UDim2.new(0, 30, 0, 20),Position=UDim2.new(0, 5, 0, 30),
		Text=">>",Name="buttonMenu",Parent=main_Frame,TextSize = 14})
	local buttonFarm = CreateButton({Size=UDim2.new(0, 38, 0, 20),Position=UDim2.new(0, 100, 0, 30),
		Text="Start",Name="buttonFarm",Parent=main_Frame})
	local buttonFarmToSp = CreateButton({Size=UDim2.new(0, 15, 0, 20),Position=UDim2.new(0, 140, 0, 30),
		Text="St",Name="buttonFarmToSp",Parent=main_Frame,TextSize = 6})
	
------------------settings_Frame------------------
	ButtonState.Forms(ButtonSet,1,3,1)
	local buttonAutoMushrooms = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="AMush",Name="buttonAutoMushrooms",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,4,2,1)
	local buttonAutoVicious = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="AVicious",Name="buttonAutoVicious",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,5,2,1)
	local buttonAutoWindy = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="AWindy",Name="buttonAutoWindy",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,6,2,1)
	local buttonAutoStickBug = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="AStickBug",Name="buttonAutoStickBug",Parent=settings_Frame,TextSize = 10})
		
	return VioletMainGUI
end

local V_I_O_L_E_T_M_A_I_N_Gui = createGui()
local dark_Frame = V_I_O_L_E_T_M_A_I_N_Gui:WaitForChild("dark_Frame")
local start_Frame = V_I_O_L_E_T_M_A_I_N_Gui:WaitForChild("start_Frame")
local main_Frame = start_Frame:WaitForChild("main_Frame")
local menu_Frame = start_Frame:WaitForChild("menu_Frame")
local field_Frame = menu_Frame:WaitForChild("field_Frame")
local actions_Frame = menu_Frame:WaitForChild("actions_Frame")
local settings_Frame = menu_Frame:WaitForChild("settings_Frame")

local buttonTPTop = main_Frame:WaitForChild("buttonTPTop")
local buttonTPPep = main_Frame:WaitForChild("buttonTPPep")
local buttonTPVicious = main_Frame:WaitForChild("buttonTPVicious")
local buttonTPWindy = main_Frame:WaitForChild("buttonTPWindy")
local buttonSeeMushroom = main_Frame:WaitForChild("buttonSeeMushroom")
local textView = main_Frame:WaitForChild("textView")
local buttonMenu = main_Frame:WaitForChild("buttonMenu")
local buttonFarm = main_Frame:WaitForChild("buttonFarm")
local buttonFarmToSp = main_Frame:WaitForChild("buttonFarmToSp")

local buttonAutoMushrooms = settings_Frame:WaitForChild("buttonAutoMushrooms")
local buttonAutoVicious = settings_Frame:WaitForChild("buttonAutoVicious")
local buttonAutoWindy = settings_Frame:WaitForChild("buttonAutoWindy")
local buttonAutoStickBug = settings_Frame:WaitForChild("buttonAutoStickBug")

V_I_O_L_E_T_M_A_I_N_Gui.Parent = game.CoreGui

-------------------------------------------
------------------События------------------
-------------------------------------------
spawn(function()
	fieldPosition = workspace.FlowerZones[textView.Text].Position
	humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
	humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
	spawnPosHumanoid = game.Players.LocalPlayer.SpawnPos.Value
	fieldCFrame = CFrame.new(workspace.FlowerZones[textView.Text].Position)
	--game.Players.LocalPlayer.DevCameraOcclusionMode = Invisicam
	game.Players.LocalPlayer.CameraMaxZoomDistance = 777
	workspace.Gravity = 170 --192.5

	MinMaxField = {distanceToBoard=5,min_X=0,max_X=0,min_Z=0,max_Z=0}
	function setMinMaxField(distance)
		local sizeField = workspace.FlowerZones[textView.Text].Size
		MinMaxField.min_X = fieldPosition.x - (sizeField.x / 2) + distance
		MinMaxField.max_X = fieldPosition.x + (sizeField.x / 2) - distance
		MinMaxField.min_Z = fieldPosition.z - (sizeField.z / 2) + distance
		MinMaxField.max_Z = fieldPosition.z + (sizeField.z / 2) - distance
		wait(.5)
	end
	setMinMaxField(MinMaxField.distanceToBoard)
end)

local ConnectionKey = {ConnectionT,ConnectionV,ConnectionRXC,VirtualUserActive}
local HumanoidState = {Speed=0,TmpSpeed=0,SetMask=0}
local HumanoidAction = {AllStarting=true,Farm=false,FarmToSp=false,Pause=false,CapacityUnloading=false}
local AutoFlags = {
	DigBottonDown=false,
	MobsBottonDown=false,
	ViciousBottonDown=false,
	WindyBottonDown=false,
	MondoBottonDown=false,
	StickBugBottonDown=false,
	DispenserBottonDown=false,
	BoostBottonDown=false,
	TornadoBottonDown=false,
	TicketBottonDown=false,
	MushroomsBottonDown=false,
	ChristmasBottonDown=false,
	DisableFoldingBotton=false}
local ActionFlags = {
	BalloonBottonDown=false,
	BalloonTrackingStarted=false,
	BalloonTrackingStarted_=false,
	StateBalloonBotton=0,
	CapasityBalloon=0,
	TimeAfterBalloonUnloading=0,
	SnailTimeBottonDown=0,
	MushroomLvl=0,
	MushroomClass=0,
	MushroomCFrame=CFrame.new(-100,-100,-100)}


--====================Function====================--
--local function FunctionIn() end
--coroutine.wrap(FunctionIn)()

--local FunctionOn = coroutine.wrap(function() end)
--FunctionOn()
local function hideFrames()---+++
	for _,k in pairs(menu_Frame:GetChildren()) do
		if	k:IsA("Frame") then
			k.Visible = false
		elseif k:IsA("TextButton") then
			k.BackgroundColor3 = GuiColor.Base_
		end
	end
end

local function displayFrame(button, frame)---+++
	if	frame.Visible then
		frame.Visible = false
		button.BackgroundColor3 = GuiColor.Base_
	else
		hideFrames()
		frame.Visible = true
		button.BackgroundColor3 = GuiColor.On_Color_B
	end
end

local function hideMenu()---+++
	if not menu_Frame.Visible then
		buttonMenu.BackgroundColor3 = GuiColor.On_Color_G
		menu_Frame.Visible = true
	else
		buttonMenu.BackgroundColor3 = GuiColor.Base_
		menu_Frame.Visible = false
	end
end

--coroutine.wrap
local function applySpeed()---+++
	while HumanoidState.Speed > 30 do
		humanoid.WalkSpeed = HumanoidState.Speed
		wait(.2)
	end
end

local lutCollection = false
local timeLutCollection = 3
local function TimeLutCollection()
	local TimeLutCollectionIn = coroutine.wrap(function()
		lutCollection = true
		wait(timeLutCollection)
		lutCollection = false
	end)
	TimeLutCollectionIn()
end

local function SplinkerInstalling()
	wait(.2)
	-- ставим Сплинкер
	local A_1 = {["Name"] = "Sprinkler Builder"}
	game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(A_1)
	wait(.2)
end

local function GoToSpawnPosition()
	humanoidRootPart.CFrame = game.Players.LocalPlayer.SpawnPos.Value
	wait(1)
	game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")
end

local function CheckBalloon()
local capasityBalloonText_ = ""
for _,v in pairs(game.workspace.Balloons.HiveBalloons:GetChildren()) do
	if string.find(v.Name,"HiveBalloonInstance") then			-- ищем HiveBalloonInstance
		for _,k in pairs(v:GetChildren()) do
			if k.Name == "BalloonBody" then
				local distance_ =((k.Position.x - spawnPosHumanoid.x)^2 + 
					(k.Position.y - spawnPosHumanoid.y)^2 + 
					(k.Position.z - spawnPosHumanoid.z)^2)^0.5
				if distance_ < 20 then
					for _, descendant in pairs(k:GetDescendants()) do
						if (descendant.Name == "Bar") then
							for _,i in pairs(descendant:GetChildren()) do
								if (i.Name == "TextLabel") then
									capasityBalloonText_ = string.gsub(i.Text, ",", "")
									if capasityBalloonText_ == "" then
										ActionFlags.CapasityBalloon = 0
									else
										ActionFlags.CapasityBalloon = tonumber(capasityBalloonText_)
									end
									return
								end
							end
						end
					end
				end
			end
		end
	end
end
ActionFlags.CapasityBalloon = 0
end

local function CapacitySpawnPositionChecking()
local CapacitySpawnPositionCheckingIn = coroutine.wrap(function()
local tmpPollen_ = game.Players.LocalPlayer.CoreStats.Pollen.Value
wait(40)
while HumanoidAction.CapacityUnloading do
	if not HumanoidAction.Farm then break end
	-- если не на спавне или перестало разгружать
	if ((Vector3.new(spawnPosHumanoid.x, spawnPosHumanoid.y, spawnPosHumanoid.z) -
		humanoidRootPart.Position).magnitude >= 7) or	
		(tmpPollen_ <= game.Players.LocalPlayer.CoreStats.Pollen.Value) then
		wait(.1)
		GoToSpawnPosition()
	end
	tmpPollen_ = game.Players.LocalPlayer.CoreStats.Pollen.Value
	wait(10)
	if game.Players.LocalPlayer.CoreStats.Pollen.Value == 0 then break end
end
end)
CapacitySpawnPositionCheckingIn()
end

local function BalloonSpawnPositionChecking()
local BalloonSpawnPositionCheckingIn = coroutine.wrap(function()
CheckBalloon()
tmpPollen_ = ActionFlags.CapasityBalloon
wait(10)
while HumanoidAction.CapacityUnloading do
	if not HumanoidAction.Farm then break end
	-- если не на спавне или перестало разгружать
	CheckBalloon()
	if ActionFlags.CapasityBalloon == 0 then break end
	if ((Vector3.new(spawnPosHumanoid.x, spawnPosHumanoid.y, spawnPosHumanoid.z) -
		humanoidRootPart.Position).magnitude >= 7) or	
		(tmpPollen_ <= ActionFlags.CapasityBalloon) then
		wait(.1)
		GoToSpawnPosition()
	end
	tmpPollen_ = ActionFlags.CapasityBalloon
	wait(10)
end
end)
BalloonSpawnPositionCheckingIn()
end

local moveToPointFlag = false
local function MoveToPoint(targetPoint)
	moveToPointFlag = false	
	-- слушайте, как гуманоид достигает своей цели
	local connection_
	connection_ = humanoid.MoveToFinished:Connect(function(reached)
		moveToPointFlag = true
		connection_:Disconnect()
		connection_ = nil
	end)
	-- начать идти
	humanoid:MoveTo(targetPoint)
	while not moveToPointFlag do
		if not AutoFlags.MobsBottonDown then break end
		-- гуманоид все еще существует?
		if not (humanoid and humanoid.Parent) then break end
		-- цель изменилась?
		if humanoid.WalkToPoint ~= targetPoint then	break end
		-- обновить таймаут
		humanoid:MoveTo(targetPoint)
		wait(1)
	end
end

local function MoveToToken(targetPoint)
	moveToPointFlag = false	
	-- слушайте, как гуманоид достигает своей цели
	local connection_
	connection_ = humanoid.MoveToFinished:Connect(function(reached)
		moveToPointFlag = true
		connection_:Disconnect()
		connection_ = nil
	end)
	-- начать идти
	humanoid:MoveTo(targetPoint)
	while not moveToPointFlag do
		if not HumanoidAction.Farm or HumanoidAction.Pause then break end
		-- гуманоид все еще существует?
		if not (humanoid and humanoid.Parent) then break end
		-- цель изменилась?
		if humanoid.WalkToPoint ~= targetPoint then	break end
		-- обновить таймаут
		humanoid:MoveTo(targetPoint)
		wait(.01)
	end
end

local function tpToField()
	local function NoVisibleMenuPage(int)
		if (not AutoFlags.DisableFoldingBotton) and (int == 2) then
			buttonMenu.BackgroundColor3 = GuiColor.Base_
			menu_Frame.Visible = false
		end
	end
	
	fieldPosition = workspace.FlowerZones[textView.Text].Position	
	humanoidRootPart.CFrame = CFrame.new(fieldPosition.x, fieldPosition.y + 1, fieldPosition.z)
	NoVisibleMenuPage(2)
end

local function GoToFieldAndSplinker()
if HumanoidAction.Farm then
	tpToField()
	wait(1)
	SplinkerInstalling()
	wait(1)
end
end

local function GoToFieldOrSpawn()
	if HumanoidAction.Farm then tpToField()
	else GoToSpawnPosition() end
end

local function TimeAfterBalloonUnloading()
	ActionFlags.TimeAfterBalloonUnloading = time()
end

local function BackpackBalloonCheckingUnloading()
	-- проверяем заполнение рюкзака
	if game.Players.LocalPlayer.CoreStats.Capacity.Value <=	game.Players.LocalPlayer.CoreStats.Pollen.Value then
		if not HumanoidAction.Farm then return end
		while HumanoidAction.Pause do
			wait(1)
			if not HumanoidAction.Farm then return end
		end
		HumanoidAction.CapacityUnloading = true
		wait(.5)
		GoToSpawnPosition()
		wait(4)
		CapacitySpawnPositionChecking()
		repeat
			if not HumanoidAction.Farm then break end
			wait(.5)
		until game.Players.LocalPlayer.CoreStats.Pollen.Value == 0
	print("Capacity unloaded")
		if ActionFlags.BalloonBottonDown then
			BalloonSpawnPositionChecking()
			wait(.2)
			while ActionFlags.CapasityBalloon > 0 do
				if not HumanoidAction.Farm or HumanoidAction.Pause then break end
				wait(1)
				CheckBalloon()
			end
			if ActionFlags.CapasityBalloon == 0 then
				TimeAfterBalloonUnloading()
				print("Balloon unloaded")
			end
		end
		wait(4)
		HumanoidAction.CapacityUnloading = false
		GoToFieldAndSplinker()
	end
end

local function BackpackBalloonUnloading()
if HumanoidAction.CapacityUnloading then return end
if not HumanoidAction.Farm then return end
while HumanoidAction.Pause do
	wait(1)
	if not HumanoidAction.Farm then return end
end
HumanoidAction.CapacityUnloading = true
wait(5)
GoToSpawnPosition()
wait(4)
CapacitySpawnPositionChecking()
repeat
	if not HumanoidAction.Farm then break end
	wait(.5)
until game.Players.LocalPlayer.CoreStats.Pollen.Value == 0
if ActionFlags.BalloonBottonDown then
	BalloonSpawnPositionChecking()
	wait(.2)
	while ActionFlags.CapasityBalloon > 0 do
		if not HumanoidAction.Farm then break end
		CheckBalloon()
		wait(1)
	end
	if ActionFlags.CapasityBalloon == 0 then
		TimeAfterBalloonUnloading()
		print("Balloon unloaded afte 45 min")
	end
end
wait(4)
HumanoidAction.CapacityUnloading = false
GoToFieldAndSplinker()
end

local function BackpackUnloadingMushroom(positionMushroom_)
	-- проверяем заполнение рюкзака
	if game.Players.LocalPlayer.CoreStats.Capacity.Value <=	game.Players.LocalPlayer.CoreStats.Pollen.Value then
		if not AutoFlags.MushroomsBottonDown then return end
		HumanoidAction.CapacityUnloading = true
		wait(.5)
		GoToSpawnPosition()
		wait(4)
		CapacitySpawnPositionChecking()
		repeat
			if not AutoFlags.MushroomsBottonDown then break end
			wait(.5)
		until game.Players.LocalPlayer.CoreStats.Pollen.Value == 0
		print("Capacity unloaded befo Mushrooms")
		wait(4)
		humanoidRootPart.CFrame = CFrame.new(positionMushroom_)
		HumanoidAction.CapacityUnloading = false
	end
end

--========================================--
local function switchMask(object)---+++

local function equipingMask(mask,color)
	game:GetService("ReplicatedStorage").Events.ItemPackageEvent:InvokeServer("Equip",
	{["Mute"] = true, ["Type"] = mask, ["Category"] = "Accessory"})
	buttonTPPep.BackgroundColor3 = color
	wait(.2)
end

local function selectMask(number)

local mask,color
local function white() mask = "Gummy Mask" color = Color3.new(1, 1, 1) end
local function blue() mask = "Diamond Mask" color = Color3.new(0.32, 0.4, 1) end
local function red() mask = "Demon Mask" color = Color3.new(1, 0.2, 0,06) end

	if number == 1 then
		white()
	elseif number == 2 then
		blue()
	elseif number == 3 then
		red()
	elseif number == 0 then
		if HumanoidState.SetMask == 3 then red()
		else blue() end
	end
	return mask,color
end

local function searchFlowerZone(position)

local field_Position = workspace.FlowerZones["Dandelion Field"].Position
local TmpSizeField = {min_X=0,max_X=0,min_Z=0,max_Z=0}
	
local function fieldMinMax(field)
	field_Position = workspace.FlowerZones[field].Position
	TmpSizeField.max_Z = field_Position.z + (workspace.FlowerZones[field].Size.z / 2)
	TmpSizeField.min_Z = field_Position.z - (workspace.FlowerZones[field].Size.z / 2)
	TmpSizeField.max_X = field_Position.x + (workspace.FlowerZones[field].Size.x / 2)
	TmpSizeField.min_X = field_Position.x - (workspace.FlowerZones[field].Size.x / 2)
	wait(.05)
	if TmpSizeField.max_Z > position.z and TmpSizeField.min_Z < position.z and
		TmpSizeField.max_X > position.x and TmpSizeField.min_X < position.x then
		return true
	else
		return false
	end
end

	if position.z > 56 then		--1
		if workspace.FlowerZones["Dandelion Field"].Position.z +
			(workspace.FlowerZones["Dandelion Field"].Size.z / 2)
			> position.z then	--2
			if fieldMinMax("Dandelion Field") then return 1			--,"Dandelion Field"
			elseif fieldMinMax("Sunflower Field") then return 1		--,"Sunflower Field"
			elseif fieldMinMax("Blue Flower Field") then return 2	--,"Blue Flower Field"
			elseif fieldMinMax("Mushroom Field") then return 3		--,"Mushroom Field"
			elseif fieldMinMax("Rose Field") then return 3			--,"Rose Field"
			elseif fieldMinMax("Clover Field") then return 0 end	--,"Clover Field" end
		else
			if fieldMinMax("Coconut Field") then return 1			--,"Coconut Field"
			elseif fieldMinMax("Pepper Patch") then return 3 end	--,"Pepper Patch" end
		end
	else
		if workspace.FlowerZones["Strawberry Field"].Position.z -
			(workspace.FlowerZones["Strawberry Field"].Size.z / 2)
			< position.z then	--3
			if fieldMinMax("Strawberry Field") then return 3		--,"Strawberry Field"
			elseif fieldMinMax("Spider Field") then return 1		--,"Spider Field"
			elseif fieldMinMax("Bamboo Field") then return 2 end	--,"Bamboo Field" end
		else
			if fieldMinMax("Pineapple Patch") then return 1			--,"Pineapple Patch"
			elseif fieldMinMax("Pumpkin Patch") then return 1		--,"Pumpkin Patch"
			elseif fieldMinMax("Pine Tree Forest") then return 2	--,"Pine Tree Forest"
			elseif fieldMinMax("Cactus Field") then return 0		--,"Cactus Field"
			elseif fieldMinMax("Mountain Top Field") then return 0	--,"Mountain Top Field"
			elseif fieldMinMax("Stump Field") then return 2 end		--,"Stump Field" end
		end
	end
	return HumanoidState.SetMask
end

local function detectMask(position)
	if HumanoidState.SetMask == 0 then return end
	local number = searchFlowerZone(position)
	equipingMask(selectMask(number))
end

local function equipingSetMask()
	local mask,color = selectMask(HumanoidState.SetMask)
	buttonTPTop.BackgroundColor3 = color
	equipingMask(mask,color)
end

local function setMask(object)
	if object == "White" then
		HumanoidState.SetMask = 1
	elseif object == "Blue" then
		HumanoidState.SetMask = 2
	elseif object == "Red" then
		HumanoidState.SetMask = 3
	else
		return
	end
	equipingSetMask()
end

local function exception()
	if HumanoidState.SetMask == 0 then return end
	equipingMask(selectMask(HumanoidState.SetMask))
end

	if object = nil then
		if ActionFlags.SnailTimeBottonDown > 0 then
			equipingMask(selectMask(number))
		else
			equipingMask(selectMask(HumanoidState.SetMask))
		end
	elseif type(object) == "number" then
		equipingMask(selectMask(number))
	elseif type(object) == "vector" then
		detectMask(vector)
	elseif type(object) == "string" then
		setMask(object)
	else
		exception()
	end
end

local function searchCFrame(object)---+++
	for _, k in pairs(object:GetDescendants()) do
		if	k:IsA("BasePart") then
			return k.CFrame
		end
	end
end

local Zone = {NPCBees_="NPCBees",Monsters_="Monsters";}
local Mobs = {Windy_="Windy",Vicious_="Vicious",Stick_Bug="Stick Bug",Snail_="Snail"}
local function checkMonsterInZone(zone,monster)---+++
	for _,v in pairs(game.workspace[zone]:GetChildren()) do
		if	string.find(v.Name,monster) then
			return true,v
		end
	end
	return false
end

local function goMonsterInZone(zone,monster)---+++
	local is,monstr = checkMonsterInZone(zone,monster)
	if is then
		humanoidRootPart.CFrame = searchCFrame(v)
		print("GO to Monster",monster)
		return v
	end
end


local function MushroomSearch()
if ActionFlags.MushroomLvl > 0 then
	for _,v in pairs(game.workspace.Happenings.Puffshrooms:GetChildren()) do
		if string.find(v.Name,"PuffballMushroom") then			-- ищем грибы
			local descendants_ = v:GetDescendants()
			for _, descendant in pairs(descendants_) do
				if descendant.Name == "TextLabel" then			-- ищем уровень гриба
					if (ActionFlags.MushroomClass == 1) or
						(ActionFlags.MushroomClass == 2 and string.find(descendant.Text, "Rare")) or
						(ActionFlags.MushroomClass == 3 and string.find(descendant.Text, "Epic")) or
						(ActionFlags.MushroomClass == 4 and string.find(descendant.Text, "Legendary")) or
						(ActionFlags.MushroomClass == 5 and string.find(descendant.Text, "Mythic")) then
						if ActionFlags.MushroomLvl == tonumber(string.match(descendant.Text, "%d+")) then
							for _, k in pairs(descendants_) do
								if k:IsA("BasePart") then
									if ActionFlags.MushroomCFrame.Y == k.CFrame.Y then
										return v
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
end

local function GoToMushroom()
if ActionFlags.MushroomLvl > 0 then
	local mushroom_ = MushroomSearch()
	for _, k in pairs(mushroom_:GetDescendants()) do
		if k:IsA("BasePart") then
			humanoidRootPart.CFrame = k.CFrame
			SplinkerInstalling()
			return
		end
	end
end
end

local function remoteQuest()
local RemoteQuestIn = coroutine.wrap(function()
--
game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Brown Bear")
wait(.1)
game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Polar Bear")
wait(.1)
game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Brown Bear 2")
wait(.1)
game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Black Bear 2")
wait(.1)
game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Bucko Bee")
wait(.1)
game.ReplicatedStorage.Events.CompleteQuestFromPool:FireServer("Riley Bee")
wait(.5)
--
game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Brown Bear")
wait(.1)
game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Polar Bear")
wait(.1)
game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Brown Bear 2")
wait(.1)
game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Black Bear 2")
wait(.1)
game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Bucko Bee")
wait(.1)
game.ReplicatedStorage.Events.GiveQuestFromPool:FireServer("Riley Bee")
wait(.1)
end)

RemoteQuestIn()
end

local function AutoMobsKillFunction()
local function Collect_Dist30()
	for _,v in pairs(workspace.Collectibles:GetChildren()) do			-- перебираем собираемые элементы
	if (v.Position - humanoidRootPart.Position).magnitude <= 30 then	-- если растояние меньше, собираем
																		-- токен находится на уровне
	if ((v.Position.y > humanoidRootPart.Position.y - 5) and (v.Position.y < humanoidRootPart.Position.y + 15)) then
	if AutoFlags.MobsBottonDown then
		humanoid:MoveTo(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z), nil)
		wait(.2)
	else
		break
	end
	end
	end
	end
end

local AutoMobsKill = coroutine.wrap(function()
while AutoFlags.MobsBottonDown do
	remoteQuest()
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(25)
	end
	HumanoidAction.Pause = true
	wait(2)
	humanoidRootPart.CFrame = Waypoints["Star Room"]--тп Star room
	wait(10)
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(104, 66, 282))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(151, 34, 197))			-- клевер
		wait(5)
		for count = 1, 5 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(120, 4, 104))			-- синие цветы
		wait(5)
		for count = 1, 5 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(105, 4, 87))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(39, 4, 140))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-5, 4, 174))
		if not AutoFlags.MobsBottonDown	then break end	-- мухамор
	MoveToPoint(Vector3.new(-85, 4, 120))		
		wait(5)
		for count = 1, 5 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-85, 4, 120))	
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-13, 4, 171))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(0, 20, 50))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-33, 20, -2))			-- паук	
		wait(5)
		for count = 1, 5 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-120, 20, 13))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-180, 20, -3))			-- клубника
		wait(5)
		for count = 1, 5 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-137, 20, 59))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-239, 35, 56))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-245, 68, -81))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-328, 68, -181))		-- лес
		wait(9)
		for count = 1, 9 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-336, 68, -77))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-332, 20, 130))			-- розы
		wait(9)
		for count = 1, 9 do	Collect_Dist30() end
	MoveToPoint(Vector3.new(-332, 20, 130))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-266, 20, 177))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-215, 4, 206))--
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-208, 4, 140))--
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-90, 4, 214))--
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(0, 4, 225))--
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(-13, 4, 171))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(0, 20, 50))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(150, 20, -28))			-- бамбук
		wait(7)
		for count = 1, 5 do	Collect_Dist30() end
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(205, 20, -24))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(204, 42, 56))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(227, 42, 56))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(232, 68, -86))
		if not AutoFlags.MobsBottonDown	then break end
	MoveToPoint(Vector3.new(253, 68, -205))			-- ананас
		wait(5)
		for count = 1, 5 do	Collect_Dist30() end
	wait(1)
	if not AutoFlags.MobsBottonDown then HumanoidAction.Pause = false break end	
	if HumanoidAction.Farm then tpToField()
	else GoToSpawnPosition() end
	wait(5)
	HumanoidAction.Pause = false
	for mi = 1, 20 do
	for delta = 1, 3 do
		if not AutoFlags.MobsBottonDown then break end
		wait(20)
	end
	end	
end
HumanoidAction.Pause = false
end)

AutoMobsKill()
end

local function AutoDiging()
local AutoDigIn = coroutine.wrap(function()
while AutoFlags.DigBottonDown do
	wait(0.3)           
	for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			v.ClickEvent:FireServer()
		end
	end
end
end)

AutoDigIn()
end

local function checkKilled(timeDelay)
	humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
	if (Vector3.new(spawnPosHumanoid.x, spawnPosHumanoid.y, spawnPosHumanoid.z) -
		humanoidRootPart.Position).magnitude < 10 then
		HumanoidState.Speed = 0
		AutoFlags.DigBottonDown = false		
		print("Умер")
		wait(timeDelay)
		HumanoidState.Speed = HumanoidState.TmpSpeed
		coroutine.wrap(applySpeed)()
		AutoFlags.DigBottonDown = true
		AutoDiging()
		if not HumanoidAction.Pause then
			GoToFieldAndSplinker()
		end
		wait(.05)
		return true
	end
	wait(.05)
	return false	
end

--========================================--
local function trackingFunction()
	local function trackingMonsters()---+++
		if	checkMonsterInZone(Zone.Monsters_,Monsters.Windy_) or
			checkMonsterInZone(Zone.NPCBees_,Monsters.Windy_) then
			buttonTPWindy.Visible = true
			buttonAutoWindy.TextColor3 = GuiColor.Color_LBlack_
			textView.TextColor3 = GuiColor.Color_LBlack_
		else
			buttonTPWindy.Visible = false
			buttonAutoWindy.TextColor3 = GuiColor.Base_
			textView.TextColor3 = GuiColor.Base_
		end
		if	checkMonsterInZone(Zone.Monsters_,Monsters.Vicious_) then
			buttonTPVicious.Visible = true
			buttonAutoVicious.TextColor3 = GuiColor.TextR1
			textView.TextColor3 = GuiColor.TextR1
		else
			buttonTPVicious.Visible = false
			buttonAutoVicious.TextColor3 = GuiColor.Base_
			textView.TextColor3 = GuiColor.Base_
		end
		if	checkMonsterInZone(Zone.Monsters_,Monsters.Stick_Bug) then
			buttonAutoStickBug.TextColor3 = GuiColor.Green_
		else
			buttonAutoStickBug.TextColor3 = GuiColor.Base_
		end
	end
	
	local function SearchMushroomCFrame(mushroom)
	for _, k in pairs(mushroom:GetDescendants()) do
		if k:IsA("BasePart") then
			ActionFlags.MushroomCFrame = k.CFrame
			break
		end
	end
	end
	
	local function SearchMushroomMaxCFrame(mushroom)
	for _, k in pairs(mushroom:GetDescendants()) do
		if k:IsA("BasePart") then
			if ActionFlags.MushroomCFrame.Y <
				k.CFrame.Y then
				ActionFlags.MushroomCFrame = k.CFrame
				break
			end
		end
	end
	end
	
	local function MushroomDetect()
	local detectClassMushroom_ = 0
	local detectMaxClassMushroom_ = 0
	local detectLvlMushroom_ = 0
	local detectMaxLvlMushroom_ = 0
	for _,v in pairs(game.workspace.Happenings.Puffshrooms:GetChildren()) do
		if string.find(v.Name,"PuffballMushroom") then				-- ищем грибы
			local descendants_ = v:GetDescendants()
			for _, descendant in pairs(descendants_) do
				if descendant.Name == "TextLabel" then				-- ищем уровень гриба
					if string.find(descendant.Text, "Rare") then
						detectClassMushroom_ = 2
					elseif string.find(descendant.Text, "Epic") then
						detectClassMushroom_ = 3
					elseif string.find(descendant.Text, "Legendary") then
						detectClassMushroom_ = 4
					elseif string.find(descendant.Text, "Mythic") then
						detectClassMushroom_ = 5
					else
						detectClassMushroom_ = 1
					end
					if detectMaxClassMushroom_ < detectClassMushroom_ then
						detectMaxClassMushroom_ = detectClassMushroom_
						detectMaxLvlMushroom_ = tonumber(string.match(descendant.Text, "%d+"))
						SearchMushroomCFrame(v)
					elseif detectMaxClassMushroom_ == detectClassMushroom_ then
						detectLvlMushroom_ = tonumber(string.match(descendant.Text, "%d+"))
						if detectMaxLvlMushroom_ < detectLvlMushroom_ then
							detectMaxLvlMushroom_ = detectLvlMushroom_
							SearchMushroomCFrame(v)
						elseif detectMaxLvlMushroom_ == detectLvlMushroom_ then
							SearchMushroomMaxCFrame(v)
						end
					end
					ActionFlags.MushroomClass = detectMaxClassMushroom_ --
					ActionFlags.MushroomLvl = detectMaxLvlMushroom_
				end
			end
		end
	end
	if detectMaxClassMushroom_ == 0 then
		buttonSeeMushroom.BackgroundColor3 = GuiColor.Base_
		if not AutoFlags.MushroomsBottonDown then
			buttonAutoMushrooms.BackgroundColor3 = GuiColor.Base_ end
	elseif detectMaxClassMushroom_ == 1 then
		buttonSeeMushroom.BackgroundColor3 = Color3.new(0.5, 0.25, 0.25)	-- коричневый
		if not AutoFlags.MushroomsBottonDown then
			buttonAutoMushrooms.BackgroundColor3 = Color3.new(0.5, 0.25, 0.25) end
	elseif detectMaxClassMushroom_ == 2 then
		buttonSeeMushroom.BackgroundColor3 = Color3.new(0.75, 0.75, 0.75)	-- серый
		if not AutoFlags.MushroomsBottonDown then
			buttonAutoMushrooms.BackgroundColor3 = Color3.new(0.75, 0.75, 0.75) end
	elseif detectMaxClassMushroom_ == 3 then
		buttonSeeMushroom.BackgroundColor3 = Color3.new(1, 1, 0)	-- желтый
		if not AutoFlags.MushroomsBottonDown then
			buttonAutoMushrooms.BackgroundColor3 = Color3.new(1, 1, 0) end
	elseif detectMaxClassMushroom_ == 4 then
		buttonSeeMushroom.BackgroundColor3 = Color3.new(0, 1, 1)	-- голубой
		if not AutoFlags.MushroomsBottonDown then
			buttonAutoMushrooms.BackgroundColor3 = Color3.new(0, 1, 1) end
	elseif detectMaxClassMushroom_ == 5 then
		buttonSeeMushroom.BackgroundColor3 = Color3.new(0.5, 0, 1)	-- фиолетовый
		if not AutoFlags.MushroomsBottonDown then
			buttonAutoMushrooms.BackgroundColor3 = Color3.new(0.5, 0, 1) end
	end
	if detectMaxLvlMushroom_ > 0 then
		buttonSeeMushroom.Text = tostring(detectMaxLvlMushroom_)
		buttonSeeMushroom.Transparency = 0.5
		buttonAutoMushrooms.Text = "AMush "..tostring(detectMaxLvlMushroom_)
	else
		buttonSeeMushroom.Text = "0"
		buttonSeeMushroom.Transparency = 1
		buttonAutoMushrooms.Text = "AMush"
	end
	end

	while HumanoidAction.AllStarting do
		trackingMonsters()
		wait(.2)
		MushroomDetect()
		wait(.3)
	end
end
coroutine.wrap(trackingFunction)()

local function autoDigRebut()
	while HumanoidAction.AllStarting do
		if AutoFlags.DigBottonDown then
			AutoFlags.DigBottonDown = false
			wait(.5)
			AutoFlags.DigBottonDown = true
			wait(.2)
			AutoDiging()
		end
		wait(600)
	end
end
coroutine.wrap(autoDigRebut)()

local function humanoidReboot()
	while HumanoidAction.AllStarting do
		humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
		humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
		wait(10)
	end
end
coroutine.wrap(humanoidReboot)()

--========================================--
local function FarmKillFunction()

local function SearchTicket()
for _,v in pairs(workspace.Collectibles:GetChildren()) do
	for _, descendant in pairs(v:GetDescendants()) do
		if descendant.Name == "FrontDecal" then
			if	descendant.Texture == "rbxassetid://8277780065" or		-- hardwax
				descendant.Texture == "rbxassetid://8277778300" or		-- softwax
				descendant.Texture == "rbxassetid://1674871631" or		-- билет
				descendant.Texture == "rbxassetid://2504978518" or		-- клей
				descendant.Texture == "rbxassetid://2542899798" or		-- пыль
				descendant.Texture == "rbxassetid://2584584968" or		-- ензим
				descendant.Texture == "rbxassetid://2545746569" or		-- oil_test1
				descendant.Texture == "rbxassetid://8277901755" or		-- хонейсайкле
				descendant.Texture == "rbxassetid://8054996680" or		-- кубик2
				descendant.Texture == "rbxassetid://8055428094" or		-- кубик3
				descendant.Texture == "rbxassetid://2319943273" or		-- старжели
				descendant.Texture == "rbxassetid://1471850677" or		-- диамантовоеяйцо
				descendant.Texture == "rbxassetid://2529092020" or		-- mseed
				descendant.Texture == "rbxassetid://2495936060" or		-- blueextract
				descendant.Texture == "rbxassetid://2495935291" or		-- redextract
				descendant.Texture == "rbxassetid://8277783113" or		-- swirledwax2
				descendant.Texture == "rbxassetid://8310376170" or		-- turpentine
				descendant.Texture == "rbxassetid://8277781688" or		-- causticwax
				descendant.Texture == "rbxassetid://5144657215" or		-- supersmoothie
				descendant.Texture == "rbxassetid://4935580187" or		-- potion2 purple
				descendant.Texture == "http://www.roblox.com/asset/?id=3835877932" or	-- tropicaldrink
				descendant.Texture == "rbxassetid://3036899811" or		-- rpass
				descendant.Texture == "rbxassetid://6087969886" or		-- snowflake2
				descendant.Texture == "rbxassetid://1471849394" then	-- золотоеяйцо
				if descendant.Parent.Transparency == 0 then
					return true, descendant.Parent.CFrame
				end
			end
		end
	end
end
end

local function AutoTicketFarming()
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(4)
	end
	local boolTicket_, cFrameTicket_ = SearchTicket()
	if boolTicket_ then
		HumanoidAction.Pause = true
		while true do	
			if boolTicket_ then
				humanoidRootPart.CFrame = CFramenew(cFrameTicket_.X,
					cFrameTicket_.Y, cFrameTicket_.Z)
				wait(.1)
				wait(.1)
				wait(.1)
			else
				GoToFieldAndSplinker()
				HumanoidAction.Pause = false
				return
			end
			if not AutoFlags.TicketBottonDown then
				GoToFieldAndSplinker()
				HumanoidAction.Pause = false
				return
			end
			boolTicket_, cFrameTicket_ = SearchTicket()
		end
	end
end

local function Collect_Dist40ToPos10sec(position)
	TimeLutCollection()
	local positionPoint_ = position
	wait(.2)
	for count = 1, 1000 do
		for _,v in pairs(workspace.Collectibles:GetChildren()) do	-- перебираем собираемые элементы
		if (v.Position - positionPoint_).magnitude <= 40 then		-- если растояние меньше, собираем
																	-- токен находится на уровне
		if ((v.Position.y > humanoidRootPart.Position.y - 5) and (v.Position.y < humanoidRootPart.Position.y + 15)) then
		if AutoFlags.MushroomsBottonDown then
			if lutCollection then
				humanoid:MoveTo(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z), nil)
				wait(.25)
			else
				return
			end
		else
			break
		end
		end
		end
		end
		wait(.03)
	end
end

local function AddWahhh(mushroom_)
	for _, descendant in pairs(mushroom_:GetDescendants()) do
		if descendant.Name == "TextLabel" then
			descendant.Text = descendant.Text.."     Wahhh"
			return
		end
	end
end

local function SubWahhh(mushroom_)
	for _, descendant in pairs(mushroom_:GetDescendants()) do
		if descendant.Name == "TextLabel" then
			descendant.Text = string.gsub(descendant.Text, "     Wahhh", "")
			return true
		end
	end
	return false
end

local function SearchWahhh()
if ActionFlags.MushroomLvl > 0 then
	for _,v in pairs(game.workspace.Happenings.Puffshrooms:GetChildren()) do
		if string.find(v.Name,"PuffballMushroom") then			-- ищем грибы
			for _, descendant in pairs(v:GetDescendants()) do
				if descendant.Name == "TextLabel" then			-- ищем уровень гриба
				if string.find(descendant.Text, "     Wahhh") then
					if (ActionFlags.MushroomClass == 1) or
						(ActionFlags.MushroomClass == 2 and string.find(descendant.Text, "Rare")) or
						(ActionFlags.MushroomClass == 3 and string.find(descendant.Text, "Epic")) or
						(ActionFlags.MushroomClass == 4 and string.find(descendant.Text, "Legendary")) or
						(ActionFlags.MushroomClass == 5 and string.find(descendant.Text, "Mythic")) then
						if (ActionFlags.MushroomLvl - 3) < tonumber(string.match(descendant.Text, "%d+")) then
							return true
						end
					end
				end
				end
			end
		end
	end
	return false
end
end

local function AutoFarmMushrooms()
remoteQuest()
while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
	wait(4)
end
HumanoidAction.Pause = true
local positionMushroom_ = Vector3.new(999, 999, 999)
while AutoFlags.MushroomsBottonDown and buttonSeeMushroom.Transparency == 0.5 do
	local mushroom_ = MushroomSearch()
	timeLutCollection = 3 + ActionFlags.MushroomLvl / 3 + ActionFlags.MushroomClass * 2
	if mushroom_ == nil then break end
	AddWahhh(mushroom_)
	
	for _, descendant in pairs(mushroom_:GetDescendants()) do
		if descendant:IsA("BasePart") then
			if (positionMushroom_ - descendant.Position).magnitude > 10 then
				positionMushroom_ = descendant.Position
				humanoidRootPart.CFrame = descendant.CFrame
				SplinkerInstalling()
				switchMask(positionMushroom_)
			else
				positionMushroom_ = descendant.Position
				humanoidRootPart.CFrame = descendant.CFrame
				wait(.2)
			end
			
			repeat
			for count = 1, 20 do
				if not AutoFlags.MushroomsBottonDown then HumanoidAction.Pause = false return end
				humanoid:MoveTo(Vector3.new(positionMushroom_.x + math.random(-20, 20),
					humanoidRootPart.Position.y, positionMushroom_.z + math.random(-20, 20)), nil)
				if (positionMushroom_.y - humanoidRootPart.Position.y) > 7 or
					(positionMushroom_ - humanoidRootPart.Position).magnitude > 40 then 
					humanoidRootPart.CFrame = CFrame.new(positionMushroom_)
				end
				checkKilled(5)-------------------
				BackpackUnloadingMushroom(positionMushroom_)
			end
			until not SearchWahhh()
			
			if not SubWahhh(mushroom_) then
				wait(.05)
				Collect_Dist40ToPos10sec(positionMushroom_)
			end
			break
		end
	end
end
GoToFieldAndSplinker()
switchMask()
HumanoidAction.Pause = false
end

local function AutoKillVicious()
if buttonTPVicious.Visible then
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(5)
	end
	HumanoidAction.Pause = true
	print("AutoKillVicious Start")
	switchMask(3)
	wait()
	for _,v in pairs(game.workspace.Monsters:GetChildren()) do
	if string.find(v.Name,"Vici") or string.find(v.Name,"Gifted") then
		humanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
		wait(.3)
		while true do
			local human = v:FindFirstChildOfClass("Humanoid")
			if human then
				humanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.CFrame.X,
					v.HumanoidRootPart.CFrame.Y + 20,
					v.HumanoidRootPart.CFrame.Z)
				wait(.01)
				if not AutoFlags.ViciousBottonDown then break end
			else
				break
			end
		end
		break
	end
	end
	print("AutoKillVicious Stop")
	switchMask()
	wait(0.2)
	GoToFieldOrSpawn()
	HumanoidAction.Pause = false
end
end

local function AutoKillWindy()
if buttonTPWindy.Visible then
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(4)
	end
	HumanoidAction.Pause = true
	print("AutoKillWindy Start")
	switchMask(3)
	wait(.1)
	for _,v in pairs(game.workspace.NPCBees:GetChildren()) do
		if string.find(v.Name,"Windy") then
			--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,5,0)
			humanoidRootPart.CFrame = v.CFrame * CFrame.new(0,5,0)
		end
	end
	wait(.3)
	for _,r in pairs(game.workspace.Monsters:GetChildren()) do			-- Monsters
	if string.find(r.Name,"Windy") then
		--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
		humanoidRootPart.CFrame = r.HumanoidRootPart.CFrame * CFrame.new(0,30,0)
		while true do
			local human = r:FindFirstChildOfClass("Humanoid")
			if human then
				humanoidRootPart.CFrame = CFrame.new(r.HumanoidRootPart.CFrame.X,
					r.HumanoidRootPart.CFrame.Y + 30,
					r.HumanoidRootPart.CFrame.Z)
				wait(.01)
				if not AutoFlags.WindyBottonDown then break end
			else
				break
			end
			-- Собираем токены сбора
			if humanoid.Health > 40 then
			for _,v in pairs(workspace.Collectibles:GetChildren()) do
			if (v.Position - humanoidRootPart.Position).magnitude < 150 then
				local descendants_ = v:GetDescendants()
				for index, descendant in pairs(descendants_) do
					if descendant.Name == "FrontDecal" then
						if tostring(descendant.Texture) == "rbxassetid://1629547638" then
							humanoidRootPart.CFrame = CFrame.new(descendant.Parent.Position)
							wait(.15)
						end
					end
				end
			end
			end
			end
		end
		wait()
	end
	end
	print("AutoKillWindy Stop")
	switchMask()
	wait(0.2)
	GoToFieldOrSpawn()
	HumanoidAction.Pause = false
end
	for _,v in pairs(workspace.Collectibles:GetChildren()) do			-- перебираем собираемые элементы
	if (v.Position - humanoidRootPart.Position).magnitude <= 30 then	-- если растояние меньше, собираем
																		-- токен находится на уровне
	if ((v.Position.y > humanoidRootPart.Position.y - 5) and (v.Position.y < humanoidRootPart.Position.y + 15)) then
	if AutoFlags.MobsBottonDown then
		humanoid:MoveTo(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z), nil)
		wait(.2)
	else
		break
	end
	end
	end
	end
end

local function AutoKillStickBug()
if buttonAutoStickBug.TextColor3 = GuiColor.Green_ then
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(4)
	end
	HumanoidAction.Pause = true
	print("AutoKillStickBug Start")
	switchMask(3)
	workspace.Gravity = 80
	wait(.1)
	for _,r in pairs(game.workspace.Monsters:GetChildren()) do
		if string.find(r.Name,"Stick Bug") then
			while true do
				local human = r:FindFirstChildOfClass("Humanoid")
				if human then
					humanoidRootPart.CFrame = CFrame.new(r.HumanoidRootPart.CFrame.X,
						r.HumanoidRootPart.CFrame.Y + 40,
						r.HumanoidRootPart.CFrame.Z + 20)
					wait(.01)
					if not AutoFlags.StickBugBottonDown then break end
				else
					break
				end
			end
			break
		end
	end
	wait(0.1)
	workspace.Gravity = 170
	print("AutoKillStickBug Stop")
	switchMask()
	GoToFieldOrSpawn()
	HumanoidAction.Pause = false
end
end

local function AutoKillMondo()
	for _,v in pairs(game.workspace.Monsters:GetChildren()) do
		if string.find(v.Name,"Mondo") then
			while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
				wait(4)
			end
			HumanoidAction.Pause = true
			print("AutoKillMondo Start")
			switchMask(3)
			local basePoint = CFrame.new(20,177,-165)
			humanoidRootPart.CFrame = basePoint
			wait(3)
			local safeDistanceToMondo = 40
			local relativePosition = 0
			while true do
				local human = v:FindFirstChildOfClass("Humanoid")
				if human and AutoFlags.MondoBottonDown then
					relativePosition = safeDistanceToMondo / ((v.HumanoidRootPart.CFrame.X-basePoint.X)^2+(v.HumanoidRootPart.CFrame.Z-basePoint.Z)^2)^0.5
					if relativePosition < 1 then
						humanoid:MoveTo(Vector3.new(v.HumanoidRootPart.CFrame.X+(basePoint.X-v.HumanoidRootPart.CFrame.X)*relativePosition,
							humanoidRootPart.Position.y, v.HumanoidRootPart.CFrame.Z+(basePoint.Z-v.HumanoidRootPart.CFrame.Z)*relativePosition))
					else
						humanoid:MoveTo(Vector3.new(basePoint.x, humanoidRootPart.Position.y, basePoint.z))
					end
					wait(.04)
					if checkKilled(30) then humanoidRootPart.CFrame = basePoint end
				else
					break
				end
				wait(.1)
			end
			print("AutoKillMondo Stop")
			switchMask()
			wait(0.1)
			GoToFieldOrSpawn()
			HumanoidAction.Pause = false
			break
		end
	end
end

	while HumanoidAction.AllStarting do
		while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
			wait(2)
		end
		wait(.1)---------------Mondo
		if AutoFlags.MondoBottonDown then AutoKillMondo() end
		wait(.1)---------------StickBug
		if AutoFlags.StickBugBottonDown then AutoKillStickBug() end
		wait(.1)---------------Mushrooms
		if AutoFlags.MushroomsBottonDown and buttonSeeMushroom.Transparency == 0.5 then
			AutoFarmMushrooms()
		end
		wait(.1)---------------Ticket
		if AutoFlags.TicketBottonDown then
			AutoTicketFarming()
		end
		wait(.1)---------------Windy
		if AutoFlags.WindyBottonDown then
			while buttonTPWindy.Visible do
				if not AutoFlags.WindyBottonDown then break end
				AutoKillWindy()
				wait(.01)
			end
		end
		wait(.1)---------------Vicious
		if AutoFlags.ViciousBottonDown then AutoKillVicious() end
		wait(2)
	end
end
coroutine.wrap(FarmKillFunction)()
--========================================--

local function FarmBottonDown()

local FiedlChecking = coroutine.wrap(function()
while HumanoidAction.Farm do
	wait(5)
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(1)
		if not HumanoidAction.Farm then return end
	end
	if not HumanoidAction.Farm then return end
	checkKilled(20)
	-- если упал
	if (humanoidRootPart.Position.y - fieldPosition.y) < 1 then
		tpToField()
		print("Упал")
		wait(.1)
	end
	-- если убежали далеко с поля
	if (MinMaxField.min_X - 30) > humanoidRootPart.Position.x or humanoidRootPart.Position.x > (MinMaxField.max_X + 30) or
		(MinMaxField.min_Z - 30) > humanoidRootPart.Position.z or humanoidRootPart.Position.z > (MinMaxField.max_Z + 30) then
		tpToField()
		print("Убежал")
		wait(.1)
	end
end
end)

local function UpdateChecking()
if tmpField_ ~= textView.Text then
	humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
	humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
	fieldCFrame = CFrame.new(workspace.FlowerZones[textView.Text].Position)	-- поле CFrame
	fieldPosition = workspace.FlowerZones[textView.Text].Position			-- поле Position
	sizeField = workspace.FlowerZones[textView.Text].Size					-- размер поля
	MinMaxField.min_X = fieldPosition.x - (sizeField.x / 2) + MinMaxField.distanceToBoard
	MinMaxField.max_X = fieldPosition.x + (sizeField.x / 2) - MinMaxField.distanceToBoard
	MinMaxField.min_Z = fieldPosition.z - (sizeField.z / 2) + MinMaxField.distanceToBoard
	MinMaxField.max_Z = fieldPosition.z + (sizeField.z / 2) - MinMaxField.distanceToBoard
	tmpField_ = textView.Text
end
end

local GoToToken = coroutine.wrap(function()
if not HumanoidAction.Pause then tpToField() end
wait(.5)
local tmpField_ = ""
FiedlChecking()
repeat
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(1)
		if not HumanoidAction.Farm then return end
	end
	--UpdateChecking()
	-----------------------------------------
	humanoid:MoveTo(Vector3.new(fieldPosition.x, humanoidRootPart.Position.y, fieldPosition.z), nil)	-- идём в центр
	wait(.01)
		--for reiterate = 1, 2 do
	-----------------------------------------Token-----------------------------------------
	for k,v in pairs(workspace.Collectibles:GetChildren()) do		-- перебираем собираемые элементы
	if (v.Position.x > MinMaxField.min_X) and (v.Position.x < MinMaxField.max_X) and (v.Position.z > MinMaxField.min_Z) and (v.Position.z < MinMaxField.max_Z) then
	if ((v.Position.y > fieldPosition.y - 3) and (v.Position.y < fieldPosition.y + 5)) then			-- токен находится на уровне
		if not HumanoidAction.Farm or HumanoidAction.Pause then break end	
		MoveToToken(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z))
		BackpackBalloonCheckingUnloading()		
	end
	end
	end
	-----------------------------------------Bubble-----------------------------------------
	for k,v in pairs(workspace.Particles:GetChildren()) do		-- перебираем собираемые элементы
	if string.find(v.Name,"Bubble") then
	if (v.Position.x > MinMaxField.min_X) and (v.Position.x < MinMaxField.max_X) and (v.Position.z > MinMaxField.min_Z) and (v.Position.z < MinMaxField.max_Z) then
	if ((v.Position.y > fieldPosition.y - 5) and (v.Position.y < fieldPosition.y + 5)) then		-- токен находится на уровне
		if not HumanoidAction.Farm or HumanoidAction.Pause then break end
		MoveToToken(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z))
		BackpackBalloonCheckingUnloading()	
	end
	end
	end
	end
		--if not HumanoidAction.Farm or HumanoidAction.Pause then break end
		--end
until HumanoidAction.Farm == false
tmpField_ = ""
end)

local GoToPoint = coroutine.wrap(function()
if not HumanoidAction.Pause then tpToField() end
wait(.5)
local tmpField_ = ""
FiedlChecking()
repeat
	while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
		wait(1)
		if not HumanoidAction.Farm then return end
	end
	--UpdateChecking()
	-----------------------------------------
	humanoid:MoveTo(Vector3.new(fieldPosition.x, humanoidRootPart.Position.y, fieldPosition.z), nil)	-- идём в центр
	wait(.01)
		--for reiterate = 1, 2 do
	-----------------------------------------Token-----------------------------------------
	for i = 1, 2 do
	for k,v in pairs(workspace.Collectibles:GetChildren()) do		-- перебираем собираемые элементы
	if (v.Position.x > MinMaxField.min_X) and (v.Position.x < MinMaxField.max_X) and (v.Position.z > MinMaxField.min_Z) and (v.Position.z < MinMaxField.max_Z) then
	if ((v.Position.y > fieldPosition.y - 3) and (v.Position.y < fieldPosition.y + 5)) then			-- токен находится на уровне
		if not HumanoidAction.Farm or HumanoidAction.Pause then break end	
		humanoid:MoveTo(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z), nil)	-- собираем
		wait(.25)--.25
		BackpackBalloonCheckingUnloading()		
	end
	end
	end
	end
	-----------------------------------------Bubble-----------------------------------------
	for i = 1, 1 do
	for k,v in pairs(workspace.Particles:GetChildren()) do		-- перебираем собираемые элементы
	if string.find(v.Name,"Bubble") then
	if (v.Position.x > MinMaxField.min_X) and (v.Position.x < MinMaxField.max_X) and (v.Position.z > MinMaxField.min_Z) and (v.Position.z < MinMaxField.max_Z) then
	if ((v.Position.y > fieldPosition.y - 5) and (v.Position.y < fieldPosition.y + 5)) then		-- токен находится на уровне
		if not HumanoidAction.Farm or HumanoidAction.Pause then break end
		humanoid:MoveTo(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z), nil)	-- собираем
		wait(.2)--.2
		BackpackBalloonCheckingUnloading()
	end
	end
	end
	end
	end
		--if not HumanoidAction.Farm or HumanoidAction.Pause then break end
		--end
until HumanoidAction.Farm == false
tmpField_ = ""
end)

	if HumanoidAction.FarmToSp then
		GoToPoint()
	else
		GoToToken()
	end
end

start_Frame:TweenPosition(UDim2.new(1, -360, 0.09, 0),
		Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .5, true)

local function toggleKeyRXC(input, gameProcessed)
	if HumanoidAction.AllStarting then
		if input.KeyCode == Enum.KeyCode.R then
			if HumanoidAction.Farm then
				buttonFarm.BackgroundColor3 = GuiColor.Base_
				HumanoidAction.Farm = false
				buttonFarmToSp.BackgroundColor3 = GuiColor.Base_
				HumanoidAction.FarmToSp = false
			else
				buttonFarm.BackgroundColor3 = Color3.new(0, 1, 0)
				HumanoidAction.Farm = true
				FarmBottonDown()
			end
		end
		if input.KeyCode == Enum.KeyCode.X then	-- LeftAlt
			if dark_Frame.Transparency == 1 then
				dark_Frame.Transparency = 0
				start_Frame.Visible = false
				dark_Frame.Size = UDim2.new(1, 0, 1.2, 0)
			else
				dark_Frame.Transparency = 1
				start_Frame.Visible = true
				dark_Frame.Size = UDim2.new(0, 1, 0, 1)
			end
		end
		if input.KeyCode == Enum.KeyCode.F8 then
			start_Frame.Visible = not start_Frame.Visible
		end
		if input.KeyCode == Enum.KeyCode.C then
			hideMenu()
		end
	end
end
ConnectionKey.ConnectionRXC = game:GetService("UserInputService").InputEnded:Connect(toggleKeyRXC)

ConnectionKey.VirtualUserActive = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	ConnectionKey.VirtualUserActive:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	ConnectionKey.VirtualUserActive:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	--print("Player has been idle for " .. time() .. " seconds")
end)


spawn(function()------------------main_Frame-------------------
	local buttonDestroy = CreateButton({Size=UDim2.new(0, 25, 0, 25),Position=UDim2.new(0, 190, 0, 0),
		Text="X",Name="buttonDestroy",Parent=main_Frame,TextSize=18,BackgroundColor3=GuiColor.Red_})
	local buttonTP = CreateButton({Size=UDim2.new(0, 43, 0, 20),Position=UDim2.new(0, 40, 0, 30),
		Text="Seg",Name="buttonTP",Parent=main_Frame,TextSize = 14})
	local buttonDisableFolding = CreateButton({Size=UDim2.new(0, 10, 0, 20),Position=UDim2.new(0, 85, 0, 30),
		Text="",Name="buttonDisableFolding",Parent=main_Frame})
	local buttonHomePoint = CreateButton({Size=UDim2.new(0, 25, 0, 20),Position=UDim2.new(0, 190, 0, 30),
		Text="(0)",Name="buttonHomePoint",Parent=main_Frame,TextSize = 14})

------------------Закрытие VioletMainGUI------------------
	buttonDestroy.MouseButton1Down:Connect(function()
		AutoFlags.DigBottonDown = false
		AutoFlags.MobsBottonDown = false
		AutoFlags.ViciousBottonDown = false
		AutoFlags.WindyBottonDown = false
		AutoFlags.StickBugBottonDown = false
		AutoFlags.MondoBottonDown = false
		AutoFlags.DispenserBottonDown = false
		AutoFlags.BoostBottonDown = false
		AutoFlags.TornadoBottonDown = false
		AutoFlags.TicketBottonDown = false
		AutoFlags.MushroomsBottonDown = false
		AutoFlags.ChristmasBottonDown = false
		HumanoidState.Speed = 0
		ActionFlags.BalloonBottonDown = false
		ActionFlags.StateBalloonBotton = 0
		MinMaxField.distanceToBoard = 5
		HumanoidAction.Farm = false
		HumanoidAction.Pause = false
		ConnectionKey.ConnectionT:Disconnect()
		ConnectionKey.ConnectionV:Disconnect()
		ConnectionKey.ConnectionRXC:Disconnect()
		ConnectionKey.VirtualUserActive:CaptureController()
		HumanoidAction.AllStarting = false
		wait(1)
		HumanoidAction.AllStarting = nil
		VioletMainGUI:Destroy()
		wait(1)
		ConnectionKey.VirtualUserActive:CaptureController()
		return
	end)
	
	buttonTPTop.MouseButton1Down:Connect(function()
		humanoidRootPart.CFrame = CFrame.new(-20, 232, -120)
	end)
	
	buttonTPPep.MouseButton1Down:Connect(function()
		humanoidRootPart.CFrame = CFrame.new(-486, 124, 517)
	end)
	
	buttonTPVicious.MouseButton1Down:Connect(function() goMonsterInZone(Zone.Monsters_,Monsters.Vicious_) end)
	
	buttonTPWindy.MouseButton1Down:Connect(function()
		if	checkMonsterInZone(Zone.NPCBees_,Monsters.Windy_) then
			goMonsterInZone(Zone.NPCBees_,Monsters.Windy_)
		else
			goMonsterInZone(Zone.Monsters_,Monsters.Windy_)
		end
	end)
	
	buttonSeeMushroom.MouseButton1Down:Connect(function() GoToMushroom() end)
	buttonMenu.MouseButton1Down:Connect(function() hideMenu() end)
	buttonTP.MouseButton1Down:Connect(function() tpToField() end)
	
	buttonDisableFolding.MouseButton1Down:Connect(function()
		if not AutoFlags.buttonDisableFolding then
			buttonDisableFolding.BackgroundColor3 = Color3.new(0, 1, 1)
			AutoFlags.buttonDisableFolding = true
		else
			buttonDisableFolding.BackgroundColor3 = GuiColor.Base_
			AutoFlags.buttonDisableFolding = false
		end
	end)

	buttonFarm.MouseButton1Down:Connect(function()
		if not HumanoidAction.FarmToSp then
			if HumanoidAction.Farm then
				buttonFarm.BackgroundColor3 = GuiColor.Base_
				HumanoidAction.Farm = false
			else
				buttonFarm.BackgroundColor3 = Color3.new(0, 1, 0)
				HumanoidAction.Farm = true
				FarmBottonDown()
			end
		end
	end)
	
	buttonFarmToSp.MouseButton1Down:Connect(function()
		if not farmBottonDown then
			if HumanoidAction.FarmToSp then
				buttonFarmToSp.BackgroundColor3 = GuiColor.Base_
				HumanoidAction.FarmToSp = false
				HumanoidAction.Farm = false
			else
				buttonFarmToSp.BackgroundColor3 = Color3.new(0, 1, 1)
				HumanoidAction.FarmToSp = true
				HumanoidAction.Farm = true
				FarmBottonDown()
			end
		end
	end)

	buttonHomePoint.MouseButton1Down:Connect(function() GoToSpawnPosition()	end)
end)

spawn(function()------------------menu_Frame-------------------
	ButtonState.Forms(MenuSet,1,1,1)
	local buttonField = CreateButton({Size=ButtonState.Size(MenuSet),Position=ButtonState.Position(MenuSet),
		Text="Field",Name="buttonField",Parent=menu_Frame,TextSize = 14})
	ButtonState.Forms(MenuSet,2,1,1)
	local buttonActions = CreateButton({Size=ButtonState.Size(MenuSet),Position=ButtonState.Position(MenuSet),
		Text="Actions",Name="buttonActions",Parent=menu_Frame,TextSize = 14})
	ButtonState.Forms(MenuSet,3,1,1)
	local buttonSettings = CreateButton({Size=ButtonState.Size(MenuSet),Position=ButtonState.Position(MenuSet),
		Text="Settings",Name="buttonSettings",Parent=menu_Frame,TextSize = 14})

	buttonField.MouseButton1Down:Connect(function()displayFrame(buttonField,field_Frame)end)
	buttonActions.MouseButton1Down:Connect(function()displayFrame(buttonActions,actions_Frame)end)
	buttonSettings.MouseButton1Down:Connect(function()displayFrame(buttonSettings,settings_Frame)end)

	local function toggleVisibleSettings_Frame(input, gameProcessed)
		if HumanoidAction.AllStarting and input.KeyCode == Enum.KeyCode.V then
			if not settings_Frame.Visible then
				displayFrame(buttonSettings,settings_Frame)
				buttonMenu.BackgroundColor3 = GuiColor.On_Color_G
				menu_Frame.Visible = true
			else
				if not menu_Frame.Visible then
					buttonMenu.BackgroundColor3 = GuiColor.On_Color_G
					menu_Frame.Visible = true
				else
					buttonMenu.BackgroundColor3 = GuiColor.Base_
					menu_Frame.Visible = false
				end
			end
		end
	end
	ConnectionKey.ConnectionV = game:GetService("UserInputService").InputEnded:Connect(toggleVisibleSettings_Frame)
end)

spawn(function()------------------field_Frame------------------
	ButtonState.Forms(FieldButtonSet,1,1,1)
	local buttonSunflower = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Sunflower Field",Name="buttonSunflower",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,2,1,1)
	local buttonDandelion = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Dandelion Field",Name="buttonDandelion",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,3,1,1)
	local buttonMushroom = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Mushroom Field",Name="buttonMushroom",Parent=field_Frame,TextColor3=GuiColor.Red_})
	ButtonState.Forms(FieldButtonSet,4,1,1)
	local buttonBlue = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Blue Flower Field",Name="buttonBlue",Parent=field_Frame,TextColor3=GuiColor.Blue_})
	ButtonState.Forms(FieldButtonSet,5,1,1)
	local buttonClover = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Clover Field",Name="buttonClover",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,6,1,2)
	local buttonSpider = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Spider Field",Name="buttonSpider",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,7,1,2)
	local buttonStrawBerry = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Strawberry Field",Name="buttonStrawBerry",Parent=field_Frame,TextColor3=GuiColor.Red_})
	ButtonState.Forms(FieldButtonSet,8,1,2)
	local buttonBamBoo = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Bamboo Field",Name="buttonBamBoo",Parent=field_Frame,TextColor3=GuiColor.Blue_})
	ButtonState.Forms(FieldButtonSet,9,1,2)
	local buttonPineapple = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Pineapple Patch",Name="buttonPineapple",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,10,1,2)
	local buttonStump = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Stump Field",Name="buttonStump",Parent=field_Frame,TextColor3=GuiColor.Blue_})

	ButtonState.Forms(FieldButtonSet,1,2,1)
	local buttonRose = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Rose Field",Name="buttonRose",Parent=field_Frame,TextColor3=GuiColor.Red_})
	ButtonState.Forms(FieldButtonSet,2,2,1)
	local buttonPineTree = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Pine Tree Forest",Name="buttonPineTree",Parent=field_Frame,TextColor3=GuiColor.Blue_})
	ButtonState.Forms(FieldButtonSet,3,2,1)
	local buttonCactus = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Cactus Field",Name="buttonCactus",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,4,2,1)
	local buttonPumpkin = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Pumpkin Patch",Name="buttonPumpkin",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,5,2,1)
	local buttonMountainTop = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Mountain Top Field",Name="buttonMountainTop",Parent=field_Frame,TextSize = 11})
	ButtonState.Forms(FieldButtonSet,6,2,2)
	local buttonCoconut = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Coconut Field",Name="buttonCoconut",Parent=field_Frame})
	ButtonState.Forms(FieldButtonSet,7,2,2)
	local buttonPepper = CreateButton({Size=ButtonState.Size(FieldButtonSet),Position=ButtonState.Position(FieldButtonSet),
		Text="Pepper Patch",Name="buttonPepper",Parent=field_Frame,TextColor3=GuiColor.Red_})

	local function segToField(field)
		textView.Text = field
		tpToField()
		setMinMaxField(MinMaxField.distanceToBoard)
	end

	buttonSunflower.MouseButton1Down:Connect(function()segToField("Sunflower Field")end)
	buttonDandelion.MouseButton1Down:Connect(function()segToField("Dandelion Field")end)
	buttonMushroom.MouseButton1Down:Connect(function()segToField("Mushroom Field")end)
	buttonBlue.MouseButton1Down:Connect(function()segToField("Blue Flower Field")end)
	buttonClover.MouseButton1Down:Connect(function()segToField("Clover Field")end)
	buttonSpider.MouseButton1Down:Connect(function()segToField("Spider Field")end)
	buttonStrawBerry.MouseButton1Down:Connect(function()segToField("Strawberry Field")end)
	buttonBamBoo.MouseButton1Down:Connect(function()segToField("Bamboo Field")end)
	buttonPineapple.MouseButton1Down:Connect(function()segToField("Pineapple Patch")end)
	buttonStump.MouseButton1Down:Connect(function()segToField("Stump Field")end)
	buttonRose.MouseButton1Down:Connect(function()segToField("Rose Field")end)
	buttonPineTree.MouseButton1Down:Connect(function()segToField("Pine Tree Forest")end)
	buttonCactus.MouseButton1Down:Connect(function()segToField("Cactus Field")end)
	buttonPumpkin.MouseButton1Down:Connect(function()segToField("Pumpkin Patch")end)
	buttonMountainTop.MouseButton1Down:Connect(function()segToField("Mountain Top Field")end)
	buttonCoconut.MouseButton1Down:Connect(function()segToField("Coconut Field")end)
	buttonPepper.MouseButton1Down:Connect(function()segToField("Pepper Patch")end)
end)

spawn(function()------------------actions_Frame----------------
	local xyz = CFrame.new(0, 0, 0)
	ButtonState.Forms(ButtonSet,1,1,1)
	local buttonTestXYZ = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Position XYZ",Name="buttonTestXYZ",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,2,1,1)
	local textTestX = CreateInstance("TextBox",{Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Font = Enum.Font.GothamBold,TextColor3=GuiColor.Text_White_,TextSize = 12,
		MultiLine = true,TextWrapped = true,ClearTextOnFocus = false,TextEditable = false,
		BackgroundColor3=GuiColor.Base_,BackgroundTransparency = 0.8,BorderSizePixel=0,
		Text = "X",Name="textTestX",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,3,1,1)
	local textTestY = CreateInstance("TextBox",{Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Font = Enum.Font.GothamBold,TextColor3=GuiColor.Text_White_,TextSize = 12,
		MultiLine = true,TextWrapped = true,ClearTextOnFocus = false,TextEditable = false,
		BackgroundColor3=GuiColor.Base_,BackgroundTransparency = 0.8,BorderSizePixel=0,
		Text = "Y",Name="textTestY",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,4,1,1)
	local textTestZ = CreateInstance("TextBox",{Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Font = Enum.Font.GothamBold,TextColor3=GuiColor.Text_White_,TextSize = 12,
		MultiLine = true,TextWrapped = true,ClearTextOnFocus = false,TextEditable = false,
		BackgroundColor3=GuiColor.Base_,BackgroundTransparency = 0.8,BorderSizePixel=0,
		Text = "Z",Name="textTestZ",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,5,1,1)
	local buttonTPToXYZ = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Seg To",Name="buttonTPToXYZ",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,6,1,1)
	local textKey = CreateInstance("TextBox",{Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Font = Enum.Font.GothamBold,TextColor3=GuiColor.Text_White_,TextSize = 12,
		MultiLine = true,TextWrapped = false,ClearTextOnFocus = false,TextEditable = false,
		BackgroundColor3=GuiColor.Base_,BackgroundTransparency = 0.8,BorderSizePixel=0,
		Text = "F8, X, C, V, R.",Name="textKey",Parent=actions_Frame})

	ButtonState.Forms(ButtonSet,1,2,1)
	local buttonFieldDeccosDel = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="DecosDel",Name="buttonFieldDeccosDel",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,2,2,1)
	local buttonTPMenuLoad = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="TPMenu",Name="buttonTPMenuLoad",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,3,2,1)
	local buttonReset = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Reset",Name="buttonReset",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,4,2,1)
	local buttonFind = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Find",Name="buttonFind",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,5,2,1)
	local buttonCDestroy = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="CDestroy",Name="buttonCDestroy",Parent=actions_Frame})
	ButtonState.Forms(ButtonSet,6,2,1)
	local buttonSkan = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Skan",Name="buttonSkan",Parent=actions_Frame})

	buttonTestXYZ.MouseButton1Down:Connect(function()
		xyz = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart.CFrame
		textTestX.Text = xyz.X
		textTestY.Text = xyz.Y
		textTestZ.Text = xyz.Z
	end)

	buttonTPToXYZ.MouseButton1Down:Connect(function()
		if	xyz.Y ~= 0 then
			humanoidRootPart.CFrame = xyz
		end
	end)

	buttonFieldDeccosDel.MouseButton1Down:Connect(function()
	if	buttonFieldDeccosDel.AutoButtonColor then
		for _,v in pairs(workspace.FieldDecos:GetChildren()) do
			v:Destroy()
		end
		for _,v in pairs(workspace.Decorations.Misc:GetChildren()) do
			v:Destroy()
		end
		ButtonState.Off(buttonFieldDeccosDel)
		--BasePart MeshPart UnionOperation
		--Model ManualWeld Weld
		--Decorations
		--Territories
	end
end)

	buttonCDestroy.MouseButton1Down:Connect(function()
		for _,v in pairs(workspace.Collectibles:GetChildren()) do
			v:Destroy()
		end
	end)

	buttonTPMenuLoad.MouseButton1Down:Connect(function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/Status2020/Test/main/_BSS%20%E2%80%94%20Subsidiary.lua'),true))()
	end)

	buttonReset.MouseButton1Down:Connect(function()
		humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
		humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
		HumanoidAction.Pause = false
		HumanoidAction.CapacityUnloading = false
	end)

	buttonFind.MouseButton1Down:Connect(function()
		ButtonState.Off(buttonFind)
		--humanoidRootPart.Anchored = true
		for _,v in pairs(workspace.Collectibles:GetChildren()) do
			for _, descendant in pairs(v:GetDescendants()) do
				if descendant.Name == "FrontDecal" then
					if descendant.Texture == "rbxassetid://8277780065" or		-- hardwax
						descendant.Texture == "rbxassetid://8277778300 " or		-- softwax
						descendant.Texture == "rbxassetid://1674871631" or		-- билет
						descendant.Texture == "rbxassetid://2504978518" or		-- клей
						descendant.Texture == "rbxassetid://2542899798" or		-- пыль
						descendant.Texture == "rbxassetid://2584584968" or		-- ензим
						--descendant.Texture == "rbxassetid://1952682401" or		-- семечки
						--descendant.Texture == "rbxassetid://1952740625" or		-- клубника
						--descendant.Texture == "rbxassetid://1952796032" or		-- ананас
						--descendant.Texture == "rbxassetid://2028453802" or		-- черника
						descendant.Texture == "rbxassetid://6087969886" or		-- snowflake2
						descendant.Texture == "rbxassetid://3036899811" or		-- rpass
						descendant.Texture == "rbxassetid://1838129169" or		-- конфеты
						descendant.Texture == "rbxassetid://8277901755" or		-- хонейсайкле
						descendant.Texture == "rbxassetid://8054996680" or		-- кубик2
						descendant.Texture == "rbxassetid://8055428094" or		-- кубик3
						descendant.Texture == "rbxassetid://2319943273" or		-- старжели
						descendant.Texture == "rbxassetid://1471882621" or		-- жели
						descendant.Texture == "rbxassetid://2060626811" or		-- антпасс
						descendant.Texture == "rbxassetid://3012679515" or		-- какос
						descendant.Texture == "rbxassetid://3080740120" or		-- бобы
						descendant.Texture == "rbxassetid://3030569073" or		-- облоко
						descendant.Texture == "rbxassetid://2863122826" or		-- конвертор
						descendant.Texture == "rbxassetid://1471850677" or		-- диамантовоеяйцо
						descendant.Texture == "rbxassetid://1471849394" then	-- золотоеяйцо
						wait(.1)
						if descendant.Parent.Transparency == not nil then 
							if descendant.Parent.Transparency == 0 then
								humanoidRootPart.CFrame = descendant.Parent.CFrame
								wait(.5)
								return
							else
								descendant.Parent:Destroy()
							end
						end
					end
				end
			end
		end
		--humanoidRootPart.Anchored = false
		ButtonState.Activation(buttonFind)
	end)

	-- перебор компонентов Collectibles
	local function textureCollectiblesFunction()
		local tmpText = ""
		for _,v in pairs(workspace.Collectibles:GetChildren()) do
			for index, descendant in pairs(v:GetDescendants()) do
				if descendant.Name == "FrontDecal" then
					tmpText = tmpText..tostring(descendant.Texture)
				end
			end
		end
		textKey.Text = tmpText
	end

	-- перебор компонентов Particles
	--[[local TextureParticlesFunction = coroutine.wrap(function()
	local tmpText = ""
	for _,v in pairs(workspace.Particles:GetChildren()) do
		for index, descendant in pairs(v:GetDescendants()) do
			if descendant.Name == "FrontDecal" then
				tmpText = tmpText..tostring(descendant.Texture)
			end
		end
	end
	textKey.Text = tmpText
	end)]]
	
	-- перебор компонентов workspace Поиск мёда 
	--[[local TextureFindHoneyFunction = coroutine.wrap(function()
	textKey.Text = ""
		for _, descendant in pairs(game.workspace:GetDescendants()) do
			--if not descendant:IsA("BasePart") then
			--if descendant.Name == "FrontDecal" then
			if descendant.Parent.Name == "Gumball Machine" then
			else
				--if descendant.Texture == "rbxassetid://2028574353" then
				if string.find(descendant.Texture, "rbxassetid") then
					textKey.Text = textKey.Text..tostring(descendant.Parent.Parent.Parent.Name).."."
					textKey.Text = textKey.Text..tostring(descendant.Parent.Parent.Name).."."
					textKey.Text = textKey.Text..tostring(descendant.Parent.Name).."."
					textKey.Text = textKey.Text..tostring(descendant.Name).."."
					textKey.Text = textKey.Text..tostring(descendant.Texture)..":::::"
				end
			end
			--end
			--end
		end
	end)]]
	
	local function toggleTextureCollectibles(input, gameProcessed)
		if HumanoidAction.AllStarting and input.KeyCode == Enum.KeyCode.T then
			coroutine.wrap(textureCollectiblesFunction)()
		end
	end
	ConnectionKey.ConnectionT = game:GetService("UserInputService").InputEnded:Connect(toggleTextureCollectibles)
	
	buttonSkan.MouseButton1Down:Connect(function()
		coroutine.wrap(textureCollectiblesFunction)()
		--TextureParticlesFunction()
		--TextureFindHoneyFunction()
	end)
end)

spawn(function()------------------settings_Frame---------------
	ButtonState.Forms(ButtonSet,1,1,1)
	local buttonAutoDig = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Auto Dig",Name="buttonAutoDig",Parent=settings_Frame})
	ButtonState.Forms(ButtonSet,2,1,1)
	local buttonAutoDispenser = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Auto Dispenser",Name="buttonAutoDispenser",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,3,1,1)
	local buttonSpeed = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Speed: ",Name="buttonSpeed",Parent=settings_Frame})
	ButtonState.Forms(ButtonSet,4,1,1)
	local buttonBalloon = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Balloon",Name="buttonBalloon",Parent=settings_Frame})
	ButtonState.Forms(ButtonSet,5,1,1)
	local buttonAutoChristmas = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Auto Christmas",Name="buttonAutoChristmas",Parent=settings_Frame,TextSize = 10,Visible = true})
	ButtonState.Forms(ButtonSet,6,1,1)
	local buttonDistance = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Dist to board: ",Name="buttonDistance",Parent=settings_Frame,TextSize = 10})

	ButtonState.Forms(ButtonSet,1,2,1)
	local buttonAutoBoost = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="ABoost",Name="buttonAutoBoost",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,2,2,1)
	local buttonAutoMondo = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="AMondo",Name="buttonAutoMondo",Parent=settings_Frame})
	ButtonState.Forms(ButtonSet,3,2,1)
	local buttonAutoMobs = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="AMobs",Name="buttonAutoMobs",Parent=settings_Frame,TextSize = 10})

	ButtonState.Forms(ButtonSet,2,3,1)
	local buttonAutoTornado = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="ATornado",Name="buttonAutoTornado",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,3,3,1)
	local buttonBalloonAndStart = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Balloon&Start",Name="buttonBalloonAndStart",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,4,3,1)
	local buttonSnailTime = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="buttonSnailTime",Name="buttonSnailTime",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,5,3,1)
	local buttonAutoTicket = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="ATicket",Name="buttonAutoTicket",Parent=settings_Frame,TextSize = 10})
	ButtonState.Forms(ButtonSet,6,3,2)
	local buttonDiamondMaskEquip = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Diamond Mask",Name="buttonDiamondMaskEquip",Parent=settings_Frame,TextSize = 10,--TextColor3=GuiColor.Text_Blue_,
		BackgroundColor3=GuiColor.Blue_})
	ButtonState.Forms(ButtonSet,7,3,2)
	local buttonGummyMaskEquip = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Gummy Mask",Name="buttonGummyMaskEquip",Parent=settings_Frame,TextSize = 10,
		BackgroundColor3=GuiColor.Color_LBlack_})
	ButtonState.Forms(ButtonSet,8,3,2)
	local buttonDemonMaskEquip = CreateButton({Size=ButtonState.Size(ButtonSet),Position=ButtonState.Position(ButtonSet),
		Text="Demon Mask",Name="buttonDemonMaskEquip",Parent=settings_Frame,TextSize = 10,--TextColor3=GuiColor.Text_Red_,
		BackgroundColor3=GuiColor.Red_})

	buttonAutoDig.MouseButton1Down:Connect(function()
		if AutoFlags.DigBottonDown == false then
			AutoFlags.DigBottonDown = true
			buttonAutoDig.BackgroundColor3 = Color3.new(0, 1, 0)
			AutoDiging()
		else
			AutoFlags.DigBottonDown = false
			buttonAutoDig.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoDispenser.MouseButton1Down:Connect(function()
		if AutoFlags.DispenserBottonDown == false then
			AutoFlags.DispenserBottonDown = true
			buttonAutoDispenser.BackgroundColor3 = Color3.new(0, 1, 0)
			while AutoFlags.DispenserBottonDown do
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Glue Dispenser")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Wealth Clock")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Strawberry Dispenser")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Blueberry Dispenser")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Treat Dispenser")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Free Ant Pass Dispenser")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Honey Dispenser")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Free Royal Jelly Dispenser")
		
				--game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Beesmas Feast")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Gingerbread House")
				wait(30)
			end
		else
			AutoFlags.DispenserBottonDown = false
			buttonAutoDispenser.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonSpeed.MouseButton1Down:Connect(function()
		if HumanoidState.Speed == 0 then
			HumanoidState.Speed = 50
			buttonSpeed.Text = "Speed: 50"
			buttonSpeed.BackgroundColor3 = Color3.new(0, 1, 0)
			coroutine.wrap(applySpeed)()
		elseif HumanoidState.Speed == 50 then		
			HumanoidState.Speed = 75
			buttonSpeed.Text = "Speed: 75"
			buttonSpeed.BackgroundColor3 = Color3.new(1, 1, 0)
		elseif HumanoidState.Speed == 75 then		
			HumanoidState.Speed = 98
			buttonSpeed.Text = "Speed: 98"
			buttonSpeed.BackgroundColor3 = Color3.new(1, 0, 0)
		elseif HumanoidState.Speed == 98 then			
			HumanoidState.Speed = 0
			buttonSpeed.Text = "Speed: "
			buttonSpeed.BackgroundColor3 = GuiColor.Base_
		end
		HumanoidState.TmpSpeed = HumanoidState.Speed
	end)

	buttonBalloon.MouseButton1Down:Connect(function()
		local balloonTracking_ = coroutine.wrap(function()
			if not ActionFlags.BalloonTrackingStarted_ then
				ActionFlags.BalloonTrackingStarted_ = true
				while ActionFlags.StateBalloonBotton == 1 do
					local tmpTimeBalloonBotton_ = math.floor(time() - ActionFlags.TimeAfterBalloonUnloading)
					if tmpTimeBalloonBotton_ >= 1500 then
						BackpackBalloonUnloading()
						wait(.05)
					end
					wait(10)
				end
				ActionFlags.BalloonTrackingStarted_ = false
			end
		end)

		local balloonTracking = coroutine.wrap(function()
			if not ActionFlags.BalloonTrackingStarted then
				ActionFlags.BalloonTrackingStarted = true
				print("Balloon tracking started")
				while ActionFlags.StateBalloonBotton == 2 do
					local tmpTimeBalloonBotton_ = math.floor(time() - ActionFlags.TimeAfterBalloonUnloading)
					if tmpTimeBalloonBotton_ <= 1800  then
						ActionFlags.BalloonBottonDown = false
					elseif tmpTimeBalloonBotton_ > 1800 and
						tmpTimeBalloonBotton_ < 2700 then
						ActionFlags.BalloonBottonDown = true
					elseif tmpTimeBalloonBotton_ >= 2700 then
						ActionFlags.BalloonBottonDown = true
						BackpackBalloonUnloading()
						wait(.05)
						ActionFlags.BalloonBottonDown = false
					end
					wait(10)
				end
				print("Balloon tracking stoped")
				ActionFlags.BalloonTrackingStarted = false
			end
		end)

		if ActionFlags.StateBalloonBotton == 0 then
			ActionFlags.BalloonBottonDown = true
			buttonBalloon.BackgroundColor3 = Color3.new(0, 1, 0)
			ActionFlags.StateBalloonBotton = 1	
			TimeAfterBalloonUnloading()
			balloonTracking_()
		elseif ActionFlags.StateBalloonBotton == 1 then
			ActionFlags.BalloonBottonDown = false
			buttonBalloon.Text = "Balloon:30-45"
			buttonBalloon.TextSize = 10
			buttonBalloon.BackgroundColor3 = Color3.new(1, 1, 0)
			ActionFlags.StateBalloonBotton = 2
			TimeAfterBalloonUnloading()
			balloonTracking()
		elseif ActionFlags.StateBalloonBotton == 2 then
			ActionFlags.BalloonBottonDown = false
			buttonBalloon.BackgroundColor3 = GuiColor.Base_
			buttonBalloon.Text = "Balloon"
			buttonBalloon.TextSize = 12
			ActionFlags.StateBalloonBotton = 0
		end
	end)

	buttonDistance.MouseButton1Down:Connect(function()
		if MinMaxField.distanceToBoard == 5 then
			MinMaxField.distanceToBoard = 30
			buttonDistance.Text = "Dist to board: 30"
			buttonDistance.BackgroundColor3 = Color3.new(0, 1, 0)
		else			
			MinMaxField.distanceToBoard = 5
			buttonDistance.Text = "Dista to board: "
			buttonDistance.BackgroundColor3 = GuiColor.Base_
		end
		setMinMaxField(MinMaxField.distanceToBoard)
	end)

	buttonAutoBoost.MouseButton1Down:Connect(function()
		if AutoFlags.BoostBottonDown == false then
			AutoFlags.BoostBottonDown = true
			buttonAutoBoost.BackgroundColor3 = Color3.new(0, 1, 0)
			while AutoFlags.BoostBottonDown do	
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Red Field Booster")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Blue Field Booster")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Field Booster")
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Coconut Dispenser")
				wait(120)
			end
		else
			AutoFlags.BoostBottonDown = false
			buttonAutoBoost.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoMobs.MouseButton1Down:Connect(function()
		if not AutoFlags.MobsBottonDown then
			AutoFlags.MobsBottonDown = true
			buttonAutoMobs.BackgroundColor3 = Color3.new(0, 1, 0)
			AutoMobsKillFunction()
		else
			AutoFlags.MobsBottonDown = false
			buttonAutoMobs.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoVicious.MouseButton1Down:Connect(function()
		if not AutoFlags.ViciousBottonDown then
			AutoFlags.ViciousBottonDown = true
			buttonAutoVicious.BackgroundColor3 = Color3.new(0, 1, 0)
		else
			AutoFlags.ViciousBottonDown = false
			buttonAutoVicious.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoWindy.MouseButton1Down:Connect(function()
		if not AutoFlags.WindyBottonDown then
			AutoFlags.WindyBottonDown = true
			buttonAutoWindy.BackgroundColor3 = Color3.new(0, 1, 0)
		else
			AutoFlags.WindyBottonDown = false
			buttonAutoWindy.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoStickBug.MouseButton1Down:Connect(function()
		if not AutoFlags.StickBugBottonDown then
			AutoFlags.StickBugBottonDown = true
			buttonAutoStickBug.BackgroundColor3 = Color3.new(0, 1, 0)
		else
			AutoFlags.StickBugBottonDown = false
			buttonAutoStickBug.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoMondo.MouseButton1Down:Connect(function()
		if not AutoFlags.MondoBottonDown then
			AutoFlags.MondoBottonDown = true
			buttonAutoMondo.BackgroundColor3 = Color3.new(0, 1, 0)
		else
			AutoFlags.MondoBottonDown = false
			buttonAutoMondo.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoTornado.MouseButton1Down:Connect(function()
		local TornadoControl = coroutine.wrap(function()
			local tweenservice_ = game:GetService("TweenService")
			local info_ = TweenInfo.new(0.2) --(in seconds)
			local item_ = {}
			while AutoFlags.TornadoBottonDown do
				while HumanoidAction.Pause or HumanoidAction.CapacityUnloading or not HumanoidAction.Farm do
					wait(1)
				end
				for _,tornado_ in pairs(game.workspace.Particles:GetDescendants()) do
					if tornado_.Name == "Root" or tornado_.Name == "Plane" then
						if MinMaxField.min_X < tornado_.Position.x and tornado_.Position.x < MinMaxField.max_X
							and MinMaxField.min_Z < tornado_.Position.z and tornado_.Position.z < MinMaxField.max_Z then
							for _,v in pairs(workspace.Collectibles:GetChildren()) do		-- перебираем собираемые элементы
							if (v.Position.x > MinMaxField.min_X) and (v.Position.x < MinMaxField.max_X) and (v.Position.z > MinMaxField.min_Z) and (v.Position.z < MinMaxField.max_Z) then
							if ((v.Position.y > fieldPosition.y - 3) and (v.Position.y < fieldPosition.y + 5)) then	-- токен находится на уровне
								if not AutoFlags.TornadoBottonDown then return end
								item_.CFrame = CFrame.new(v.Position.x, tornado_.Position.y, v.Position.z)
								local Tween = tweenservice_:Create(tornado_, info_, item_)
								Tween:Play()
								--wait(info_)
								wait(.1)
							end
							end
							end
						end
					end
				end
				wait(.2)
			end
		end)
	
		if AutoFlags.TornadoBottonDown == false then
			AutoFlags.TornadoBottonDown = true
			buttonAutoTornado.BackgroundColor3 = Color3.new(0, 1, 0)
			TornadoControl()
		else
			AutoFlags.TornadoBottonDown = false
			buttonAutoTornado.BackgroundColor3 = GuiColor.Base_
		end
	end)
	
	buttonAutoMushrooms.MouseButton1Down:Connect(function()
		if AutoFlags.MushroomsBottonDown == false then
			AutoFlags.MushroomsBottonDown = true
			buttonAutoMushrooms.BackgroundColor3 = Color3.new(0, 1, 0)
		else
			AutoFlags.MushroomsBottonDown = false
			buttonAutoMushrooms.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonDiamondMaskEquip.MouseButton1Down:Connect(function() switchMask("Blue") end)
	buttonGummyMaskEquip.MouseButton1Down:Connect(function() switchMask("White") end)
	buttonDemonMaskEquip.MouseButton1Down:Connect(function() switchMask("Red") end)

	buttonSnailTime.MouseButton1Down:Connect(function()
		local function snailTimeDecrease()
			print("-----Snail Time Decrease Started-----")
			while ActionFlags.SnailTimeBottonDown >= 1 do
				ActionFlags.SnailTimeBottonDown = ActionFlags.SnailTimeBottonDown - 1	
				buttonSnailTime.Text = "buttonSnailTime "..ActionFlags.SnailTimeBottonDown
				for count = 1, 60 do
					if ActionFlags.SnailTimeBottonDown == 0 then break end
					wait(1)
				end
				for _,v in pairs(game.workspace.Monsters:GetChildren()) do
					if not string.find(v.Name,"Snail") and
						(humanoidRootPart.Position - fieldPosition).magnitude < 50 then
						ActionFlags.SnailTimeBottonDown = 0
					end			
				end
			end
			if ActionFlags.SnailTimeBottonDown < 0 then ActionFlags.SnailTimeBottonDown = 0 end
			buttonSnailTime.Text = "buttonSnailTime"
			buttonSnailTime.BackgroundColor3 = GuiColor.Base_
			if HumanoidState.SetMask == 3 then
				switchMask(2)
			else
				switchMask(HumanoidState.SetMask)
			end
			
			buttonDistance.BackgroundColor3 = GuiColor.Base_
			setMinMaxField(5)
			print("-----Snail Time Decrease Stoped-----")
		end

		if ActionFlags.SnailTimeBottonDown == 0 then
			ActionFlags.SnailTimeBottonDown = 30
			buttonSnailTime.Text = "buttonSnailTime "..ActionFlags.SnailTimeBottonDown
			buttonSnailTime.BackgroundColor3 = Color3.new(0, 1, 0)
			switchMask(3)
			buttonDistance.BackgroundColor3 = Color3.new(0, 1, 0)
			setMinMaxField(30)
			snailTimeDecrease()
		elseif ActionFlags.SnailTimeBottonDown <= 450 then
			ActionFlags.SnailTimeBottonDown = ActionFlags.SnailTimeBottonDown + 30
			buttonSnailTime.Text = "buttonSnailTime "..ActionFlags.SnailTimeBottonDown
		else
			ActionFlags.SnailTimeBottonDown = 0
		end
	end)

	buttonBalloonAndStart.MouseButton1Down:Connect(function()
		buttonBalloonAndStart.BackgroundColor3 = Color3.new(1, 1, 0)
		buttonFarm.BackgroundColor3 = Color3.new(1, 0, 0)
		HumanoidAction.Farm = true
		
		ActionFlags.BalloonBottonDown = true
		BackpackBalloonUnloading()
		wait(.5)
		if ActionFlags.StateBalloonBotton == 2 or ActionFlags.StateBalloonBotton == 0 then ActionFlags.BalloonBottonDown = false end
		
		buttonFarm.BackgroundColor3 = Color3.new(0, 1, 0)
		FarmBottonDown()
		buttonBalloonAndStart.BackgroundColor3 = GuiColor.Base_
	end)

	buttonAutoTicket.MouseButton1Down:Connect(function()
		if AutoFlags.TicketBottonDown == false then
			AutoFlags.TicketBottonDown = true
			buttonAutoTicket.BackgroundColor3 = Color3.new(0, 1, 0)
		else
			AutoFlags.TicketBottonDown = false
			buttonAutoTicket.BackgroundColor3 = GuiColor.Base_
		end
	end)

	buttonAutoChristmas.MouseButton1Down:Connect(function()
		local function Collect_Dist20()
			local humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
			for k,v in pairs(workspace.Collectibles:GetChildren()) do			-- перебираем собираемые элементы
				if tostring(v) == tostring(game.Players.LocalPlayer.Name) or tostring(v) == "C" then
					if (v.Position - humanoidRootPart.Position).magnitude <= 20 then	-- если растояние меньше, собираем
																						-- токен находится на уровне
						if ((v.Position.y > humanoidRootPart.Position.y - 5) and (v.Position.y < humanoidRootPart.Position.y + 15)) then
							if AutoFlags.ChristmasBottonDown	then
								humanoid:MoveTo(Vector3.new(v.Position.x, humanoidRootPart.Position.y, v.Position.z), nil)
								wait(.5)
							else
								break
							end
						end
					end
				end
			end
		end
	
		local CollectionChristmas = coroutine.wrap(function()
			while AutoFlags.ChristmasBottonDown do
				while HumanoidAction.Pause or HumanoidAction.CapacityUnloading do
					wait(10)
				end
				print("Collection Christmas STARTing")
				HumanoidAction.Pause = true
				--game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Gingerbread House")
				wait(7)
				humanoidRootPart.CFrame = CFrame.new(-403.2, 48, 280.2)	--тп "Wax"
				wait(1)
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Honeyday Candles")	--вызываем
				wait(7)
				humanoidRootPart.CFrame = CFrame.new(421, 132, -333)	--тп "Samovar"
				wait(1)
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Samovar")			--вызываем
				wait(9)
				for count = 1, 11 do wait(.3) Collect_Dist20() end
				if not AutoFlags.ChristmasBottonDown then HumanoidAction.Pause = false break end
				wait(1)
				humanoidRootPart.CFrame = CFrame.new(36, 236, -512)	--тп "Onett's Lid Art"
				wait(1)
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Onett's Lid Art")	--вызываем
				wait(7)
				for count = 1, 3 do	Collect_Dist20()	end
				if not AutoFlags.ChristmasBottonDown then HumanoidAction.Pause = false break end	
				wait(1)
				humanoidRootPart.CFrame = CFrame.new(-105, 129, -114)	--тп "Beesmas Feast"
				wait(1)
				game:GetService("ReplicatedStorage").Events.ToyEvent:FireServer("Beesmas Feast")	--вызываем
				wait(5)
				for count = 1, 3 do	Collect_Dist20()	end
				wait(1)
				if not AutoFlags.ChristmasBottonDown then HumanoidAction.Pause = false break end	
				if HumanoidAction.Farm == true then tpToField()		-- тп на поле
					else GoToSpawnPosition() end
				wait(5)
				HumanoidAction.Pause = false
				for ho = 1, 2 do
					for mi = 1, 60 do
						for delta = 1, 3 do
							wait(20)
							if not AutoFlags.ChristmasBottonDown then break end
						end
					end
					print("Collection Christmas 1 h")
				end	
			end
			print("Collection Christmas STOPed")
		end)
		
		if AutoFlags.ChristmasBottonDown == false then
			AutoFlags.ChristmasBottonDown = true
			buttonAutoChristmas.BackgroundColor3 = Color3.new(0, 1, 0)
			CollectionChristmas()
		else
			AutoFlags.ChristmasBottonDown = false
			buttonAutoChristmas.BackgroundColor3 = GuiColor.Base_
		end
	end)

end)

------------------Waypoints------------------
Waypoints = { 
	["Star Room"] = CFrame.new(135.9, 64.6, 322.1),
	["Home 1"] = CFrame.new(-185, 4.4, 331),
	["Home 2"] = CFrame.new(-151.5, 4.4, 331),
	["Home 3"] = CFrame.new(-118, 4.4, 331),
	["Home 4"] = CFrame.new(-84.5, 4.4, 331),
	["Home 5"] = CFrame.new(-51, 4.4, 331),
	["Home 6"] = CFrame.new(-17.5, 4.4, 331)}	

--===================Установки=====================--
	switchMask("Blue")
	HumanoidState.Speed = 98
	buttonSpeed.Text = "Speed: 98"
	buttonSpeed.BackgroundColor3 = Color3.new(1, 0, 0)
	coroutine.wrap(applySpeed)()
	HumanoidState.TmpSpeed = HumanoidState.Speed
	--	AutoFlags.MushroomsBottonDown = true
	--buttonAutoMushrooms.BackgroundColor3 = Color3.new(0, 1, 0)
		wait(5)
		
	--	textView.Text = "Stump Field"
	--textView.Text = "Pepper Patch"
	--setMinMaxField(MinMaxField.distanceToBoard)
