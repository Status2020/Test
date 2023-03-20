--[[for _,v in pairs(game.CoreGui:GetChildren()) do
	if	v.Name == "[SubsidiaryGUI]MainGUI" then
		v:Destroy()
	end
end]]

local GuiColor = {
	Base_	= Color3.new(0.184314,0.105882,0.4431373);
	Red_	= Color3.new(0.7,0.3,0.3);
	Green_	= Color3.new(0.3,0.7,0.3);
	Blue_	= Color3.new(0.3,0.3,0.7);
	LWhite_	= Color3.new(0.7,0.7,0.7);
	LBlack_	= Color3.new(0.3,0.3,0.3);
	
	Text_White_	= Color3.new(1,1,1);
	Text_Black_	= Color3.new(0,0,0);
	Text_Red_	= Color3.new(1,0.5,0.5);
	Text_Green_	= Color3.new(0.5,1,0.5);
	Text_Blue_	= Color3.new(0.5,0.5,1);
	
	On_Color_G	= Color3.new(0, 1, 0);
	On_Color_B	= Color3.new(0, 1, 1);
	On_Color_Y	= Color3.new(1, 1, 0);}

local ObjectsPositions = {
	StartFrame_Pos1 = UDim2.new(0, -50, 0.17, 0);
	StartFrame_Pos2 = UDim2.new(0, 0, 0.17, 0);
	MenuFrame_Pos1 = UDim2.new(0, -95, 0, 15);
	MenuFrame_Pos2 = UDim2.new(0, 5, 0, 15);}

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

function createBotton(properties)
	local botton_ = createInstance("TextButton",{BackgroundColor3=GuiColor.Base_,BackgroundTransparency=0.4,BorderSizePixel=3,
		AutoButtonColor=true,TextColor3=GuiColor.Text_White_,Font=Enum.Font.GothamBold,TextSize=11,TextTransparency=0,TextWrapped=false})
	for i,v in pairs(properties) do
		botton_[i] = v
	end
	createCorner(botton_,4)
	return botton_
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
	end;
	Position = function(buTTon)
		local X = buTTon.Column * buTTon.GapX + (buTTon.Column - 1) * buTTon.SizeX
		local Y = (buTTon.Row + buTTon.Segment - 1) * buTTon.GapY + (buTTon.Row - 1) * buTTon.SizeY
		return UDim2.new(0, X, 0, Y)
	end;
	Size = function(buTTon)
		return UDim2.new(0, buTTon.SizeX, 0, buTTon.SizeY)
	end}

local  SubsidiaryMainGUI = createInstance("ScreenGui",{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,
	Name="[SubsidiaryGUI]MainGUI",})

------------------StartFrame------------------
local StartFrame = createInstance("Frame",{Active=true, Selectable=true, Draggable=true,
	BackgroundColor3=GuiColor.LBlack_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 40, 0, 15),Position=ObjectsPositions.StartFrame_Pos1,Name="StartFrame",Parent=SubsidiaryMainGUI})

local HeadingFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=1,
	Size=UDim2.new(0, 40, 0, 15),Position=UDim2.new(0, 0, 0, 0),Name="HeadingFrame",Parent=StartFrame})
	createCorner(HeadingFrame,2)

local HideMenuBotton = createBotton({Size=UDim2.new(0, 30, 0, 15),Position=UDim2.new(0, 0, 0, 0),
	Text=">>>",Name="HideMenuBotton",Parent=HeadingFrame,TextSize=10})

local SpawnBotton = createBotton({Size=UDim2.new(0, 95, 0, 15),Position=UDim2.new(0, 35, 0, 0),
	Text="< 0 >",Name="SpawnBotton",Parent=HeadingFrame,TextSize=10,Visible=false})	
------------------MenuFrame------------------
local MenuButtonSet = {Row=1;Column=1;Segment=1;GapX=0;GapY=5;SizeX=25;SizeY=18}
local MenuFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=ObjectsPositions.MenuFrame_Pos1,Name="MenuFrame",Parent=StartFrame,Visible=false})
	
	BForms.Forms(MenuButtonSet,1,5,1)
local DestroyBotton = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="X",Name="DestroyBotton",Parent=MenuFrame,TextSize=16,BackgroundColor3=GuiColor.Red_})
	BForms.Forms(MenuButtonSet,2,5,1)
local TPMenuBotton = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="SHOP",Name="TPMenuBotton",Parent=MenuFrame,TextSize=8})
	BForms.Forms(MenuButtonSet,3,5,1)
local TPMenuBotton2 = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="DISP",Name="TPMenuBotton2",Parent=MenuFrame,TextSize=8})
	BForms.Forms(MenuButtonSet,4,5,1)
local TPMenuBotton3 = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="DRIVE",Name="TPMenuBotton3",Parent=MenuFrame,TextSize=7})
	BForms.Forms(MenuButtonSet,5,5,1)
local TPBearBotton = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="Bear",Name="TPBearBotton",Parent=MenuFrame,TextSize=7})
	BForms.Forms(MenuButtonSet,6,5,1)
local TPMatchBotton = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="Match",Name="TPMatchBotton",Parent=MenuFrame,TextSize=7})
	BForms.Forms(MenuButtonSet,7,5,1)
local UseMenuBotton = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="Use",Name="UseMenuBotton",Parent=MenuFrame,TextSize=10})
	BForms.Forms(MenuButtonSet,8,5,1)
local TimeMenuBotton = createBotton({Size=BForms.Size(MenuButtonSet),Position=BForms.Position(MenuButtonSet),
	Text="Time",Name="TimeMenuBotton",Parent=MenuFrame,TextSize=10})

------------------TP_1Frame------------------
local ButtonSet = {Row=1;Column=1;Segment=1;GapX=0;GapY=4;SizeX=90;SizeY=18}
local TP_1Frame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="TP_1Frame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local NoobShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Noob Shop",Name="NoobShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,2,1,1)
local ProShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Pro Shop",Name="ProShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,3,1,1)
local TopShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Top Shop",Name="TopShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,4,1,1)
local MentalShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Mental Shop",Name="MentalShopBotton",Parent=TP_1Frame,BackgroundColor3=GuiColor.LWhite_})
	BForms.Forms(ButtonSet,5,1,1)
local BeeShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Bee Shop",Name="BeeShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,6,1,1)
local TreatShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Treat Shop",Name="TreatShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,7,1,1)
local TicketShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Ticket Shop",Name="TicketShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,8,1,1)
local RoyalJellyShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="RoyalJelly Shop",Name="RoyalJellyShopBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,9,1,1)
local TicketRoyalJellyBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Ticket RoyalJelly",Name="TicketRoyalJellyBotton",Parent=TP_1Frame})
	BForms.Forms(ButtonSet,10,1,1)
local PlanterShopBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Planter Shop",Name="PlanterShopBotton",Parent=TP_1Frame,TextColor3=GuiColor.Text_Green_})

------------------TP_2Frame------------------
local TP_2Frame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="TP_2Frame",Parent=MenuFrame,Visible=false})
	
	BForms.Forms(ButtonSet,1,1,1)
local HoneyStormBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Honey Storm",Name="HoneyStormBotton",Parent=TP_2Frame})
	BForms.Forms(ButtonSet,2,1,1)
local StrawberryDispenserBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Strawberry Disp",Name="StrawberryDispenserBotton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,3,1,1)
local BlueberryDispenserBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blueberry Disp",Name="BlueberryDispenserBotton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,4,1,1)
local GlueDispenserBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Glue Dispenser",Name="GlueDispenserBotton",Parent=TP_2Frame,BackgroundColor3=GuiColor.LWhite_})
	BForms.Forms(ButtonSet,5,1,1)
local SproutBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Sprout",Name="SproutBotton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Green_})
	BForms.Forms(ButtonSet,6,1,1)
local GumdropDispenserBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Gumdrop Disp",Name="GumdropDispenserBotton",Parent=TP_2Frame})
	BForms.Forms(ButtonSet,7,1,1)
local TreatDispenserBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Treat Dispenser",Name="TreatDispenserBotton",Parent=TP_2Frame})
	BForms.Forms(ButtonSet,8,1,1)
local RedClubhouseBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Red Clubhouse",Name="RedClubhouseBotton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,9,1,1)
local BlueClubhouseBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blue Clubhouse",Name="BlueClubhouseBotton",Parent=TP_2Frame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,10,1,1)
local ClubHoneyBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Club Honey",Name="ClubHoneyBotton",Parent=TP_2Frame})

------------------TP_3Frame------------------
local TP_3Frame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="TP_3Frame",Parent=MenuFrame,Visible=false})
	
	BForms.Forms(ButtonSet,1,1,1)
local StarRoomBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Star Room",Name="StarRoomBotton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,2,1,1)
local WealthClockBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Wealth Clock",Name="WealthClockBotton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,3,1,1)
local BlenderBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blender",Name="BlenderBotton",Parent=TP_3Frame,TextColor3=GuiColor.Text_Green_})
	BForms.Forms(ButtonSet,4,1,1)
local MoonBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Moon",Name="MoonBotton",Parent=TP_3Frame,BackgroundColor3=GuiColor.LWhite_})
	BForms.Forms(ButtonSet,5,1,1)
local AntBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Ant",Name="AntBotton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,6,1,1)
local OnettBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Onett",Name="OnettBotton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,7,1,1)
local TopTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text=" ",Name="TopTPBotton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,8,1,1)
local GummyMaskBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Gummy Mask",Name="GummyMaskBotton",Parent=TP_3Frame})
	BForms.Forms(ButtonSet,9,1,1)
local DemonmMaskBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Demonm Mask",Name="DemonmMaskBotton",Parent=TP_3Frame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,10,1,1)
local DiamondMaskBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Diamond Mask",Name="DiamondMaskBotton",Parent=TP_3Frame,TextColor3=GuiColor.Text_Blue_})

------------------BearFrame------------------
local BearFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="BearFrame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local PolarBearTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Polar Bear",Name="PolarBearTPBotton",Parent=BearFrame})
	BForms.Forms(ButtonSet,2,1,1)
local BlackBearTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Black Bear",Name="BlackBearTPBotton",Parent=BearFrame,TextColor3=GuiColor.LBlack_})
	BForms.Forms(ButtonSet,3,1,1)
local BrownBearTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Brown Bear",Name="BrownBearTPBotton",Parent=BearFrame,TextColor3=GuiColor.Text_Green_})
	BForms.Forms(ButtonSet,4,1,1)
local RileyBeeTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Riley Bee",Name="RileyBeeTPBotton",Parent=BearFrame,TextColor3=GuiColor.Text_Red_})
	BForms.Forms(ButtonSet,5,1,1)
local BuckoBeeTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Bucko Bee",Name="BuckoBeeTPBotton",Parent=BearFrame,TextColor3=GuiColor.Text_Blue_})
	BForms.Forms(ButtonSet,6,1,1)
local StickBugTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Stick Bug",Name="StickBugTPBotton",Parent=BearFrame})
	BForms.Forms(ButtonSet,7,1,1)
local WindyShrinelTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Windy Shrinel",Name="WindyShrinelTPBotton",Parent=BearFrame,TextColor3=GuiColor.LWhite_})
	BForms.Forms(ButtonSet,8,1,1)
local KingBeetleTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="King Beetle",Name="KingBeetleTPBotton",Parent=BearFrame})
	BForms.Forms(ButtonSet,9,1,1)
local TunnelBearTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Tunnel Bear",Name="TunnelBearTPBotton",Parent=BearFrame})
	BForms.Forms(ButtonSet,10,1,1)
local SnailTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Snail",Name="SnailTPBotton",Parent=BearFrame})
	BForms.Forms(ButtonSet,11,1,1)
local ComandorTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Comandor",Name="ComandorTPBotton",Parent=BearFrame})

------------------MatchFrame------------------
local MatchFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="MatchFrame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local NightMatchTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="NightMatch",Name="NightMatchTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,2,1,1)
local ExtremeMatchTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="ExtremeMatch",Name="ExtremeMatchTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,3,1,1)
local MegaMatchTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="MegaMatch",Name="MegaMatchTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,4,1,1)
local MemoryMatchTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="MemoryMatch",Name="MemoryMatchTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,5,1,1)
local HoneyConvertor1TPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Convertor1",Name="HoneyConvertor1TPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,6,1,1)
local HoneyConvertor2TPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Convertor2",Name="HoneyConvertor2TPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,7,1,1)
local HoneyConvertor3TPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Convertor3",Name="HoneyConvertor3TPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,8,1,1)
local CoconutDispenserTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Coconut Disp",Name="CoconutDispenserTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,9,1,1)
local RedFieldBoostTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Red Boost",Name="RedFieldBoostTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,10,1,1)
local BlueFieldBoostTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Blue Boost",Name="BlueFieldBoostTPBotton",Parent=MatchFrame})
	BForms.Forms(ButtonSet,11,1,1)
local MountainTopBoostTPBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="White Boost",Name="MountainTopBoostTPBotton",Parent=MatchFrame})

------------------UseFrame------------------
local UseFrame = createInstance("Frame",{BackgroundColor3=GuiColor.Base_,Transparency=1,BorderSizePixel=0,
	Size=UDim2.new(0, 1, 0, 1),Position=UDim2.new(0, 0, 0, 0),Name="UseFrame",Parent=MenuFrame,Visible=false})

	BForms.Forms(ButtonSet,1,1,1)
local AutoCloudBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Cloud",Name="AutoCloudBotton",Parent=UseFrame})
	BForms.Forms(ButtonSet,2,1,1)
local AutoJellyBeans = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="Jelly Beans",Name="AutoJellyBeans",Parent=UseFrame})
	BForms.Forms(ButtonSet,3,1,1)
local AutoMagicBeanBotton = createBotton({Size=BForms.Size(ButtonSet),Position=BForms.Position(ButtonSet),
	Text="MagicBean",Name="AutoMagicBeanBotton",Parent=UseFrame,TextColor3=GuiColor.Text_Green_})

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
local StartStopBotton = createBotton({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text="Start",Name="StartStopBotton",Parent=TimeFrame})

	BForms.Forms(TimeSet,6,1,3)
local ResetBotton = createBotton({Size=BForms.Size(TimeSet),Position=BForms.Position(TimeSet),
	Text="Reset",Name="ResetBotton",Parent=TimeFrame})

return SubsidiaryMainGUI
end

local S_U_B_S_I_D_I_A_R_Y_Gui = createGui()
local StartFrame = S_U_B_S_I_D_I_A_R_Y_Gui:WaitForChild("StartFrame")
local HeadingFrame = StartFrame:WaitForChild("HeadingFrame")
local HideMenuBotton = HeadingFrame:WaitForChild("HideMenuBotton")
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

local SpawnBotton = HeadingFrame:WaitForChild("SpawnBotton")

HideMenuBotton.MouseButton1Up:connect(function()
	if	HideMenuBotton.Text == ">>>" then
		HideMenuBotton.Text = "<<<"
		MenuFrame.Visible = true
		SpawnBotton.Visible = true
		StartFrame.Size=UDim2.new(0, 135, 0, 15)
		HeadingFrame.Size=UDim2.new(0, 135, 0, 15)
	else
		HideMenuBotton.Text = ">>>"
		MenuFrame.Visible = false
		SpawnBotton.Visible = false
		StartFrame.Size=UDim2.new(0, 40, 0, 15)
		HeadingFrame.Size=UDim2.new(0, 40, 0, 15)
	end
end)

SpawnBotton.MouseButton1Up:connect(function()
	humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
	humanoidRootPart.CFrame = game.Players.LocalPlayer.SpawnPos.Value
	wait(1)
	game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")
end)


local DestroyBotton = MenuFrame:WaitForChild("DestroyBotton")
local TPMenuBotton = MenuFrame:WaitForChild("TPMenuBotton")
local TPMenuBotton2 = MenuFrame:WaitForChild("TPMenuBotton2")
local TPMenuBotton3 = MenuFrame:WaitForChild("TPMenuBotton3")
local TPBearBotton = MenuFrame:WaitForChild("TPBearBotton")
local TPMatchBotton = MenuFrame:WaitForChild("TPMatchBotton")
local UseMenuBotton = MenuFrame:WaitForChild("UseMenuBotton")
local TimeMenuBotton = MenuFrame:WaitForChild("TimeMenuBotton")

DestroyBotton.MouseButton1Up:connect(function()
	allStop = true
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
			DestroyBotton.BackgroundColor3=GuiColor.Red_
		frame.Visible = true
		button.BackgroundColor3 = GuiColor.On_Color_B
		MenuFrame:TweenPosition(ObjectsPositions.MenuFrame_Pos2,
			Enum.EasingDirection.Out, Enum.EasingStyle.Quad, .2, true)
	end
end

TPMenuBotton.MouseButton1Up:Connect(function()displayFrame(TPMenuBotton,TP_1Frame)end)
TPMenuBotton2.MouseButton1Up:Connect(function()displayFrame(TPMenuBotton2,TP_2Frame)end)
TPMenuBotton3.MouseButton1Up:Connect(function()displayFrame(TPMenuBotton3,TP_3Frame)end)
TPBearBotton.MouseButton1Up:Connect(function()displayFrame(TPBearBotton,BearFrame)end)
TPMatchBotton.MouseButton1Up:Connect(function()displayFrame(TPMatchBotton,MatchFrame)end)
UseMenuBotton.MouseButton1Up:Connect(function()displayFrame(UseMenuBotton,UseFrame)end)
TimeMenuBotton.MouseButton1Up:Connect(function()displayFrame(TimeMenuBotton,TimeFrame)end)

end)

spawn(function()-----TP_1Frame-----

local NoobShopBotton = TP_1Frame:WaitForChild("NoobShopBotton")
local ProShopBotton = TP_1Frame:WaitForChild("ProShopBotton")
local TopShopBotton = TP_1Frame:WaitForChild("TopShopBotton")
local MentalShopBotton = TP_1Frame:WaitForChild("MentalShopBotton")
local BeeShopBotton = TP_1Frame:WaitForChild("BeeShopBotton")
local TreatShopBotton = TP_1Frame:WaitForChild("TreatShopBotton")
local TicketShopBotton = TP_1Frame:WaitForChild("TicketShopBotton")
local RoyalJellyShopBotton = TP_1Frame:WaitForChild("RoyalJellyShopBotton")
local TicketRoyalJellyBotton = TP_1Frame:WaitForChild("TicketRoyalJellyBotton")
local PlanterShopBotton = TP_1Frame:WaitForChild("PlanterShopBotton")

NoobShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Tool Shop"] end)
ProShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Tool Shop 2"] end)
TopShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["MountainTop Shop"] end)
MentalShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Mental Shop"] end)
BeeShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Bee Shop"] end)
TreatShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Treat Shop"] end)
TicketShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Ticket Shop"] end)
RoyalJellyShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["RoyalJelly Shop"] end)
TicketRoyalJellyBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Ticket RoyalJelly Shop"] end)
PlanterShopBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Planter Shop"] end)

end)

spawn(function()-----TP_2Frame-----

local HoneyStormBotton = TP_2Frame:WaitForChild("HoneyStormBotton")
local StrawberryDispenserBotton = TP_2Frame:WaitForChild("StrawberryDispenserBotton")
local BlueberryDispenserBotton = TP_2Frame:WaitForChild("BlueberryDispenserBotton")
local GlueDispenserBotton = TP_2Frame:WaitForChild("GlueDispenserBotton")
local SproutBotton = TP_2Frame:WaitForChild("SproutBotton")
local GumdropDispenserBotton = TP_2Frame:WaitForChild("GumdropDispenserBotton")
local TreatDispenserBotton = TP_2Frame:WaitForChild("TreatDispenserBotton")
local RedClubhouseBotton = TP_2Frame:WaitForChild("RedClubhouseBotton")
local BlueClubhouseBotton = TP_2Frame:WaitForChild("BlueClubhouseBotton")
local ClubHoneyBotton = TP_2Frame:WaitForChild("ClubHoneyBotton")

HoneyStormBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honeystorm Dispensor"] end)
StrawberryDispenserBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Strawberry Dispenser"] end)
BlueberryDispenserBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Blueberry Dispenser"] end)
GlueDispenserBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Glue Dispenser"] end)
SproutBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Sprout Dispenser"] end)
GumdropDispenserBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Gumdrop Dispenser"] end)
TreatDispenserBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Treat Dispenser"] end)
RedClubhouseBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Red Clubhouse"] end)
BlueClubhouseBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Blue Clubhouse"] end)
ClubHoneyBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Club Honey"] end)

end)

spawn(function()-----TP_3Frame-----

local StarRoomBotton = TP_3Frame:WaitForChild("StarRoomBotton")
local WealthClockBotton = TP_3Frame:WaitForChild("WealthClockBotton")
local BlenderBotton = TP_3Frame:WaitForChild("BlenderBotton")
local MoonBotton = TP_3Frame:WaitForChild("MoonBotton")
local AntBotton = TP_3Frame:WaitForChild("AntBotton")
local OnettBotton = TP_3Frame:WaitForChild("OnettBotton")
local TopTPBotton = TP_3Frame:WaitForChild("TopTPBotton")
local GummyMaskBotton = TP_3Frame:WaitForChild("GummyMaskBotton")
local DemonmMaskBotton = TP_3Frame:WaitForChild("DemonmMaskBotton")
local DiamondMaskBotton = TP_3Frame:WaitForChild("DiamondMaskBotton")

StarRoomBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Star Room"] end)
WealthClockBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Wealth Clock"] end)
BlenderBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Blender"] end)
MoonBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Moon"] end)
AntBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Ant"] end)
OnettBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Onett"] end)
TopTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Top"] end)
GummyMaskBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Gummy Mask"] end)
DiamondMaskBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Diamond Mask"] end)
DemonmMaskBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Demonm Mask"] end)

end)

spawn(function()-----BearFrame-----

local PolarBearTPBotton = BearFrame:WaitForChild("PolarBearTPBotton")
local BlackBearTPBotton = BearFrame:WaitForChild("BlackBearTPBotton")
local BrownBearTPBotton = BearFrame:WaitForChild("BrownBearTPBotton")
local RileyBeeTPBotton = BearFrame:WaitForChild("RileyBeeTPBotton")
local BuckoBeeTPBotton = BearFrame:WaitForChild("BuckoBeeTPBotton")
local StickBugTPBotton = BearFrame:WaitForChild("StickBugTPBotton")
local WindyShrinelTPBotton = BearFrame:WaitForChild("WindyShrinelTPBotton")
local KingBeetleTPBotton = BearFrame:WaitForChild("KingBeetleTPBotton")
local TunnelBearTPBotton = BearFrame:WaitForChild("TunnelBearTPBotton")
local SnailTPBotton = BearFrame:WaitForChild("SnailTPBotton")
local ComandorTPBotton = BearFrame:WaitForChild("ComandorTPBotton")

PolarBearTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Polar Bear"] end)
BlackBearTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Black Bear"] end)
BrownBearTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Brown Bear"] end)
RileyBeeTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Riley Bee"] end)
BuckoBeeTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Bucko Bee"] end)
StickBugTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Stick Bug"] end)
WindyShrinelTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Windy Shrine"] end)
KingBeetleTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["King Beetle"] end)
TunnelBearTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Tunnel Bear"] end)
SnailTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Snail"] end)
ComandorTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Comandor"] end)

end)

spawn(function()-----MatchFrame-----

local NightMatchTPBotton = MatchFrame:WaitForChild("NightMatchTPBotton")
local ExtremeMatchTPBotton = MatchFrame:WaitForChild("ExtremeMatchTPBotton")
local MegaMatchTPBotton = MatchFrame:WaitForChild("MegaMatchTPBotton")
local MemoryMatchTPBotton = MatchFrame:WaitForChild("MemoryMatchTPBotton")
local HoneyConvertor1TPBotton = MatchFrame:WaitForChild("HoneyConvertor1TPBotton")
local HoneyConvertor2TPBotton = MatchFrame:WaitForChild("HoneyConvertor2TPBotton")
local HoneyConvertor3TPBotton = MatchFrame:WaitForChild("HoneyConvertor3TPBotton")
local CoconutDispenserTPBotton = MatchFrame:WaitForChild("CoconutDispenserTPBotton")
local RedFieldBoostTPBotton = MatchFrame:WaitForChild("RedFieldBoostTPBotton")
local BlueFieldBoostTPBotton = MatchFrame:WaitForChild("BlueFieldBoostTPBotton")
local MountainTopBoostTPBotton = MatchFrame:WaitForChild("MountainTopBoostTPBotton")

NightMatchTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Night Match"] end)
ExtremeMatchTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Extreme Match"] end)
MegaMatchTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Mega Match"] end)
MemoryMatchTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Memory Match"] end)
HoneyConvertor1TPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honey Convertor 1"] end)
HoneyConvertor2TPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honey Convertor 2"] end)
HoneyConvertor3TPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Honey Convertor 3"] end)
CoconutDispenserTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Coconut Dispenser"] end)
RedFieldBoostTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Redfield Boost"] end)
BlueFieldBoostTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["Bluefield Boost"] end)
MountainTopBoostTPBotton.MouseButton1Up:Connect(function() humanoidRootPart.CFrame = Waypoints["MountainTop Boost"] end)

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

spawn(function()-----UseFrame-----

local AutoCloudBotton = UseFrame:WaitForChild("AutoCloudBotton")
local AutoJellyBeans = UseFrame:WaitForChild("AutoJellyBeans")
local AutoMagicBeanBotton = UseFrame:WaitForChild("AutoMagicBeanBotton")

AutoCloudBotton.MouseButton1Up:Connect(function()
	if	AutoCloudBotton.BackgroundColor3 == GuiColor.Base_ then
		AutoCloudBotton.BackgroundColor3 = GuiColor.On_Color_G
		while AutoCloudBotton.BackgroundColor3 == GuiColor.On_Color_G and trackingFunctionIs do	
			local A_1 = {["Name"] = "Cloud Vial"}
			local Event = game:GetService("ReplicatedStorage").Events.PlayerActivesCommand
			Event:FireServer(A_1)
			wait(2)
			Event:FireServer(A_1)
			wait(180)
		end
	else
		AutoCloudBotton.BackgroundColor3 = GuiColor.Base_
	end
end)

AutoJellyBeans.MouseButton1Up:Connect(function()
	if	AutoJellyBeans.BackgroundColor3 == GuiColor.Base_ then
		AutoJellyBeans.BackgroundColor3 = GuiColor.On_Color_G
		while AutoJellyBeans.BackgroundColor3 == GuiColor.On_Color_G and trackingFunctionIs do	
			local A_1 = {["Name"] = "Jelly Beans"}
			local Event = game:GetService("ReplicatedStorage").Events.PlayerActivesCommand
			Event:FireServer(A_1)
			wait(50)
		end
	else
		AutoJellyBeans.BackgroundColor3 = GuiColor.Base_
	end
end)

AutoMagicBeanBotton.MouseButton1Up:Connect(function()
	if AutoMagicBeanBotton.BackgroundColor3 == GuiColor.Base_ and trackingFunctionIs then
		AutoMagicBeanBotton.BackgroundColor3 = GuiColor.On_Color_G
		while AutoMagicBeanBotton.BackgroundColor3 == GuiColor.On_Color_G and trackingFunctionIs do	
			local A = {["Name"] = "Magic Bean"}
			local Event = game:GetService("ReplicatedStorage").Events.PlayerActivesCommand
			Event:FireServer(A)
			wait(10)
		end
	else
		AutoMagicBeanBotton.BackgroundColor3 = GuiColor.Base_
	end
end)

end)

spawn(function()-----TimeFrame-----

local TextHoney = TimeFrame:WaitForChild("TextHoney")
local TextTime = TimeFrame:WaitForChild("TextTime")
local TextHour = TimeFrame:WaitForChild("TextHour")
local TextDay = TimeFrame:WaitForChild("TextDay")
local StartStopBotton = TimeFrame:WaitForChild("StartStopBotton")
local ResetBotton = TimeFrame:WaitForChild("ResetBotton")

StartStopBotton.MouseButton1Up:Connect(function()
--print(game.Players.LocalPlayer.CoreStats.Pollen.Value)
--print(os.date("%H",3777)..":"..os.date("%M",3777)..":"..os.date("%S",3777))
--print((os.date("%H",7)-2)..":"..os.date("%M",7)..":"..os.date("%S",7))
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

	if	StartStopBotton.BackgroundColor3 == GuiColor.Base_ then
		local timeStart_ = os.time()
		local timeDelta_ = 0
		local honeyStart_ = game.Players.LocalPlayer.CoreStats.Honey.Value
		local honeyDelta_ = 0
		StartStopBotton.Text = "Stop"
		StartStopBotton.BackgroundColor3 = GuiColor.On_Color_Y
		while StartStopBotton.AutoButtonColor do
			TextHoney.Text = formatNumber(honeyDelta_)
			TextTime.Text = ((os.date("%H",timeDelta_)-2)..":"..os.date("%M",timeDelta_)..":"..os.date("%S",timeDelta_))--os.date("%X",timeDelta_)
			TextHour.Text = formatNumber((honeyDelta_*3600)/timeDelta_).." in hout"
			TextDay.Text = formatNumber((honeyDelta_*3600*24)/timeDelta_).." in day"
			repeat
				if	allStop then return end
				wait(1)
			until HideMenuBotton.Text == "<<<"
			timeDelta_ = os.time() - timeStart_
			honeyDelta_ = game.Players.LocalPlayer.CoreStats.Honey.Value - honeyStart_
		end
		StartStopBotton.Text = "Start"
		StartStopBotton.AutoButtonColor = true
		StartStopBotton.BackgroundColor3 = GuiColor.Base_
	else
		StartStopBotton.AutoButtonColor = false
		StartStopBotton.BackgroundColor3 = GuiColor.LBlack_
	end
end)

ResetBotton.MouseButton1Up:Connect(function()
	if	ResetBotton.AutoButtonColor then
		ResetBotton.AutoButtonColor = false
		ResetBotton.BackgroundColor3 = GuiColor.LBlack_
		humanoidRootPart = workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart
		TextHoney.Text = "Honey:"
		TextTime.Text = "Time:"
		TextHour.Text = "Pollen: in hout"
		TextDay.Text = "Pollen: in day"
		wait(3)
		ResetBotton.BackgroundColor3 = GuiColor.Base_
		ResetBotton.AutoButtonColor = true
	end
end)

end)
