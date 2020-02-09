--[[
   * ReaScript Name:Aim Assist
   * Lua script for Cockos REAPER
   * Author: Maxim Kokarev
   * Author URI: https://forum.cockos.com/member.php?u=121750
  ]]--

local r = reaper

function main()
  r.Main_OnCommand(r.NamedCommandLookup('_WOL_SETHZOOMC_MOUSECUR'), 0) -- set zoom option when aiming is ON
  r.BR_GetMouseCursorContext()
  local pos = r.BR_GetMouseCursorContext_Position()
  if pos > -1 then
    r.SetEditCurPos2(0, pos, false, false)
  end
  r.defer(main)
end

function exit()
  r.Main_OnCommand(r.NamedCommandLookup('_WOL_SETHZOOMC_EDITPLAYCUR'), 0) -- set zoom option when aiming is OFF
  local is_new_value,filename,sectionID,cmdID,mode,resolution,val = r.get_action_context()
  r.SetToggleCommandState(sectionID, cmdID, 0)
  r.RefreshToolbar2(sectionID, cmdID)

end

local is_new_value,filename,sectionID,cmdID,mode,resolution,val = r.get_action_context()
r.SetToggleCommandState(sectionID, cmdID, 1)
r.RefreshToolbar2(sectionID, cmdID)


r.atexit(exit) 

main()
