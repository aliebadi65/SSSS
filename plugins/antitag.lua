antitag = {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then -- Ignore mods,owner,admins
    return
  end
local data = load_data(_config.moderation.data)
if data[tostring(msg.to.id)]['settings']['tag'] then
if data[tostring(msg.to.id)]['settings']['tag'] == 'yes' then
if antitag[msg.from.id] == true then
delete_msg(msg.id, ok_cb, true)
return
end
delete_msg(msg.id, ok_cb, true)
antitag[msg.from.id] = true
end
end
end
local function cron()
antichat = {} -- Clear antichat table
end
return {
patterns = {
"@(.+)",
"@"
},
run = run,
cron = cron
}
end
