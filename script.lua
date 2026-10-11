return(function(...)
    local _0=game
    local _1=_0.GetService
    local _2=_1(_0,"Players")
    local _3=_1(_0,"UserInputService")
    local _4=_2.LocalPlayer
    local _5=_4:WaitForChild("PlayerGui")

    local _6={
        [0x01]="RunixScriptGui",
        [0x02]="Runix Script",
        [0x03]="RS",
        [0x04]=36,
        [0x05]=false,
        [0x06]=false,
        [0x07]=1000,
        [0x08]=Color3.fromRGB(210,25,35),
        [0x09]=Color3.fromRGB(24,24,30),
        [0x0A]=Color3.fromRGB(190,32,44),
        [0x0B]=Enum.Font.GothamBold,
        [0x0C]=UDim.new,
        [0x0D]=UDim2.new,
        [0x0E]=Instance.new
    }

    local _7={
        [0x01]=function(_a)
            return typeof(_a)=="Instance" and _a.Parent~=nil
        end,

        [0x02]=function(_a,_b)
            return math.clamp(_a,_b, _6[0x07])
        end,

        [0x03]=function(_a)
            return tostring(_a)
        end,

        [0x04]=function(_a,_b)
            return _a and _b or not _a and not _b
        end
    }

    local _8=_5:FindFirstChild(_6[0x01])
    if _8 then _8:Destroy() end

    local function _9(_a,_b,_c)
        local _d=_6[0x0E](_a)
        for _e,_f in pairs(_b) do
            _d[_e]=_f
        end
        _d.Parent=_c
        return _d
    end

    local function _A(_a,_b)
        _9("UICorner",{
            CornerRadius=_6[0x0C](0,_b or 8)
        },_a)

        _9("UIStroke",{
            Color=_6[0x08],
            Thickness=1.5,
            Transparency=0.1
        },_a)
    end

    local _B=_9("ScreenGui",{
        Name=_6[0x01],
        ResetOnSpawn=false,
        DisplayOrder=100
    },_5)

    local _C=_9("TextButton",{
        Name=_6[0x03],
        Size=_6[0x0D](0,48,0,48),
        Position=_6[0x0D](1,-70,0,120),
        BackgroundColor3=_6[0x08],
        BorderSizePixel=0,
        Text=_6[0x03],
        TextColor3=Color3.new(1,1,1),
        TextSize=19,
        Font=_6[0x0B],
        Active=true
    },_B)
    _A(_C,8)

    local _D=_9("Frame",{
        Name="MainMenu",
        Size=_6[0x0D](0,280,0,230),
        Position=_6[0x0D](1,-365,0,180),
        BackgroundColor3=_6[0x09],
        BorderSizePixel=0,
        Active=true,
        Visible=false
    },_B)
    _A(_D,10)

    local _E=_9("TextLabel",{
        Name="Header",
        Size=_6[0x0D](1,0,0,43),
        BackgroundColor3=_6[0x0A],
        BorderSizePixel=0,
        Text=_6[0x02],
        TextColor3=Color3.new(1,1,1),
        TextSize=18,
        Font=_6[0x0B],
        Active=true
    },_D)

    local _F=_9("TextLabel",{
        Size=_6[0x0D](1,-24,0,25),
        Position=_6[0x0D](0,12,0,52),
        BackgroundTransparency=1,
        Text="Speed",
        TextColor3=Color3.new(1,1,1),
        TextSize=14,
        Font=Enum.Font.Gotham,
        TextXAlignment=Enum.TextXAlignment.Left
    },_D)

    local _G=_9("TextBox",{
        Size=_6[0x0D](1,-24,0,35),
        Position=_6[0x0D](0,12,0,80),
        BackgroundColor3=Color3.fromRGB(42,42,51),
        BorderSizePixel=0,
        Text="36",
        PlaceholderText="Enter speed",
        TextColor3=Color3.new(1,1,1),
        ClearTextOnFocus=false,
        Font=Enum.Font.Gotham,
        TextSize=14
    },_D)
    _A(_G,6)

    local _H=_9("TextButton",{
        Size=_6[0x0D](1,-24,0,34),
        Position=_6[0x0D](0,12,0,123),
        BackgroundColor3=_6[0x0A],
        BorderSizePixel=0,
        Text="Apply Speed",
        TextColor3=Color3.new(1,1,1),
        Font=_6[0x0B],
        TextSize=14
    },_D)
    _A(_H,6)

    local _I=_9("TextLabel",{
        Size=_6[0x0D](1,-24,0,20),
        Position=_6[0x0D](0,12,0,160),
        BackgroundTransparency=1,
        Text="Current speed: 36",
        TextColor3=Color3.fromRGB(200,200,210),
        Font=Enum.Font.Gotham,
        TextSize=12,
        TextXAlignment=Enum.TextXAlignment.Left
    },_D)

    local _J=_9("TextButton",{
        Size=_6[0x0D](1,-24,0,32),
        Position=_6[0x0D](0,12,0,187),
        BackgroundColor3=Color3.fromRGB(55,55,65),
        BorderSizePixel=0,
        Text="Infinite Jump: OFF",
        TextColor3=Color3.new(1,1,1),
        Font=_6[0x0B],
        TextSize=13
    },_D)
    _A(_J,6)

    local function _K(_a,_b)
        local _c=false
        local _d,_e,_f

        _a.InputBegan:Connect(function(_g)
            if _g.UserInputType~=Enum.UserInputType.MouseButton1
                and _g.UserInputType~=Enum.UserInputType.Touch then
                return
            end

            _c=true
            _d=_g.Position
            _e=_b.Position

            _g.Changed:Connect(function()
                if _g.UserInputState==Enum.UserInputState.End then
                    _c=false
                end
            end)
        end)

        _3.InputChanged:Connect(function(_g)
            if not _c then return end
            if _g.UserInputType~=Enum.UserInputType.MouseMovement
                and _g.UserInputType~=Enum.UserInputType.Touch then
                return
            end

            _f=_g
            local _h=_f.Position-_d

            _b.Position=UDim2.new(
                _e.X.Scale,_e.X.Offset+_h.X,
                _e.Y.Scale,_e.Y.Offset+_h.Y
            )
        end)
    end

    _K(_C,_C)
    _K(_E,_D)

    _C.Activated:Connect(function()
        _6[0x06]=not _6[0x06]
        _D.Visible=_6[0x06]
    end)

    local _L,_M

    local function _N(_a)
        if _M then
            _M:Disconnect()
            _M=nil
        end

        _L=_a:WaitForChild("Humanoid")
        _L.WalkSpeed=_6[0x04]

        _M=_L:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if _7[0x01](_L) and _L.WalkSpeed~=_6[0x04] then
                _L.WalkSpeed=_6[0x04]
            end
        end)
    end

    if _4.Character then
        task.spawn(_N,_4.Character)
    end
    _4.CharacterAdded:Connect(_N)

    _H.Activated:Connect(function()
        local _a=tonumber(_G.Text)

        if not _a or _a~= _a or math.abs(_a)==math.huge
            or _a<0 or _a>_6[0x07] then
            _I.Text="Enter a number from 0 to 1000"
            return
        end

        _6[0x04]=_a

        if _7[0x01](_L) then
            _L.WalkSpeed=_7[0x02](_a,0)
        end

        _I.Text="Current speed: ".._7[0x03](_a)
    end)

    _J.Activated:Connect(function()
        _6[0x05]=not _6[0x05]

        _J.Text="Infinite Jump: "..(_6[0x05] and "ON" or "OFF")
        _J.BackgroundColor3=_6[0x05]
            and Color3.fromRGB(35,135,75)
            or Color3.fromRGB(55,55,65)
    end)

    _3.JumpRequest:Connect(function()
        if not _6[0x05] then return end

        local _a=_4.Character
        local _b=_a and _a:FindFirstChildOfClass("Humanoid")

        if _b and _b.Health>0 then
            _b.Jump=true
            _b:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    return({
        [0x01]=_B,
        [0x02]=_D,
        [0x03]=_C,
        [0x04]=_6
    })
end)(...)