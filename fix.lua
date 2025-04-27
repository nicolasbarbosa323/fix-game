-- ANTI-CAOS VISUAL + HINT + CHAT FUNCIONAL 😎

local player = game.Players.LocalPlayer

-- ⚙️ LIMPA ILUMINAÇÃO
local lighting = game.Lighting
lighting.FogEnd = 1e6
lighting.FogStart = 0
lighting.Brightness = 2
lighting.ClockTime = 14
lighting.TimeOfDay = "14:00:00"
lighting.Ambient = Color3.fromRGB(128, 128, 128)
lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

for _, v in pairs(lighting:GetChildren()) do
    if v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or
       v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Sky") then
        v:Destroy()
    end
end

-- 🔊 REMOVE SONS
for _, s in pairs(game.Workspace:GetDescendants()) do
    if s:IsA("Sound") then
        s:Stop()
        s:Destroy()
    end
end

-- 💬 REMOVE MENSAGENS NA TELA MAS MANTÉM O CHAT
if player:FindFirstChild("PlayerGui") then
    for _, ui in pairs(player.PlayerGui:GetDescendants()) do
        if not ui:IsDescendantOf(player.PlayerGui:FindFirstChild("Chat") or {}) then
            if ui:IsA("TextLabel") or ui:IsA("TextButton") or ui:IsA("BillboardGui") or ui:IsA("Frame") then
                ui:Destroy()
            end
        end
    end
end

-- 🔥 REMOVE PARTICULAS
for _, obj in pairs(game.Workspace:GetDescendants()) do
    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
        obj:Destroy()
    end
end

if player.Character then
    for _, obj in pairs(player.Character:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
            obj:Destroy()
        end
    end
end

-- 🖼️ REMOVE DECALS
for _, d in pairs(game.Workspace:GetDescendants()) do
    if d:IsA("Decal") then
        d:Destroy()
    end
end

if player.Character then
    for _, d in pairs(player.Character:GetDescendants()) do
        if d:IsA("Decal") then
            d:Destroy()
        end
    end
end

-- 💀 REMOVE JUMPSCARES
for _, v in pairs(game.Workspace:GetChildren()) do
    if v.Name:lower():find("jumpscare") or (v:IsA("Model") and v.Name:lower():find("jumpscare")) then
        v:Destroy()
    end
end

-- 🔒 BLOQUEIA COISAS FUTURAS (sem afetar chat)
game.Workspace.DescendantAdded:Connect(function(child)
    if child:IsA("Sound") or child:IsA("ParticleEmitter") or child:IsA("Trail") or
       child:IsA("Smoke") or child:IsA("Fire") or child:IsA("Decal") then
        child:Destroy()
    end
end)

if player:FindFirstChild("PlayerGui") then
    player.PlayerGui.DescendantAdded:Connect(function(ui)
        if not ui:IsDescendantOf(player.PlayerGui:FindFirstChild("Chat") or {}) then
            if ui:IsA("TextLabel") or ui:IsA("TextButton") or ui:IsA("BillboardGui") or ui:IsA("Frame") then
                ui:Destroy()
            end
        end
    end)
end

-- 🌟 HINT DA VITÓRIA
local hint = Instance.new("Hint", game.CoreGui)
hint.Text = "Game Fixed By Galaxy_Impact :D"
task.delay(2, function()
    if hint then hint:Destroy() end
end)

print("✅ Visual limpo, chat salvo e jogo consertado por Galaxy_Impact!")

