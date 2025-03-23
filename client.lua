--------------------------------------
--- Interior Lights, Made by FAXES ---
--------------------------------------

--- Config ---
local intCommand = "il" -- If using the command, what do you want the command to be?
local redintlight = true -- If the interior light should be red light (Used by cops usually at night for better eye adaption)
--- Code Shit ---

--- Micro Opt --
local SetVehicleInteriorlight = SetVehicleInteriorlight
local IsVehicleInteriorLightOn = IsVehicleInteriorLightOn
local IsPedInVehicle = IsPedInVehicle
local GetVehiclePedIsUsing = GetVehiclePedIsUsing
local SetVehicleFlag = SetVehicleFlag

local function toggleInteriorLights(ped,veh)
    if IsPedInVehicle(ped,veh,false) then
        if IsVehicleInteriorLightOn(veh) then
            if redintlight then SetVehicleFlag(veh,159,false) end
            SetVehicleInteriorlight(veh,false)
        else
            if redintlight then SetVehicleFlag(veh,159,true) end
            SetVehicleInteriorlight(veh,true)
        end
    else
        TriggerEvent("chat:addMessage", "^1^*You are not in a vehicle.")
    end
end

RegisterCommand(intCommand,function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    toggleInteriorLights(ped,veh)
end)
RegisterKeyMapping(intCommand,'Toggle Interior Light','KEYBOARD','L')