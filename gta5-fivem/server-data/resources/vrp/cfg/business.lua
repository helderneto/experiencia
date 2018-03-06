
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 500000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 60

-- commerce chamber {blipid,blipcolor}
cfg.blip = {500,2} 

-- positions of commerce chambers
cfg.commerce_chambers = {
	{1129.5776367188,-3194.1318359375,-40.396434783936}
}

return cfg
