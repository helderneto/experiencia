
local cfg = {}

-- define the first spawn position/radius of the player (very first spawn on the server, or after death)
cfg.spawn_enabled = true -- set to false to disable the feature
cfg.spawn_position = {-1108.5743408203,-2740.5861816406,-7.4101300239563}
cfg.spawn_death = {340.44674682617,-1388.2272949219,32.509239196777} -- x,y,z for death location
cfg.spawn_radius = 1

-- customization set when spawning for the first time
-- see https://wiki.fivem.net/wiki/Peds
-- mp_m_freemode_01 (male)
-- mp_f_freemode_01 (female)
cfg.default_customization = {
  model = "mp_m_freemode_01" 
}

-- init default ped parts
for i=0,19 do
  cfg.default_customization[i] = {0,0}
end

cfg.clear_phone_directory_on_death = false
cfg.lose_aptitudes_on_death = false

return cfg
 -- {1151.2432861328,-1526.7790527344,34.843448638916}