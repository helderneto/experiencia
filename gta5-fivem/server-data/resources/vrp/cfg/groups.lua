
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are superadmin."}) end},
    "player.group.add",
    "player.group.remove",
    "player.givemoney",
    "player.giveitem"
  },
  ["admin"] = {
    "admin.tickets",
    "admin.announce",
	"admin.menu",
	"admin.easy_unjail",
	"admin.spikes",
	"admin.godmode",
	"admin.spawnveh",
	"admin.deleteveh",
	"player.blips",
	"player.tptowaypoint",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
     -- ["god"] = {
    -- "admin.god" -- reset survivals/health periodically
  -- },
  ["recruiter"] = {
    "player.list",
	"player.group.add",
    "player.group.remove",
    },
  ["mod"] = {
	"admin.tickets",
    "admin.announce",
    "player.list",
    "player.kick",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
    --"player.calladmin",
	"player.fix_haircut",
	"player.check",
	--"mugger.mug",
    "police.askid",
    "police.store_weapons",
	"coma.skipper",
	"coma.caller",
	"player.store_money",
	"player.check",
	"player.loot",
	"player.player_menu",
	--"player.userlist",
    "police.seizable",	-- can be seized
	"user.paycheck",
	"probar:permisos",
	"meta:permisos",
	"coke:permisos",
	"motero:permisos"
  },
  ["Pescador"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Pescador."}) end
	},
	"mission.delivery.fish",
    "fisher.service",
	"fisher.vehicle"
    },
  ["Piloto de Carga"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Piloto	de Carga, salario: 2000€."}) end
	},
	"mission.pilot.cargo",
	"pilot.vehicle",
	"pilot.paycheck"
    },
  ["Piloto de Linha Aerea"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Piloto, Salario : 2000€."}) end
	},
    "airlines.service",
	"air.vehicle",
	"air.paycheck"
  },
  ["Transporte Medicinal"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Transportador Medicinal."}) end
	},
	"mission.delivery.medical",
    "medical.service",
	"medical.vehicle"
    },
  ["Traficante de Armas"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Tornaste-te Traficante de Armas, seu bandido!."}) end
	},
	"mission.weapons.smuggler",
    "smuggler.service"
    },
  ["Agente"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{true}) end
    },
    "police.cloakroom",
	"highway.cloakroom",
    "police.pc",
    --"police.handcuff",
	"hotkey.handcuff",
    "police.putinveh",
    "police.getoutveh",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	--"player.list",
	"police.paycheck",
	"police.mission",
	--"player.blips",
	"police.menu_interaction"
  },
  ["Police Detective"] = {  
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{true}) end
    },
    "police.cloakroom",
	"highway.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	--"player.list",
	"Detective.paycheck",
	"police.menu_interaction",
	--"player.blips",
	"police.mission"
  },
  ["INEM Chefe"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Es Chefe do INEM, Salario : 5000€."}) end
	},
    "emergency.revive",
	"coma.emergency",
	--"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	--"police.menu_interaction",
	"emsChief.paycheck",
	--"player.blips",
	"ems.mission"
  },
  ["INEM Paramedico"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Es Paramedico do INEM, Salario : 2000€."}) end
	},
    "emergency.revive",
	"coma.emergency",
	--"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	--"police.menu_interaction",
	"emsMedic.paycheck",
	--"player.blips",
	"ems.mission"
  },
  ["INEM Comandante"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Es Comandante do INEM, Salario : 3000€."}) end
	},
    "emergency.revive",
	"coma.emergency",
	--"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	--"police.menu_interaction",
	"emsLieutenant.paycheck",
	--"player.blips",
	"ems.mission"
  },
  ["INEM Busca e Salvamento"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Es INEM Busca & Salvamento, Salario : 2500€."}) end
	},
    "emergency.revive",
	"coma.emergency",
	--"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	--"police.menu_interaction",
	"emsSearchRescue.paycheck",
	--"player.blips",
	"ems.mission"
  },
  ["Mecanico"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Mecanico, Salario : 2000€"}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
	"mission.repair.satellite_dishes",
	"mission.repair.wind_turbines",
	"repair.vehicle",
	"repair.market",
	"repair.paycheck"
  },
  ["Falsificador"] = {
    _config = { gtype = "job",
	onjoin = function(player) vRPclient.notify(player,{"Tornaste-te Falsificador, vai buscar Cartoes de Credito aos hackers."}) end
	},
    "fraud.credit_cards",
	"forger.mission"
  },
  ["Taxista"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Taxista, carrega DEL para comecar missoes. Salario : 2000€."}) end
	},
    "uber.service",
	"uber.vehicle",
	"uber.mission",
	"uber.paycheck"
  },
 -- ["Gunrunning"] = {
   -- _config = { gtype = "job",
	--onspawn = function(player) vRPclient.notify(player,{"Coming soon, Please wait!"}) end
  --}
--},
  ["Desempregado"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Estas Desempregado, vai ao Centro de Emprego."}) end
	},
	"citizen.paycheck"
  },
  ["TelePizza"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Agora entregas Pizzas, salario : 2000€."}) end
	},
	"mission.delivery.food",
	"delivery.vehicle",
	"delivery.paycheck"
  },
  ["Coletor de Lixo"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Coletor de Lixo, Salario : 2000€."}) end
	},
	"mission.collect.trash", -- mission permission
	"trash.vehicle", -- garage permission
	"trash.paycheck" -- paycheck permission
  },
  ["Advogado"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Advogado, Salario : 2000€."}) end
	},
	"Lawyer.vehicle",
	"Lawyer.whitelisted",
	"Lawyer.cloakroom",
	"Lawyer.paycheck"
  },
  ["Traficante"] = {
    _config = { gtype = "job",
	    onjoin = function(player) vRPclient.notify(player,{"Tronaste-te Tranficante, seu bandido!."}) end
	  },
    "mission.drugseller.weed",
    "drugseller.market",
    "harvest.weed"
  },
  -- ["Santa"] = {
    -- _config = { gtype = "job",
	    -- onspawn = function(player) vRPclient.notify(player,{"You are Santa, ho ho ho."}) end
	  -- },
    -- "mission.santa", -- What mission Santa has
    -- "santa.vehicle", -- Access to his garage
	-- "santa.paycheck", -- How much santa gets paid per 15 mins
	-- "santa.cloakroom", -- Santa's cloakroom
    -- "harvest.presents" -- What he gathers (item transformers.lua)
  -- },
  ["Hacker"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Hacker, seu bandido!."}) end
	},
	"mission.hacker.information",
	"hacker.hack",
	"hacker.credit_cards"
  },
  ["Prosegur"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Condutor da Prosegur, salario : 2000€"}) end
	},
	"mission.bankdriver.moneybank",
	"mission.bankdriver.moneybank2",
	"bankdriver.vehicle",
	"bankdriver.paycheck",
	"bankdriver.money"
  },
  ["Juiz"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Tornaste-te Juiz. Salario : 5000€"}) end
	},
	"judge.paycheck",
	"Judge.whitelisted"
  },
  ["Cadete"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"Cadet.vehicle",
	"Cadet.loadshop",
	"cop.whitelisted",
	"Cadet.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["UEP"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"SWAT.cloakroom",
    "police.pc",
    --"police.handcuff",
	"hotkey.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"SWAT.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"SWAT.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["Chief of Police"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Chief.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["Bounty Hunter"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Bounty.cloakroom",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.service",
    "police.wanted",
    "Bounty.vehicle",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"Bounty.vehicle",
	"Bounty.loadshop",
	"police.menu_interaction",
	"cop.whitelisted"
  },
  ["Sheriff"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"sheriff.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["State Trooper"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Commander.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
    ["Deputy Sheriff"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Deputy.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
      ["Agente Principal"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
	"hotkey.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Captain.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
    ["Comissario"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
	"hotkey.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Lieutenant.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
      ["Police Detective"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Detective.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
    ["Intendente"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.pc",
    --"police.handcuff",
	"hotkey.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Sergeant.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
      ["Dispatcher"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
    "police.pc",
    "police.check",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	--"emergency.market",
	--"emergency.revive",
	--"emergency.shop",
	"cop.whitelisted",
	"Dispatch.paycheck",
	"police.menu_interaction",
	"police.mission"
  },


  -- ["trafficguard"] = {
    -- _config = { gtype = "job",
	  -- onjoin = function(player) vRPclient.setCop(player,{true}) end,
      -- onspawn = function(player) vRPclient.setCop(player,{true}) end,
      -- onleave = function(player) vRPclient.setCop(player,{false}) end
	-- },
	-- "police.cloakroom",
    -- "police.pc",
    -- "police.handcuff",
    -- "police.putinveh",
    -- "police.getoutveh",
    -- "police.check",
    -- "police.service",
    -- "police.wanted",
    -- "police.seize.weapons",
    -- "police.seize.items",
    -- "police.jail",
    -- "police.fine",
    -- "police.announce",
    -- "-police.store_weapons",
    -- "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	-- "police.vehicle",
	-- "police.loadshop",
	-- "cop.whitelisted",
	-- "trafficguard.paycheck"
  -- },
  
  
  -- whitelist group for police, emergency and president jobs / add player to this group and user can view the job selection / search in the map
  -- moderator=president / president is guy from the server give a player group cop ems moderator when admin is offline / sallary : $10.000
  ["pilot"] = {
    "pilot.whitelisted"
  },
  ["cop"] = {
    "cop.whitelisted"
  },
  ["Exotic Car Dealer"] = {
   	_config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"You are an Exotic Car Dealer"}) end
	},
	"exotic.whitelisted",
    "exotic.vehicle",
    "player.group.add",
    "player.group.remove",
   -- "player.list"
  },
  ["buyer"] = {  
    "exotic.vehicle"
  },
  ["ems"] = {  
    "ems.whitelisted"
  },
  ["moderator"] = {
    "president.whitelisted"
  },
  ["lavagem"] = {
  _config = {onspawn = function(player) vRPclient.notify(player,{"Es dono de uma empresa!"}) end},
  },
  ["vip10"] = {  
    "vip.loadshop",
	"player.calladmin"
  },
  ["vip20"] = {  
    "vip.loadshop",
	"vip.vehicle",
	"player.calladmin"
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin",
	"recruiter"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Centro de Emprego"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
    "Taxista",
    "Mecanico",
	"TelePizza",
	"Prosegur",
	"Pescador",
	"Transporte Medicinal",
    "Desempregado"
  },
  ["PSP"] = { -- Alta Street
    _config = {x = 447.35137939453, y = -975.57592773438, z = 30.689584732056, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"Agente Principal",
	"Comissario",
	"Intendente",
	"Agente",
	"Cadete",
	"UEP",
	"Desempregado"
    },
  ["Police job 2"] = { -- Sandy Shores
    _config = {x = 1857.5961914063, y = 3688.8952636719, z = 34.267040252686, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Desempregado"
    },
  ["Police job 3"] = { -- Paleto Bay
    _config = {x = -449.00927734375, y = 6017.1953125, z = 31.716377258301, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Desempregado"
    },
  ["INEM"] = { -- Spawn Hospital
    _config = {x =  249.50639343262, y = -1375.0694580078, z = 39.534378051758, blipid = 351, blipcolor = 3, permissions = {"ems.whitelisted"} },
    "INEM Chefe",
    "INEM Comandante",
    "INEM Busca e Salvamento",
	"INEM Paramedico",
	"Desempregado"
  },
  ["Advogado"] = {
    _config = {x = -1911.9273681641, y = -569.71649169922, z = 19.097215652466, blipid = 351, blipcolor = 7, permissions = {"Lawyer.whitelisted"} },
    "Advogado",
	"Desempregado"
  },
  ["Vendedor de Drogas"] = {
    _config = {x = -229.17204284668, y = -2655.1748046875, z = 6.0002965927124},
    "Traficante",
    "Desempregado"
  },
  ["Trafico de Armas"] = {
    _config = {x = 283.10546875, y = 6788.7104492188, z = 15.695198059082, blipid =  150, blipcolor = 4},
    "Traficante de Armas",
    "Desempregado"
  },
  ["Piloto de Linha Aerea"] = {
    _config = {x = -759.6591796875, y = -1515.3978271484, z = 4.9768991470337, blipid =  307, blipcolor = 4, permissions = {"Pilot.whitelisted"} },
	"Piloto de Linha Aerea",
    "Desempregado"
  },
  ["Piloto de Carga"] = {
    _config = {x = -928.89624023438, y = -2937.396484375, z = 13.945074081421,blipid = 472, blipcolor = 4, permissions = {"Pilot.whitelisted"} },
	"Piloto de Carga",
    "Desempregado"
  },
  ["Coletor de Lixo"] = {
    _config = {x = 750.05029296875, y = -1402.9224853516, z = 26.549806594849,blipid = 318, blipcolor = 2}, -- Job starts here
	"Coletor de Lixo",
    "Desempregado"
  },
  ["Juiz"] = {
    _config = {x = -59.127178192139, y = 359.25082397461, z = 113.05643463135, blipid = 351, blipcolor = 7, permissions = {"Judge.whitelisted"} },
    "Juiz",
	"Desempregado"
  },
  ["Falsificador"] = {
    _config = {x = 959.64337158203, y = 3619.0256347656, z = 32.668811798096, blipid = 472, blipcolor = 4},
    "Falsificador",
	"Desempregado"
  },
  ["Hacker"] = {
    _config = {x = 705.682189941406, y = -966.919067382813, z = 30.3953418731689, blipid = 362, blipcolor = 49},
    "Hacker",
    "Desempregado"
  }
  
}

return cfg

