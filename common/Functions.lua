---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Lucas.
--- DateTime: 09/02/2021 23:09
---

has_value = function(tab,val)
    for index,value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end