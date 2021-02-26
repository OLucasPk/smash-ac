---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Lucas.
--- DateTime: 09/02/2021 15:03
---

-- Resource Start Controller
AddEventHandler('onResourceStart',function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return;
    end

    if GetCurrentResourceName() ~= "smash-ac" then
        TraceMsg('Voce nao possui autorizacao de alterar o nome desta resource.',true); -- without spelling
        return;
    end

    TraceMsg('Este servidor permanece protegido.',false);
end)

-- Resource Stop Controller
AddEventHandler('onResourceStop',function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return;
    end

    TraceMsg('Sistema desligado pelo lado do servidor.',false);
end)