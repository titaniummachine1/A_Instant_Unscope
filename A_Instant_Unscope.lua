--[[      scope_Canceling lua        ]]--
--[[          --Authors--           ]]--
--[[           Terminator           ]]--
--[[  (github.com/titaniummachine1  ]]--
--[[ credit for seradotwav for help ]]--

client.RemoveConVarProtection("cyoa_pda_open")
client.Command("cyoa_pda_open " .. ('0'), true)

local function OnCreateMove(userCmd)
  local pLocal = entities.GetLocalPlayer()
  if not pLocal then return end
  local wtunzoom = false
  
  if input.IsButtonReleased(MOUSE_RIGHT) and not pLocal:InCond(1) then
      wtunzoom = true
  end

  
        --pLocalOrigin = UpdateLocals()
    if wtunzoom then
      client.Command("cyoa_pda_open " .. ('1'), true)
      client.ChatPrintf("works")
    elseif not pLocal:InCond(1) then
      if userCmd.command_number % 8 == 0 then -- executes code every 8 ticks. (Potentially inconsistent, but it works).
      client.Command("cyoa_pda_open " .. ('0'), true)
      end
    end
  end

--[[ Remove the menu when unloaded ]]--
local function OnUnload()                                -- Called when the script is unloaded
  client.Command('play "ui/buttonclickrelease"', true) -- Play the "buttonclickrelease" sound
end

--[[ Unregister previous callbacks ]]--
callbacks.Unregister("CreateMove", "MCT_CreateMove")            -- Unregister the "CreateMove" callback
callbacks.Unregister("Unload", "MCT_Unload")                    -- Unregister the "Unload" callback
--[[ Register callbacks ]]--
callbacks.Register("CreateMove", "MCT_CreateMove", OnCreateMove)             -- Register the "CreateMove" callback
callbacks.Register("Unload", "MCT_Unload", OnUnload)                         -- Register the "Unload" callback
--[[ Play sound when loaded ]]--
client.Command('play "ui/buttonclick"', true) -- Play the "buttonclick" sound when the script is loaded
