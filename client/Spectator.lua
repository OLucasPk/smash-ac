---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Lucas.
--- DateTime: 09/02/2021 17:17
---

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local spectator = NetworkIsInSpectatorMode()
        if spectator == 1 then
            vPUNISHMENTS.applyPunish({ reason = "Modo espectador", punishment = "Ban", requireScreenshoot = true });
        end
    end
end)