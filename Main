local r = reaper

  r.Undo_BeginBlock() 

start, ending = r.GetSet_LoopTimeRange( 0, 0, 0, 0, 0 )
focus = r.GetCursorContext2(true) 
env = r.GetSelectedTrackEnvelope(0)
if env == nil then 
else
aut_item = r.CountAutomationItems(env)
end

if start == ending then

-------------------- del active takes only----- ---------------------
for ii=0, r.CountSelectedMediaItems(0)-1 do                                --
  local item = r.GetSelectedMediaItem(0, ii)                                 --
if item == nil then return end                                                    --
                                                                                           --
  for ti=0, r.CountTakes(item)-1 do                                            --
    local take = r.GetMediaItemTake(item, ti)                                --    -- delete this block if you want to remove takes completely.
if ti > 0 then                                                                          --
               r.Main_OnCommand(40129, 0)  --  delete take              --
               r.Main_OnCommand(40289, 0)  --  unsel all                   --
end                                                                                      --
                                                                                           --
  end                                                                                    --
end                                                                                      --
-------------------end of del active takes only----------------------

  r.Main_OnCommand(40697, 0) -- remove items/tracks/...

else
  if focus == 1 then
    r.Main_OnCommand(40061, 0) -- split items at time selection
    r.Main_OnCommand(r.NamedCommandLookup('_SWS_SMARTREMOVE'), 0)
  elseif focus == 2 then
            if aut_item > 0 then 
              r.Main_OnCommand(41384, 0)  --  delete selected automation item

              elseif aut_item == 0 then

              r.Main_OnCommand(40333, 0)  --  delete selected points
            end

  else -- alternatively -- elseif focus == 0 then
    r.Main_OnCommand(40697, 0) -- remove tracks
  end
end

  r.Undo_EndBlock("Smart Delete", -1)
