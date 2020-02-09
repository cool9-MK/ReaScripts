local r = reaper
    local ME = r.MIDIEditor_GetActive();
    if not ME then return end;

    local take = r.MIDIEditor_GetTake(ME);

r.PreventUIRefresh(1)

local start, ending = r.GetSet_LoopTimeRange(0, 0, 0, 0, 0)
if start ~= ending then -- if  selection is active

   r.MIDIEditor_LastFocused_OnCommand(40734,0) -- Cut (smart delete events in selection)

else --if there is no selection

 r.MIDIEditor_LastFocused_OnCommand(40667,0) -- Delete notes events 

end

r.PreventUIRefresh(-1) 
r.Undo_OnStateChange2(0,"Smart Delete ME")
