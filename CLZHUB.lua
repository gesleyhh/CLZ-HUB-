-- ==============================================
--  ⚡ CLZ HUB • VERSÃO OFICIAL
--  💙 TEMA AZUL NEON • COMPLETO & FUNCIONAL
--  👤 CRIADOR: THOMAZ / GESLEYHH
--  🔗 GitHub: github.com/gesleyhh/CLZ-HUB-
-- ==============================================

-- SERVIÇOS
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

-- AGUARDA CARREGAMENTO
repeat task.wait() until game:IsLoaded()
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui", 10)

-- ==============================================
-- PALETA DE CORES — TEMA AZUL NEON
-- ==============================================
local C = {
    fundoEscuro  = Color3.fromRGB(10, 20, 53),
    fundoJanela  = Color3.fromRGB(15, 40, 96),
    cartao       = Color3.fromRGB(20, 60, 140),
    azulEscuro   = Color3.fromRGB(30, 90, 200),
    azulMedio    = Color3.fromRGB(50, 130, 255),
    neon         = Color3.fromRGB(100, 200, 255),
    neonBrilho   = Color3.fromRGB(150, 230, 255),
    destaque     = Color3.fromRGB(120, 210, 255),
    ativo        = Color3.fromRGB(60, 160, 255),
    ligado       = Color3.fromRGB(80, 220, 180),
    desligado    = Color3.fromRGB(30, 70, 150),
    textoClaro   = Color3.fromRGB(220, 240, 255),
    textoSuave   = Color3.fromRGB(140, 190, 255),
    aviso        = Color3.fromRGB(255, 100, 130)
}

-- ESTADO GERAL
local S = { fechar = false, abaAtual = "Main" }

-- ==============================================
-- CONFIGURAÇÕES
-- ==============================================
local Config = {
    -- MAIN / BRAWL
    AutoWinBrawls          = false,
    AutoBrawls             = false,
    RemovePortals          = false,
    WalkOnWater            = false,
    AutoSpinWheel          = false,
    AutoClaimGifts         = false,
    
    -- GLITCH
    AutoRock               = false,
    TinyRock               = false,
    StarterRock            = false,
    LegendBeachRock        = false,
    FrozenRock             = false,
    MythicalRock           = false,
    EternalRock            = false,
    LegendRock             = false,
    MuscleKingRock         = false,
    JungleRock             = false,
    
    -- FARMING
    EquipTools             = false,
    AutoPunch              = false,
    AutoSitups             = false,
    AutoWeight             = false,
    AutoPushups            = false,
    AutoHandstands         = false,
    FastStrength           = false,
    AutoEgg                = false,
    AutoShake              = false,
    HideFrames             = false,
    AntiLag                = false,
    
    -- MÁQUINAS
    JungleGym              = false,
    JungleLift             = false,
    JungleSquat            = false,
    JungleBenchPress       = false,
    JungleBoulder          = false,
    
    -- REBIRTH
    FastRebirth            = false,
    AutoRebirthTarget      = false,
    AutoRebirthInfinite    = false,
    AutoSize2              = false,
    AutoTeleportMuscleKing = false,
    
    -- PETS
    EquipSwiftSamurai      = false,
    EquipTribalOverlord    = false,
    EquipRareBoss          = false,
    AutoEquipBest          = false
}

-- ==============================================
-- FUNÇÕES AUXILIARES
-- ==============================================
local function getEvent(nome)
    local rs = ReplicatedStorage:FindFirstChild("rEvents")
    return rs and rs:FindFirstChild(nome)
end
local function getMuscleEv() return player:FindFirstChild("muscleEvent") end
local function getPlayerEv() return player:FindFirstChild("playerEvents") end
local function getPastaPets() return player:FindFirstChild("petsFolder") end

local function equipPet(nome)
    local ev = getEvent("equipPetEvent")
    local pasta = getPastaPets()
    if not ev or not pasta then return end
    for _, p in ipairs(pasta:GetDescendants()) do
        if p.Name == nome then ev:FireServer("equipPet", p) return end
    end
end

local function adicionarNeon(objeto, espessura)
    local neon = Instance.new("UIStroke")
    neon.Color = C.neon
    neon.Thickness = espessura
    neon.Transparency = 0
    neon.Parent = objeto
    
    task.spawn(function()
        while not S.fechar do
            TweenService:Create(neon, TweenInfo.new(2), {Transparency = 0.1}):Play()
            task.wait(1)
            TweenService:Create(neon, TweenInfo.new(2), {Transparency = 0}):Play()
            task.wait(1)
        end
    end)
    return neon
end

-- ==============================================
-- TELA DE CARREGAMENTO
-- ==============================================
local LoadUI = Instance.new("ScreenGui")
LoadUI.Name = "CLZ_Load"
LoadUI.ResetOnSpawn = false
LoadUI.IgnoreGuiInset = true
LoadUI.Parent = PlayerGui

local LoadBg = Instance.new("Frame")
LoadBg.Size = UDim2.new(1, 0, 1, 0)
LoadBg.BackgroundColor3 = C.fundoEscuro
LoadBg.Parent = LoadUI

local LoadBox = Instance.new("Frame")
LoadBox.Size = UDim2.new(0, 360, 0, 220)
LoadBox.AnchorPoint = Vector2.new(0.5, 0.5)
LoadBox.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadBox.BackgroundColor3 = C.fundoJanela
LoadBox.Parent = LoadBg
Instance.new("UICorner", LoadBox).CornerRadius = UDim.new(0, 20)
adicionarNeon(LoadBox, 3)

local lblTitulo = Instance.new("TextLabel")
lblTitulo.Size = UDim2.new(1, 0, 0, 70)
lblTitulo.Position = UDim2.new(0, 0, 0, 10)
lblTitulo.BackgroundTransparency = 1
lblTitulo.Text = "⚡ CLZ HUB"
lblTitulo.TextColor3 = C.neonBrilho
lblTitulo.TextSize = 42
lblTitulo.Font = Enum.Font.GothamBlack
lblTitulo.Parent = LoadBox
adicionarNeon(lblTitulo, 1.5)

local lblSub = Instance.new("TextLabel")
lblSub.Size = UDim2.new(1, 0, 0, 25)
lblSub.Position = UDim2.new(0, 0, 0, 80)
lblSub.BackgroundTransparency = 1
lblSub.Text = "Criado por THOMAZ / GESLEYHH"
lblSub.TextColor3 = C.textoSuave
lblSub.TextSize = 14
lblSub.Font = Enum.Font.GothamBold
lblSub.Parent = LoadBox

local StatusTxt = Instance.new("TextLabel")
StatusTxt.Size = UDim2.new(1, 0, 0, 20)
StatusTxt.Position = UDim2.new(0, 0, 0, 165)
StatusTxt.BackgroundTransparency = 1
StatusTxt.Text = "Iniciando..."
StatusTxt.TextColor3 = C.destaque
StatusTxt.TextSize = 13
StatusTxt.Parent = LoadBox

local BarFundo = Instance.new("Frame")
BarFundo.Size = UDim2.new(1, -40, 0, 12)
BarFundo.Position = UDim2.new(0, 20, 0, 130)
BarFundo.BackgroundColor3 = C.desligado
BarFundo.Parent = LoadBox
Instance.new("UICorner", BarFundo).CornerRadius = UDim.new(0, 6)

local Barra = Instance.new("Frame")
Barra.Size = UDim2.new(0, 0, 1, 0)
Barra.BackgroundColor3 = C.neon
Barra.Parent = BarFundo
Instance.new("UICorner", Barra).CornerRadius = UDim.new(0, 6)

task.spawn(function()
    local etapas = {
        {"Inicializando sistema...", 0.33},
        {"Carregando módulos...", 0.66},
        {"✅ Pronto!", 1}
    }
    for _, dados in ipairs(etapas) do
        StatusTxt.Text = dados[1]
        TweenService:Create(Barra, TweenInfo.new(0.7), {Size = UDim2.new(dados[2], 0, 1, 0)}):Play()
        task.wait(0.8)
    end
    TweenService:Create(LoadBg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.wait(1)
    LoadUI:Destroy()
end)

-- ==============================================
-- INTERFACE PRINCIPAL
-- ==============================================
task.wait(3)

local MainUI = Instance.new("ScreenGui")
MainUI.Name = "CLZ_HUB"
MainUI.ResetOnSpawn = false
MainUI.IgnoreGuiInset = true
MainUI.Parent = PlayerGui

-- BOTÃO RESTAURAR
local BtnShow = Instance.new("TextButton")
BtnShow.Name = "Restaurar"
BtnShow.Size = UDim2.new(0, 55, 0, 55)
BtnShow.Position = UDim2.new(0.02, 0, 0.18, 0)
BtnShow.BackgroundColor3 = C.cartao
BtnShow.Text = "CLZ"
BtnShow.TextColor3 = C.neonBrilho
BtnShow.TextSize = 24
BtnShow.Font = Enum.Font.GothamBlack
BtnShow.Visible = false
BtnShow.AutoLocalize = false
BtnShow.Parent = MainUI
Instance.new("UICorner", BtnShow).CornerRadius = UDim.new(0, 14)
adicionarNeon(BtnShow, 2)

-- JANELA PRINCIPAL
local Janela = Instance.new("Frame")
Janela.Size = UDim2.new(0.92, 0, 0.88, 0)
Janela.AnchorPoint = Vector2.new(0.5, 0.5)
Janela.Position = UDim2.new(0.5, 0, 0.5, 0)
Janela.BackgroundColor3 = C.fundoJanela
Janela.Parent = MainUI
Instance.new("UICorner", Janela).CornerRadius = UDim.new(0, 24)
adicionarNeon(Janela, 2.5)

-- FAIXA DO TOPO
local Topo = Instance.new("Frame")
Topo.Size = UDim2.new(1, 0, 0, 56)
Topo.BackgroundColor3 = C.cartao
Topo.Parent = Janela
Instance.new("UICorner", Topo).CornerRadius = UDim.new(0, 24)

local lblTopo = Instance.new("TextLabel")
lblTopo.Size = UDim2.new(0.75, 0, 1, 0)
lblTopo.Position = UDim2.new(0, 16, 0, 0)
lblTopo.BackgroundTransparency = 1
lblTopo.Text = "⚡ CLZ HUB"
lblTopo.TextColor3 = C.neonBrilho
lblTopo.TextSize = 24
lblTopo.Font = Enum.Font.GothamBlack
lblTopo.TextXAlignment = Enum.TextXAlignment.Left
lblTopo.Parent = Topo
adicionarNeon(lblTopo, 1)

-- BOTÕES DE CONTROLE
local BtnMin = Instance.new("TextButton")
BtnMin.Size = UDim2.new(0, 40, 0, 40)
BtnMin.Position = UDim2.new(1, -90, 0, 8)
BtnMin.Text = "−"
BtnMin.TextSize = 22
BtnMin.Font = Enum.Font.GothamBold
BtnMin.TextColor3 = C.neon
BtnMin.BackgroundColor3 = C.azulEscuro
BtnMin.AutoLocalize = false
BtnMin.Parent = Topo
Instance.new("UICorner", BtnMin).CornerRadius = UDim.new(0, 10)
adicionarNeon(BtnMin, 1.5)

local BtnClose = Instance.new("TextButton")
BtnClose.Size = UDim2.new(0, 40, 0, 40)
BtnClose.Position = UDim2.new(1, -46, 0, 8)
BtnClose.Text = "✕"
BtnClose.TextSize = 20
BtnClose.Font = Enum.Font.GothamBold
BtnClose.TextColor3 = C.aviso
BtnClose.BackgroundColor3 = Color3.fromRGB(80, 25, 40)
BtnClose.AutoLocalize = false
BtnClose.Parent = Topo
Instance.new("UICorner", BtnClose).CornerRadius = UDim.new(0, 10)
adicionarNeon(BtnClose, 1.5)

-- FUNÇÕES DE CONTROLE
local function Minimizar() Janela.Visible = false BtnShow.Visible = true end
local function Restaurar() Janela.Visible = true BtnShow.Visible = false end
BtnMin.MouseButton1Click:Connect(Minimizar)
BtnShow.MouseButton1Click:Connect(Restaurar)
BtnClose.MouseButton1Click:Connect(function() S.fechar = true MainUI:Destroy() end)

-- ABAS
local AreaAbas = Instance.new("Frame")
AreaAbas.Size = UDim2.new(1, -20, 0, 42)
AreaAbas.Position = UDim2.new(0, 10, 0, 65)
AreaAbas.BackgroundTransparency = 1
AreaAbas.Parent = Janela

local ListaAbas = {"Main", "Glitch", "Farming", "Rebirth", "Pets"}
local BotoesAbas = {}
for i, nome in ipairs(ListaAbas) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 70, 1, 0)
    btn.Position = UDim2.new(0, (i - 1) * 75, 0, 0)
    btn.Text = nome
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = C.textoSuave
    btn.BackgroundColor3 = C.cartao
    btn.AutoLocalize = false
    btn.Parent = AreaAbas
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    adicionarNeon(btn, 1)
    BotoesAbas[nome] = btn
end

-- ÁREA DE CONTEÚDO COM ROLAGEM
local PaiRolagem = Instance.new("Frame")
PaiRolagem.Size = UDim2.new(1, -20, 1, -120)
PaiRolagem.Position = UDim2.new(0, 10, 0, 110)
PaiRolagem.BackgroundColor3 = C.cartao
PaiRolagem.ClipsDescendants = true
PaiRolagem.Parent = Janela
Instance.new("UICorner", PaiRolagem).CornerRadius = UDim.new(0, 16)
adicionarNeon(PaiRolagem, 1.5)

local Conteudo = Instance.new("Frame")
Conteudo.Size = UDim2.new(1, 0, 0, 1150)
Conteudo.BackgroundTransparency = 1
Conteudo.Parent = PaiRolagem

-- SISTEMA DE ROLAGEM
local rolando = false
local inicioY, inicioPos

PaiRolagem.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        rolando = true
        inicioY = inp.Position.Y
        inicioPos = Conteudo.Position.Y.Offset
    end
end)
PaiRolagem.InputChanged:Connect(function(inp)
    if not rolando then return end
    if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
        local delta = inp.Position.Y - inicioY
        local nova = inicioPos + delta
        local vis = PaiRolagem.AbsoluteSize.Y
        local tot = Conteudo.AbsoluteSize.Y
        if tot > vis then
            local maxBaixo, maxAlto = 0, -(tot - vis)
            nova = math.clamp(nova, maxAlto, maxBaixo)
            Conteudo.Position = UDim2.new(0, 0, 0, nova)
        end
    end
end)
PaiRolagem.InputEnded:Connect(function() rolando = false end)

UserInputService.InputChanged:Connect(function(inp, gp)
    if inp.UserInputType == Enum.UserInputType.MouseWheel and Janela.Visible then
        local pos = gp:GetMouseLocation()
        local canto = PaiRolagem.AbsolutePosition
        local tam = PaiRolagem.AbsoluteSize
        local dentro = pos.X >= canto.X and pos.X <= canto.X + tam.X
                   and pos.Y >= canto.Y and pos.Y <= canto.Y + tam.Y
        if not dentro then return end
        local passo = inp.Position.Z * 60
        local nova = Conteudo.Position.Y.Offset + passo
        local vis = PaiRolagem.AbsoluteSize.Y
        local tot = Conteudo.AbsoluteSize.Y
        if tot > vis then
            local maxBaixo, maxAlto = 0, -(tot - vis)
            nova = math.clamp(nova, maxAlto, maxBaixo)
            Conteudo.Position = UDim2.new(0, 0, 0, nova)
        end
    end
end)

-- ==============================================
-- COMPONENTES
-- ==============================================
local function mkTitulo(pai, y, texto)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 32)
    lbl.Position = UDim2.new(0, 10, 0, y)
    lbl.BackgroundTransparency = 1
    lbl.Text = texto
    lbl.TextColor3 = C.neonBrilho
    lbl.TextSize = 17
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = pai
end

local function mkToggle(pai, y, texto, chave)
    local linha = Instance.new("Frame")
    linha.Size = UDim2.new(1, -20, 0, 52)
    linha.Position = UDim2.new(0, 10, 0, y)
    linha.BackgroundColor3 = C.fundoJanela
    linha.Parent = pai
    Instance.new("UICorner", linha).CornerRadius = UDim.new(0, 12)

    local caixa = Instance.new("Frame")
    caixa.Size = UDim2.new(0, 26, 0, 26)
    caixa.Position = UDim2.new(0, 10, 0.5, -13)
    caixa.BackgroundColor3 = C.desligado
    caixa.Parent = linha
    Instance.new("UICorner", caixa).CornerRadius = UDim.new(0, 8)
    local bCaixa = adicionarNeon(caixa, 1.5)

    local marca = Instance.new("Frame")
    marca.Size = UDim2.new(0, 16, 0, 16)
    marca.Position = UDim2.new(0, 5, 0.5, -8)
    marca.BackgroundColor3 = C.ligado
    marca.BackgroundTransparency = 1
    marca.Parent = linha
    Instance.new("UICorner", marca).CornerRadius = UDim.new(0, 6)

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.new(1, -55, 1, 0)
    txt.Position = UDim2.new(0, 50, 0, 0)
    txt.BackgroundTransparency = 1
    txt.Text = texto
    txt.TextSize = 14
    txt.TextColor3 = C.textoClaro
    txt.Font = Enum.Font.Gotham
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.Parent = linha

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Parent = linha

    local function atualizar()
        if Config[chave] then
            caixa.BackgroundColor3 = C.ativo
            bCaixa.Color = C.neonBrilho
            marca.BackgroundTransparency = 0
        else
            caixa.BackgroundColor3 = C.desligado
            bCaixa.Color = C.azulMedio
            marca.BackgroundTransparency = 1
        end
    end
    btn.MouseButton1Click:Connect(function()
        Config[chave] = not Config[chave]
        atualizar()
    end)
    atualizar()
end

-- ==============================================
-- MONTAR TODAS AS ABAS
-- ==============================================
local Aba = {}
for _, nome in ipairs(ListaAbas) do
    Aba[nome] = Instance.new("Frame")
    Aba[nome].Size = UDim2.new(1, 0, 1, 0)
    Aba[nome].BackgroundTransparency = 1
    Aba[nome].Visible = (nome == "Main")
    Aba[nome].Parent = Conteudo
end

-- ABA MAIN
mkTitulo(Aba.Main, 10, "⚔️ Brawls")
mkToggle(Aba.Main, 52, "Auto Win Brawls", "AutoWinBrawls")
mkToggle(Aba.Main, 114, "Auto Brawls", "AutoBrawls")
mkTitulo(Aba.Main, 176, "🔧 Outros")
mkToggle(Aba.Main, 218, "Remover Portais", "RemovePortals")
mkToggle(Aba.Main, 280, "Andar na Água", "WalkOnWater")
mkToggle(Aba.Main, 342, "Girar Roleta", "AutoSpinWheel")
mkToggle(Aba.Main, 404, "Coletar Presentes", "AutoClaimGifts")

-- ABA GLITCH
mkTitulo(Aba.Glitch, 10, "⚡ Glitching")
mkToggle(Aba.Glitch, 52, "Auto Pedra", "AutoRock")
mkToggle(Aba.Glitch, 114, "Pedra Pequena", "TinyRock")
mkToggle(Aba.Glitch, 176, "Pedra Inicial", "StarterRock")
mkToggle(Aba.Glitch, 238, "Pedra Praia Lendária", "LegendBeachRock")
mkToggle(Aba.Glitch, 300, "Pedra Congelada", "FrozenRock")
mkToggle(Aba.Glitch, 362, "Pedra Mística", "MythicalRock")
mkToggle(Aba.Glitch, 424, "Pedra Eterna", "EternalRock")
mkToggle(Aba.Glitch, 486, "Pedra Lendária", "LegendRock")
mkToggle(Aba.Glitch, 548, "Pedra Rei Muscular", "MuscleKingRock")
mkToggle(Aba.Glitch, 610, "Pedra Selva", "JungleRock")

-- ABA FARMING
mkTitulo(Aba.Farming, 10, "🌾 Farming")
mkToggle(Aba.Farming, 52, "Equipar Ferramentas", "EquipTools")
mkToggle(Aba.Farming, 114, "Auto Soco", "AutoPunch")
mkToggle(Aba.Farming, 176, "Auto Abdominais", "AutoSitups")
mkToggle(Aba.Farming, 238, "Auto Peso", "AutoWeight")
mkToggle(Aba.Farming, 300, "Auto Flexões", "AutoPushups")
mkToggle(Aba.Farming, 362, "Auto Parada de Mão", "AutoHandstands")
mkTitulo(Aba.Farming, 424, "⚡ Rápido")
mkToggle(Aba.Farming, 466, "Força Rápida", "FastStrength")
mkTitulo(Aba.Farming, 528, "🥚 Ovos & Árvores")
mkToggle(Aba.Farming, 570, "Auto Chocar Ovo", "AutoEgg")
mkToggle(Aba.Farming, 632, "Auto Sacudir Árvore", "AutoShake")
mkTitulo(Aba.Farming, 694, "⚙️ Otimização")
mkToggle(Aba.Farming, 736, "Ocultar Telas", "HideFrames")
mkToggle(Aba.Farming, 798, "Anti Lag", "AntiLag")
mkTitulo(Aba.Farming, 860, "🏋️ Máquinas")
mkToggle(Aba.Farming, 902, "Academia da Selva", "JungleGym")
mkToggle(Aba.Farming, 964, "Levantamento Selva", "JungleLift")
mkToggle(Aba.Farming, 1026, "Agachamento Selva", "JungleSquat")

-- ABA REBIRTH
mkTitulo(Aba.Rebirth, 10, "🔄 Renascimento")
mkToggle(Aba.Rebirth, 52, "Renascimento Rápido", "FastRebirth")
mkToggle(Aba.Rebirth, 114, "Renascer Quando Alvo", "AutoRebirthTarget")
mkToggle(Aba.Rebirth, 176, "Renascer Sempre", "AutoRebirthInfinite")
mkToggle(Aba.Rebirth, 238, "Tamanho 2", "AutoSize2")
mkToggle(Aba.Rebirth, 300, "Ir ao Rei Muscular", "AutoTeleportMuscleKing")

-- ABA PETS
mkTitulo(Aba.Pets, 10, "🐾 Pets")
mkToggle(Aba.Pets, 52, "Samurai Veloz", "EquipSwiftSamurai")
mkToggle(Aba.Pets, 114, "Senhor Tribal", "EquipTribalOverlord")
mkToggle(Aba.Pets, 176, "Chefe Raro", "EquipRareBoss")
mkToggle(Aba.Pets, 238, "Melhor Pet Automático", "AutoEquipBest")

-- TROCA DE ABA
local function trocarAba(nome)
    S.abaAtual = nome
    Conteudo.Position = UDim2.new(0, 0, 0, 0)
    for n, btn in pairs(BotoesAbas) do
        btn.BackgroundColor3 = n == nome and C.ativo or C.cartao
        btn.TextColor3 = n == nome and C.neonBrilho or C.textoSuave
    end
    for n, quadro in pairs(Aba) do
        quadro.Visible = (n == nome)
    end
end
for n, btn in pairs(BotoesAbas) do
    btn.MouseButton1Click:Connect(function() trocarAba(n) end)
end
trocarAba("Main")

-- ==============================================
-- LOOP PRINCIPAL — TUDO FUNCIONAL
-- ==============================================
task.spawn(function()
    while not S.fechar do
        task.wait(0.15)
        if S.fechar then break end

        local ev = {
            winBrawl        = getEvent("winBrawlEvent"),
            joinBrawl       = getEvent("joinBrawlEvent"),
            remPortal       = getEvent("removePortalEvent"),
            agua            = getEvent("walkOnWaterEvent"),
            roleta          = getEvent("spinWheelEvent"),
            presente        = getEvent("claimGiftEvent"),
            