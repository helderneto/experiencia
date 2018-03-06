
local cfg = {}

-- mysql credentials
cfg.db = {
host = "mysql-mariadb-7-102.zap-hosting.com", -- inserted trough ZAP
database = "zap349016-1", -- inserted trough ZAP
user = "zap349016-1", -- inserted trough ZAP
password = "rVd3Wq1QctbyUDRX", -- inserted trough ZAP
}

cfg.save_interval = 30 -- seconds
cfg.whitelist = false -- enable/disable whitelist
cfg.ignore_ip_identifier = true -- This will allow multiple same IP connections (for families etc)

-- delay the tunnel at loading (for weak connections)
cfg.load_duration = 5 -- seconds, player duration in loading mode at the first spawn
cfg.load_delay = 0 -- milliseconds, delay the tunnel communication when in loading mode
cfg.global_delay = 0 -- milliseconds, delay the tunnel communication when not in loading mode

cfg.ping_timeout = 5 -- number of minutes after a client should be kicked if not sending pings


				-- SET YOUR LANGUAGE HERE - MAKE SURE IT'S INSIDE THE ""
cfg.lang = "pt"
				-- English/Français/Italiano/Deutsche/Português/Pусский/Lietuvių/Dansk/العربية/Polskie/Español/Svenska/Suomalainen/中文/Română
cfg.debug = false


return cfg
