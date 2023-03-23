--[[for _,v in pairs(game.CoreGui:GetChildren()) do
	if	v.Name == "[SubsidiaryGUI]MainGUI" then
		print("----------- Closed "..v.Name.." -----------")
		v:Destroy()
	end
end]]

local GuiColor = {
	Base_	= Color3.new(0.184314,0.105882,0.4431373),
	Red_	= Color3.new(0.7,0.3,0.3),
	Green_	= Color3.new(0.3,0.7,0.3),
	Blue_	= Color3.new(0.3,0.3,0.7),
	
	Text_LWhite_= Color3.new(0.7,0.7,0.7),
	Text_LBlack_= Color3.new(0.3,0.3,0.3),
	Text_White_	= Color3.new(1,1,1),
	Text_Black_	= Color3.new(0,0,0),
	Text_Red_	= Color3.new(1,0.5,0.5),
	Text_Green_	= Color3.new(0.5,1,0.5),
	Text_Blue_	= Color3.new(0.5,0.5,1),
	
	On_Color_G	= Color3.new(0, 1, 0),
	On_Color_B	= Color3.new(0, 1, 1),
	On_Color_Y	= Color3.new(1, 1, 0)}

local ObjectsPositions = {
	StartFrame_Pos1 = UDim2.new(0, -50, 0.17, 0),
	StartFrame_Pos2 = UDim2.new(0, 0, 0.17, 0),
	MenuFrame_Pos1 = UDim2.new(0, -95, 0, 15),
	MenuFrame_Pos2 = UDim2.new(0, 5, 0, 15)}

createGui = function()-----createGui-----

function createInstance(class,properties)
	local instance_ = Instance.new(class)
	for i,v in pairs(properties) do
		instance_[i] = v
	end
	return instance_
end

function createCorner(object,r)
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, r)
	Corner.Parent = object
	return object
end

function createButton(properties)
	local button_ = createInstance("TextButton",{BackgroundColor3=GuiColor.Base_,BackgroundTransparency=0.4,BorderSizePixel=3,
		AutoButtonColor=true,TextColor3=GuiColor.Text_White_,Font=Enum.Font.GothamBold,TextSize=11,TextTransparency=0,TextWrapped=false})
	for i,v in pairs(properties) do
		button_[i] = v
	end
	createCorner(button_,4)
	return button_
end

function createTextLabel(properties)
	local textLabel_ = createInstance(
		"TextLabel",{BackgroundColor3=GuiColor.Base_,BackgroundTransparency=1,BorderSizePixel=0,
		TextColor3=GuiColor.Text_White_,Font=Enum.Font.GothamBold,TextSize=10,TextTransparency=0,TextWrapped=false})
	for i,v in pairs(properties) do
		textLabel_[i] = v
	end
	createCorner(textLabel_,4)
	return textLabel_
end

local BForms = {
	Forms = function(buTTon,row,column,segment)
		buTTon.Row = row
		buTTon.Column = column
		buTTon.Segment = segment
	end,
	Position = function(buTTon)
		local X = buTTon.Column * buTTon.GapX + (buTTon.Column - 1) * buTTon.SizeX
		local Y = (buTTon.Row + buTTon.Segment - 1) * buTTon.GapY + (buTTon.Row - 1) * buTTon.SizeY
		return UDim2.new(0, X, 0, Y)
	end,
	Size = function(buTTon)
		return UDim2.new(0, buTTon.SizeX, 0, buTTon.SizeY)
	end}

local  SubsidiaryMainGUI = createInstance("ScreenGui",{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,
	Name="[SubsidiaryGUI]MainGUI",})

------------------StartFrame------------------
local StartFrame = createInstance("Frame",{Active=true, Selectable=true, Draggable=true,
	BackgroundColor3=GuiColor.Text_LBlack_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 40, 0, 15),Position=ObjectsPositions.StartFrame_Pos1,Name="StartFrame",Parent=SubsidiaryMainGUI})

local HeadingFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=1,
	Size=UDim2.new(0, 40, 0, 15),Position=UDim2.new(0, 0, 0, 0),Name="HeadingFrame",Parent=StartFrame})
	createCorner(HeadingFrame,2)

local HideMenuButton = createButton({Size=UDim2.new(0, 30, 0, 15),Position=UDim2.new(0, 0, 0, 0),
	Text=">>>",Name="HideMenuButton",Parent=HeadingFrame,TextSize=10})

local SpawnButton = createButton({Size=UDim2.new(0, 95, 0, 15),Position=UDim2.new(0, 35, 0, 0),
	Text="< 0 >",Name="SpawnButton",Parent=HeadingFrame,TextSize=10,Visible=false})	
------------------MenuFrame------------------
local MenuButtonSet = {Row=1;Column=1;Segment=1;GapX=0;GapY=5;SizeX=25;SizeY=18}
local MenuFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=ObjectsPositions.MenuFrame_Pos1,Name="MenuFrame",Parent=StartFrame,Visible=false})
	
	BForms.Forms(MenuButtonSet,1,5,1)
local DestroyButton = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="X",Name="DestroyButton",Parent=MenuFrame,TextSize=16,BackgroundColor3=GuiColor.Red_})
	BForms.Forms(MenuButtonSet,2,5,1)
local TPMenuButton = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="SHOP",Name="TPMenuButton",Parent=MenuFrame,TextSize=8})
	BForms.Forms(MenuButtonSet,3,5,1)
local TPMenuButton2 = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="DISP",Name="TPMenuButton2",Parent=MenuFrame,TextSize=8})
	BForms.Forms(MenuButtonSet,4,5,1)
local TPMenuButton3 = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="DRIVE",Name="TPMenuButton3",Parent=MenuFrame,TextSize=7})
	BForms.Forms(MenuButtonSet,5,5,1)
local TPBearButton = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="BEAR",Name="TPBearButton",Parent=MenuFrame,TextSize=8})
	BForms.Forms(MenuButtonSet,6,5,1)
local TPMatchButton = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="MATCH",Name="TPMatchButton",Parent=MenuFrame,TextSize=7})
	BForms.Forms(MenuButtonSet,7,5,1)
local UseMenuButton = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="Use",Name="UseMenuButton",Parent=MenuFrame,TextSize=10})
	BForms.Forms(MenuButtonSet,8,5,1)
local TimeMenuButton = createButton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="Time",Name="TimeMenuButton",Parent=MenuFrame,TextSize=10})

------------------TP_1Frame------------------
local ButtonSet = {Row=1;Column=1;Segment=1;GapX=0;GapY=4;SizeX=90;SizeY=18}
local TP_1Frame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="TP_1Frame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local NoobShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Noob Shop",Name="NoobShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,2,1,1)
local ProShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Pro Shop",Name="ProShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,3,1,1)
local TopShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Top Shop",Name="TopShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,4,1,1)
local MentalShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Mental Shop",Name="MentalShopButton",Parent=TP_1Frame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,5,1,1)
local BeeShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Bee Shop",Name="BeeShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,6,1,1)
local TreatShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Treat Shop",Name="TreatShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,7,1,1)
local TicketShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Ticket Shop",Name="TicketShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,8,1,1)
local RoyalJellyShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="RoyalJelly Shop",Name="RoyalJellyShopButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,9,1,1)
local TicketRoyalJellyButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Ticket RoyalJelly",Name="TicketRoyalJellyButton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,10,1,1)
local PlanterShopButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Planter Shop",Name="PlanterShopButton",Parent=TP_1Frame,TextColor3=GuiColor.Text_Green_})

------------------TP_2Frame------------------
local TP_2Frame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="TP_2Frame",Parent=MenuFrame,Visible=false})
	
	BForms.Forms(ButtonSet,1,1,1)
local HoneyStormButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Honey Storm",Name="HoneyStormButton",Parent=TP_2Frame})
	BForms.Forms(ButtonSet,2,1,1)
local StrawberryDispenserButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Strawberry Disp",Name="StrawberryDispenserButton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,3,1,1)
local BlueberryDispenserButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blueberry Disp",Name="BlueberryDispenserButton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,4,1,1)
local GlueDispenserButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Glue Dispenser",Name="GlueDispenserButton",Parent=TP_2Frame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,5,1,1)
local SproutButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Sprout",Name="SproutButton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Green_})
	BForms.Forms(ButtonSet,6,1,1)
local GumdropDispenserButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Gumdrop Disp",Name="GumdropDispenserButton",Parent=TP_2Frame})
	BForms.Forms(ButtonSet,7,1,1)
local TreatDispenserButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Treat Dispenser",Name="TreatDispenserButton",Parent=TP_2Frame})
	BForms.Forms(ButtonSet,8,1,1)
local RedClubhouseButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Red Clubhouse",Name="RedClubhouseButton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,9,1,1)
local BlueClubhouseButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blue Clubhouse",Name="BlueClubhouseButton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,10,1,1)
local ClubHoneyButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Club Honey",Name="ClubHoneyButton",Parent=TP_2Frame})

------------------TP_3Frame------------------
local TP_3Frame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="TP_3Frame",Parent=MenuFrame,Visible=false})
	
	BForms.Forms(ButtonSet,1,1,1)
local StarRoomButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Star Room",Name="StarRoomButton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,2,1,1)
local WealthClockButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Wealth Clock",Name="WealthClockButton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,3,1,1)
local BlenderButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blender",Name="BlenderButton",Parent=TP_3Frame,TextColor3=GuiColor.Text_Green_})
	BForms.Forms(ButtonSet,4,1,1)
local MoonButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Moon",Name="MoonButton",Parent=TP_3Frame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,5,1,1)
local AntButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Ant",Name="AntButton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,6,1,1)
local OnettButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Onett",Name="OnettButton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,7,1,1)
local TopTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text=" ",Name="TopTPButton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,8,1,1)
local GummyMaskButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Gummy Mask",Name="GummyMaskButton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,9,1,1)
local DemonmMaskButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Demonm Mask",Name="DemonmMaskButton",Parent=TP_3Frame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,10,1,1)
local DiamondMaskButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Diamond Mask",Name="DiamondMaskButton",Parent=TP_3Frame,TextColor3=GuiColor.Text_Blue_})

------------------BearFrame------------------
local BearFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="BearFrame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local PolarBearTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Polar Bear",Name="PolarBearTPButton",Parent=BearFrame})
	BForms.Forms(ButtonSet,2,1,1)
local BlackBearTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Black Bear",Name="BlackBearTPButton",Parent=BearFrame,TextColor3=GuiColor.Text_LBlack_})
	BForms.Forms(ButtonSet,3,1,1)
local BrownBearTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Brown Bear",Name="BrownBearTPButton",Parent=BearFrame,TextColor3=GuiColor.Text_Green_})
	BForms.Forms(ButtonSet,4,1,1)
local RileyBeeTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Riley Bee",Name="RileyBeeTPButton",Parent=BearFrame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,5,1,1)
local BuckoBeeTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Bucko Bee",Name="BuckoBeeTPButton",Parent=BearFrame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,6,1,1)
local StickBugTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Stick Bug",Name="StickBugTPButton",Parent=BearFrame})
	BForms.Forms(ButtonSet,7,1,1)
local WindyShrinelTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Windy Shrinel",Name="WindyShrinelTPButton",Parent=BearFrame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,8,1,1)
local KingBeetleTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="King Beetle",Name="KingBeetleTPButton",Parent=BearFrame})
	BForms.Forms(ButtonSet,9,1,1)
local TunnelBearTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Tunnel Bear",Name="TunnelBearTPButton",Parent=BearFrame})
	BForms.Forms(ButtonSet,10,1,1)
local SnailTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Snail",Name="SnailTPButton",Parent=BearFrame})
	BForms.Forms(ButtonSet,11,1,1)
local ComandorTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Comandor",Name="ComandorTPButton",Parent=BearFrame})

------------------MatchFrame------------------
local MatchFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="MatchFrame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local NightMatchTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="NightMatch",Name="NightMatchTPButton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,2,1,1)
local ExtremeMatchTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="ExtremeMatch",Name="ExtremeMatchTPButton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,3,1,1)
local MegaMatchTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="MegaMatch",Name="MegaMatchTPButton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,4,1,1)
local MemoryMatchTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="MemoryMatch",Name="MemoryMatchTPButton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,5,1,1)
local HoneyConvertor1TPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Convertor1",Name="HoneyConvertor1TPButton",Parent=MatchFrame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,6,1,1)
local HoneyConvertor2TPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Convertor2",Name="HoneyConvertor2TPButton",Parent=MatchFrame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,7,1,1)
local HoneyConvertor3TPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Convertor3",Name="HoneyConvertor3TPButton",Parent=MatchFrame,TextColor3=GuiColor.Text_LWhite_})
	BForms.Forms(ButtonSet,8,1,1)
local CoconutDispenserTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Coconut Disp",Name="CoconutDispenserTPButton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,9,1,1)
local RedFieldBoostTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Red Boost",Name="RedFieldBoostTPButton",Parent=MatchFrame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,10,1,1)
local BlueFieldBoostTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blue Boost",Name="BlueFieldBoostTPButton",Parent=MatchFrame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,11,1,1)
local MountainTopBoostTPButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="White Boost",Name="MountainTopBoostTPButton",Parent=MatchFrame})

------------------UseFrame------------------
local UseFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="UseFrame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local AutoCloudButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Cloud",Name="AutoCloudButton",Parent=UseFrame})
	BForms.Forms(ButtonSet,2,1,1)
local AutoJellyBeansButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Jelly Beans",Name="AutoJellyBeansButton",Parent=UseFrame})
	BForms.Forms(ButtonSet,3,1,1)
local AutoMagicBeanButton = createButton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="MagicBean",Name="AutoMagicBeanButton",Parent=UseFrame,TextColor3=GuiColor.Text_Green_})

------------------TimeFrame------------------
local TimeSet = {Row=1;Column=1;Segment=1;GapX=10;GapY=4;SizeX=60;SizeY=18}
local TimeFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=.6,BorderSizePixel=0,
	Size=UDim2.new(0, 80, 0, 145),Position=UDim2.new(0, 5, 0, 5),Name="TimeFrame",Parent=MenuFrame,Visible=false})
	createCorner(TimeFrame,5)
	
	BForms.Forms(TimeSet,1,1,1)
local TextHoney = createTextLabel({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text = "Honey:",Name="TextHoney",Parent=TimeFrame})

	BForms.Forms(TimeSet,2,1,1)
local TextTime = createTextLabel({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text = "Time:",Name="TextTime",Parent=TimeFrame})

	BForms.Forms(TimeSet,3,1,1)
local TextHour = createTextLabel({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text = "Pollen: in hout",Name="TextHour",Parent=TimeFrame})

	BForms.Forms(TimeSet,4,1,1)
local TextDay = createTextLabel({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text = "Pollen: in day",Name="TextDay",Parent=TimeFrame})

	BForms.Forms(TimeSet,5,1,3)
local StartStopButton = createButton({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text="Start",Name="StartStopButton",Parent=TimeFrame})

	BForms.Forms(TimeSet,6,1,3)
local ResetButton = createButton({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text="Reset",Name="ResetButton",Parent=TimeFrame})

return SubsidiaryMainGUI
end

local S_U_B_S_I_D_I_A_R_Y_Gui = createGui()
local StartFrame = S_U_B_S_I_D_I_A_R_Y_Gui:WaitForChild("StartFrame")
local HeadingFrame = StartFrame:WaitForChild("HeadingFrame")
local HideMenuButton = HeadingFrame:WaitForChild("HideMenuButton")
local MenuFrame = StartFrame:WaitForChild("MenuFrame")
local TP_1Frame = MenuFrame:WaitForChild("TP_1Frame")
local TP_2Frame = MenuFrame:WaitForChild("TP_2Frame")
local TP_3Frame = MenuFrame:WaitForChild("TP_3Frame")
local BearFrame = MenuFrame:WaitForChild("BearFrame")
local MatchFrame = MenuFrame:WaitForChild("MatchFrame")
local UseFrame = MenuFrame:WaitForChild("UseFrame")
local TimeFrame = MenuFrame:WaitForChild("TimeFrame")

S_U_B_S_I_D_I_A_R_Y_Gui.Parent = game.CoreGui

spawn(function()
	humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
	allStop = false
	print("----------- Start "..S_U_B_S_I_D_I_A_R_Y_Gui.Name.." BEE SWARM -----------")
	StartFrame:TweenPosition(ObjectsPositions.StartFrame_Pos2,
		Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .5, true)
end)

spawn(function()-----MenuFrame, HeadingFrame-----

local SpawnButton = HeadingFrame:WaitForChild("SpawnButton")

HideMenuButton.MouseButton1Up:connect(function()
	if	HideMenuButton.Text == ">>>" then
		HideMenuButton.Text = "<<<"
		MenuFrame.Visible = true
		SpawnButton.Visible = true
		StartFrame.Size=UDim2.new(0, 135, 0, 15)
		HeadingFrame.Size=UDim2.new(0, 135, 0, 15)
	else
		HideMenuButton.Text = ">>>"
		MenuFrame.Visible = false
		SpawnButton.Visible = false
		StartFrame.Size=UDim2.new(0, 40, 0, 15)
		HeadingFrame.Size=UDim2.new(0, 40, 0, 15)
	end
end)

SpawnButton.MouseButton1Up:connect(function()
	humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
	humanoidRootPart.CFrame = game.Players.LocalPlayer.SpawnPos.Value
	wait(1)
	game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")
end)


local DestroyButton = MenuFrame:WaitForChild("DestroyButton")
local TPMenuButton = MenuFrame:WaitForChild("TPMenuButton")
local TPMenuButton2 = MenuFrame:WaitForChild("TPMenuButton2")
local TPMenuButton3 = MenuFrame:WaitForChild("TPMenuButton3")
local TPBearButton = MenuFrame:WaitForChild("TPBearButton")
local TPMatchButton = MenuFrame:WaitForChild("TPMatchButton")
local UseMenuButton = MenuFrame:WaitForChild("UseMenuButton")
local TimeMenuButton = MenuFrame:WaitForChild("TimeMenuButton")

DestroyButton.MouseButton1Up:connect(function()
	allStop = true
	print("----------- Closed "..S_U_B_S_I_D_I_A_R_Y_Gui.Name.." BEE SWARM -----------")
	S_U_B_S_I_D_I_A_R_Y_Gui:Destroy()
end)

local function hideFrames()
	for _,k in pairs(MenuFrame:GetChildren()) do
		if	k:IsA("Frame") then
			k.Visible = false
		elseif k:IsA("TextButton") then
			k.BackgroundColor3 = GuiColor.Base_
		end
	end
end

local function displayFrame(button, frame)
	if	frame.Visible then
		frame.Visible = false
		button.BackgroundColor3 = GuiColor.Base_
		MenuFrame:TweenPosition(ObjectsPositions.MenuFrame_Pos1,
			Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .2, true)
	else
		hideFrames()
			DestroyButton.BackgroundColor3=GuiColor.Red_
		frame.Visible = true
		button.BackgroundColor3 = GuiColor.On_Color_B
		MenuFrame:TweenPosition(ObjectsPositions.MenuFrame_Pos2,
			Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .2, true)
	end
end

TPMenuButton.MouseButton1Up:Connect(function()displayFrame(TPMenuButton,TP_1Frame)end)
TPMenuButton2.MouseButton1Up:Connect(function()displayFrame(TPMenuButton2,TP_2Frame)end)
TPMenuButton3.MouseButton1Up:Connect(function()displayFrame(TPMenuButton3,TP_3Frame)end)
TPBearButton.MouseButton1Up:Connect(function()displayFrame(TPBearButton,BearFrame)end)
TPMatchButton.MouseButton1Up:Connect(function()displayFrame(TPMatchButton,MatchFrame)end)
UseMenuButton.MouseButton1Up:Connect(function()displayFrame(UseMenuButton,UseFrame)end)
TimeMenuButton.MouseButton1Up:Connect(function()displayFrame(TimeMenuButton,TimeFrame)end)

end)

spawn(function()-----TP_1Frame-----

local NoobShopButton = TP_1Frame:WaitForChild("NoobShopButton")
local ProShopButton = TP_1Frame:WaitForChild("ProShopButton")
local TopShopButton = TP_1Frame:WaitForChild("TopShopButton")
local MentalShopButton = TP_1Frame:WaitForChild("MentalShopButton")
local BeeShopButton = TP_1Frame:WaitForChild("BeeShopButton")
local TreatShopButton = TP_1Frame:WaitForChild("TreatShopButton")
local TicketShopButton = TP_1Frame:WaitForChild("TicketShopButton")
local RoyalJellyShopButton = TP_1Frame:WaitForChild("RoyalJellyShopButton")
local TicketRoyalJellyButton = TP_1Frame:WaitForChild("TicketRoyalJellyButton")
local PlanterShopButton = TP_1Frame:WaitForChild("PlanterShopButton")

NoobShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Tool Shop"] end)
ProShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Tool Shop 2"] end)
TopShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["MountainTop Shop"] end)
MentalShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Mental Shop"] end)
BeeShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Bee Shop"] end)
TreatShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Treat Shop"] end)
TicketShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Ticket Shop"] end)
RoyalJellyShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["RoyalJelly Shop"] end)
TicketRoyalJellyButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Ticket RoyalJelly Shop"] end)
PlanterShopButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Planter Shop"] end)

end)

spawn(function()-----TP_2Frame-----

local HoneyStormButton = TP_2Frame:WaitForChild("HoneyStormButton")
local StrawberryDispenserButton = TP_2Frame:WaitForChild("StrawberryDispenserButton")
local BlueberryDispenserButton = TP_2Frame:WaitForChild("BlueberryDispenserButton")
local GlueDispenserButton = TP_2Frame:WaitForChild("GlueDispenserButton")
local SproutButton = TP_2Frame:WaitForChild("SproutButton")
local GumdropDispenserButton = TP_2Frame:WaitForChild("GumdropDispenserButton")
local TreatDispenserButton = TP_2Frame:WaitForChild("TreatDispenserButton")
local RedClubhouseButton = TP_2Frame:WaitForChild("RedClubhouseButton")
local BlueClubhouseButton = TP_2Frame:WaitForChild("BlueClubhouseButton")
local ClubHoneyButton = TP_2Frame:WaitForChild("ClubHoneyButton")

HoneyStormButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honeystorm Dispensor"] end)
StrawberryDispenserButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Strawberry Dispenser"] end)
BlueberryDispenserButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Blueberry Dispenser"] end)
GlueDispenserButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Glue Dispenser"] end)
SproutButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Sprout Dispenser"] end)
GumdropDispenserButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Gumdrop Dispenser"] end)
TreatDispenserButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Treat Dispenser"] end)
RedClubhouseButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Red Clubhouse"] end)
BlueClubhouseButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Blue Clubhouse"] end)
ClubHoneyButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Club Honey"] end)

end)

spawn(function()-----TP_3Frame-----

local StarRoomButton = TP_3Frame:WaitForChild("StarRoomButton")
local WealthClockButton = TP_3Frame:WaitForChild("WealthClockButton")
local BlenderButton = TP_3Frame:WaitForChild("BlenderButton")
local MoonButton = TP_3Frame:WaitForChild("MoonButton")
local AntButton = TP_3Frame:WaitForChild("AntButton")
local OnettButton = TP_3Frame:WaitForChild("OnettButton")
local TopTPButton = TP_3Frame:WaitForChild("TopTPButton")
local GummyMaskButton = TP_3Frame:WaitForChild("GummyMaskButton")
local DemonmMaskButton = TP_3Frame:WaitForChild("DemonmMaskButton")
local DiamondMaskButton = TP_3Frame:WaitForChild("DiamondMaskButton")

StarRoomButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Star Room"] end)
WealthClockButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Wealth Clock"] end)
BlenderButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Blender"] end)
MoonButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Moon"] end)
AntButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Ant"] end)
OnettButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Onett"] end)
TopTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Top"] end)
GummyMaskButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Gummy Mask"] end)
DiamondMaskButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Diamond Mask"] end)
DemonmMaskButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Demonm Mask"] end)

end)

spawn(function()-----BearFrame-----

local PolarBearTPButton = BearFrame:WaitForChild("PolarBearTPButton")
local BlackBearTPButton = BearFrame:WaitForChild("BlackBearTPButton")
local BrownBearTPButton = BearFrame:WaitForChild("BrownBearTPButton")
local RileyBeeTPButton = BearFrame:WaitForChild("RileyBeeTPButton")
local BuckoBeeTPButton = BearFrame:WaitForChild("BuckoBeeTPButton")
local StickBugTPButton = BearFrame:WaitForChild("StickBugTPButton")
local WindyShrinelTPButton = BearFrame:WaitForChild("WindyShrinelTPButton")
local KingBeetleTPButton = BearFrame:WaitForChild("KingBeetleTPButton")
local TunnelBearTPButton = BearFrame:WaitForChild("TunnelBearTPButton")
local SnailTPButton = BearFrame:WaitForChild("SnailTPButton")
local ComandorTPButton = BearFrame:WaitForChild("ComandorTPButton")

PolarBearTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Polar Bear"] end)
BlackBearTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Black Bear"] end)
BrownBearTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Brown Bear"] end)
RileyBeeTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Riley Bee"] end)
BuckoBeeTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Bucko Bee"] end)
StickBugTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Stick Bug"] end)
WindyShrinelTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Windy Shrine"] end)
KingBeetleTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["King Beetle"] end)
TunnelBearTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Tunnel Bear"] end)
SnailTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Snail"] end)
ComandorTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Comandor"] end)

end)

spawn(function()-----MatchFrame-----

local NightMatchTPButton = MatchFrame:WaitForChild("NightMatchTPButton")
local ExtremeMatchTPButton = MatchFrame:WaitForChild("ExtremeMatchTPButton")
local MegaMatchTPButton = MatchFrame:WaitForChild("MegaMatchTPButton")
local MemoryMatchTPButton = MatchFrame:WaitForChild("MemoryMatchTPButton")
local HoneyConvertor1TPButton = MatchFrame:WaitForChild("HoneyConvertor1TPButton")
local HoneyConvertor2TPButton = MatchFrame:WaitForChild("HoneyConvertor2TPButton")
local HoneyConvertor3TPButton = MatchFrame:WaitForChild("HoneyConvertor3TPButton")
local CoconutDispenserTPButton = MatchFrame:WaitForChild("CoconutDispenserTPButton")
local RedFieldBoostTPButton = MatchFrame:WaitForChild("RedFieldBoostTPButton")
local BlueFieldBoostTPButton = MatchFrame:WaitForChild("BlueFieldBoostTPButton")
local MountainTopBoostTPButton = MatchFrame:WaitForChild("MountainTopBoostTPButton")

NightMatchTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Night Match"] end)
ExtremeMatchTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Extreme Match"] end)
MegaMatchTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Mega Match"] end)
MemoryMatchTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Memory Match"] end)
HoneyConvertor1TPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honey Convertor 1"] end)
HoneyConvertor2TPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honey Convertor 2"] end)
HoneyConvertor3TPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honey Convertor 3"] end)
CoconutDispenserTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Coconut Dispenser"] end)
RedFieldBoostTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Redfield Boost"] end)
BlueFieldBoostTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Bluefield Boost"] end)
MountainTopBoostTPButton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["MountainTop Boost"] end)

end)

Waypoints = {-----Waypoints-----
["Tool Shop"] = CFrame.new(86, 4.6, 294),
["Tool Shop 2"] = CFrame.new(165, 69, -161),
["MountainTop Shop"] = CFrame.new(-18, 176, -137),
["Mental Shop"] = CFrame.new(-497.8, 51.7, 469),
["Bee Shop"] = CFrame.new(-136.8, 4.6, 243.4),
["Treat Shop"] = CFrame.new(-233.3, 5.5, 89),
["Ticket Shop"] = CFrame.new(-12.8, 184, -222.2),
["RoyalJelly Shop"] = CFrame.new(-297, 53, 68),
["Ticket RoyalJelly Shop"] = CFrame.new(81, 18, 240),
["Planter Shop"] = CFrame.new(520.7, 138.2, -325.7),

["Honeystorm Dispensor"] = CFrame.new(238.4, 33.3, 165.6),
["Blueberry Dispenser"] = CFrame.new(308.3, 4.8, 136.6),
["Strawberry Dispenser"] = CFrame.new(-320.5, 46, 272.5),
["Glue Dispenser"] = CFrame.new(271.7, 25257.2, -720.6),
["Sprout Dispenser"] = CFrame.new(-269.26, 26.56, 267.31),
["Gumdrop Dispenser"] = CFrame.new(66, 21.5, 26.4),
["Treat Dispenser"] = CFrame.new(193.9, 68, -123),
["Red Clubhouse"] = CFrame.new(-334, 21, 216),
["Blue Clubhouse"] = CFrame.new(292, 4, 98),
["Club Honey"] = CFrame.new(44.8, 5, 319.6),

["Star Room"] = CFrame.new(135.9, 64.6, 322.1),
["Wealth Clock"] = CFrame.new(333, 48.7, 190),
["Blender"] = CFrame.new(-426,70,38),
["Moon"] = CFrame.new(21,88,-54),
["Ant"] = CFrame.new(93,34,502),
["Onett"] = CFrame.new(-8.4, 234, -517.9),
["Top"] = CFrame.new(37.4, 429, -258),
["Diamond Mask"] = CFrame.new(-336,133,-387),
["Gummy Mask"] = CFrame.new(272,25268,-773),
["Demonm Mask"] = CFrame.new(291,28,271),

["Night Match"] = CFrame.new(-17.2, 312.7, -270.1),
["Extreme Match"] = CFrame.new(-405,112,545),
["Mega Match"] = CFrame.new(-429, 69.8, -54),
["Memory Match"] = CFrame.new(135.9, 68.7, -96),
["Honey Convertor 1"] = CFrame.new(-146.7, 4.6, 194.6),
["Honey Convertor 2"] = CFrame.new(140.4, 182.2, -217.2),
["Honey Convertor 3"] = CFrame.new(282.3, 68.5, -64.3),
["Coconut Dispenser"] = CFrame.new(-176, 73.2, 534),
["Redfield Boost"] = CFrame.new(-318, 21, 242),
["Bluefield Boost"] = CFrame.new(272, 58.4, 85.4),
["MountainTop Boost"] = CFrame.new(-40, 176, -191.7),

["Polar Bear"] = CFrame.new(-109, 119.6, -78),
["Black Bear"] = CFrame.new(-255, 5.5, 295),
["Brown Bear"] = CFrame.new(280, 46.1, 238),
["Riley Bee"] = CFrame.new(-360, 73.8, 214),
["Bucko Bee"] = CFrame.new(304, 62, 105),
["Stick Bug"] = CFrame.new(-128,50,147),
["Windy Shrine"] = CFrame.new(-486,142,410),
["King Beetle"] = CFrame.new(218, 3, 140),
["Tunnel Bear"] = CFrame.new(507.3, 5.7, -45.7),
["Snail"] = CFrame.new(420, 117,-178),
["Comandor"] = CFrame.new(520.7, 47, 162),
}

local ButtonState = {
	ButtonOnOff = function (button)
		if	button.BackgroundColor3 == GuiColor.Base_ then
			button.BackgroundColor3 = GuiColor.On_Color_G
			print(button.Name, "on")
			return true
		else
			button.AutoButtonColor = false
			button.BackgroundColor3 = GuiColor.Text_LBlack_
			print(button.Name, "off")
			return false
		end
	end,
	ButtonActivation = function (button)
		button.AutoButtonColor = true
		button.BackgroundColor3 = GuiColor.Base_
		print(button.Name, "actived")
	end,
	LaunchPeriod = function (button, second)
		for i = 1, math.floor(second) do
			if	not button.AutoButtonColor or allStop then
				return false
			end
			wait(1)
		end
		return true
	end}

spawn(function()-----UseFrame-----

local AutoCloudButton = UseFrame:WaitForChild("AutoCloudButton")
local AutoJellyBeansButton = UseFrame:WaitForChild("AutoJellyBeansButton")
local AutoMagicBeanButton = UseFrame:WaitForChild("AutoMagicBeanButton")

local function triggeringEvent(button,comand,count,delay)
	if not ButtonState.ButtonOnOff(button) then return end
	local A_1 = {["Name"] = comand}
	local Event = game:GetService("ReplicatedStorage").Events.PlayerActivesCommand
	Event:FireServer(A_1)
	print(button.Name, "fire")
	for i = 1, count-1 do
		if	not ButtonState.LaunchPeriod(button, delay) then break end
		Event:FireServer(A_1)
		print(button.Name, "fire")
	end
	ButtonState.ButtonActivation(button)
end

AutoCloudButton.MouseButton1Up:Connect(function()
	triggeringEvent(AutoCloudButton,"Cloud Vial",10,90)end)
AutoJellyBeansButton.MouseButton1Up:Connect(function()
	triggeringEvent(AutoJellyBeansButton,"Jelly Beans",19,50)end)
AutoMagicBeanButton.MouseButton1Up:Connect(function()
	triggeringEvent(AutoMagicBeanButton,"Magic Bean",10,10)end)

end)

spawn(function()-----TimeFrame-----

local TextHoney = TimeFrame:WaitForChild("TextHoney")
local TextTime = TimeFrame:WaitForChild("TextTime")
local TextHour = TimeFrame:WaitForChild("TextHour")
local TextDay = TimeFrame:WaitForChild("TextDay")
local StartStopButton = TimeFrame:WaitForChild("StartStopButton")
local ResetButton = TimeFrame:WaitForChild("ResetButton")

StartStopButton.MouseButton1Up:Connect(function()

local function formatNumber(number)
	local power = 0
	local letter = ""
	if	number > 1000000000000000000 then--E 18
		power = 18
		letter = "E"
	elseif	number > 1000000000000000 then--P 15
		power = 15
		letter = "P"
	elseif number > 1000000000000 then--T 12
		power = 12
		letter = "T"
	elseif number > 1000000000 then--G 9
		power = 9
		letter = "G"
	elseif number > 1000000 then--M 6
		power = 6
		letter = "M"
	elseif number > 1000 then--k 3
		power = 3
		letter = "k"
	else
		return tostring(number)
	end
	number = math.round(number/(10^(power-2)))
	number = number/100
	return tostring(number)..letter
end

	if not ButtonState.ButtonOnOff(StartStopButton) then return end
	local timeStart_ = os.time()
	local timeZone = os.date("%z")
	local hoursOffset = tonumber(timeZone:sub(1,3))
	local timeDelta_ = 0
	local honeyStart_ = game.Players.LocalPlayer.CoreStats.Honey.Value
	local honeyDelta_ = 0
	StartStopButton.Text = "Stop"
	StartStopButton.BackgroundColor3 = GuiColor.On_Color_Y
	while StartStopButton.AutoButtonColor do
		TextHoney.Text = formatNumber(honeyDelta_)
		TextTime.Text = ((os.date("%H",timeDelta_)-hoursOffset)..":"..os.date("%M",timeDelta_)..":"..os.date("%S",timeDelta_))
		TextHour.Text = formatNumber((honeyDelta_*3600)/timeDelta_).." in hout"
		TextDay.Text = formatNumber((honeyDelta_*3600*24)/timeDelta_).." in day"
		repeat
			if	allStop then return end
			wait(1)
		until MenuFrame.Visible and TimeFrame.Visible
		timeDelta_ = os.time() - timeStart_
		honeyDelta_ = game.Players.LocalPlayer.CoreStats.Honey.Value - honeyStart_
	end
	StartStopButton.Text = "Start"
	ButtonState.ButtonActivation(StartStopButton)
end)

ResetButton.MouseButton1Up:Connect(function()
	if	ResetButton.AutoButtonColor then
		ResetButton.AutoButtonColor = false
		ResetButton.BackgroundColor3 = GuiColor.Text_LBlack_
		humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
		TextHoney.Text = "Honey:"
		TextTime.Text = "Time:"
		TextHour.Text = "Pollen: in hout"
		TextDay.Text = "Pollen: in day"
		wait(3)
		ResetButton.BackgroundColor3 = GuiColor.Base_
		ResetButton.AutoButtonColor = true
		print(ResetButton.Name, "use")
	end
end)

end)
