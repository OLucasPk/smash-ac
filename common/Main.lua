---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Lucas.
--- DateTime: 10/02/2021 14:52
---

-- Declare Proxy and Tunnel from vRP
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")

-- Declare vRP and vRPC from vRP
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")

-- Declare vPUNISHMENTS and vCONTROL from this script
vPUNISHMENTS = Tunnel.getInterface("Punishments")
vCONTROL = Tunnel.getInterface("ResourceController")

-- Global function Trace Msg
TraceMsg = function(msg,error)
    error = error or false
    prefix = "^2["

    if error then
        prefix = "^1["
    end
    Citizen.Trace(prefix..'smash-ac'.."] "..msg.."\n^7")
end

-- Global Function Send To Discord
sendToDiscord = function(data)
    local src = source
    local user = vRP.getUserId(src)
    local uID = vRP.getUserIdentity(user)
    local infos = ExtractIdentifiers(src)

    -- Webhook

    if data["requireScreenshoot"] then
        exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(user,Config["WEBHOOK"],{ encoding = "jpg", quality = 0.6 },30000,
        function(error)
            if error then
                return print("^1ERROR: " .. error)
            end
            print("^2[smash-ac] ^7Screenshot sended scessfully.")
        end)
    end
end

-- Extract Identifiers
function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end