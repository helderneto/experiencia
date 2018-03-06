-- define some basic inventory items

local items = {}

local function play_eat(player)
  local seq = {
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

local function play_drink(player)
  local seq = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

-- gen food choices as genfunc
-- idname
-- ftype: eat or drink
-- vary_hunger
-- vary_thirst
local function gen(ftype, vary_hunger, vary_thirst)
  local fgen = function(args)
    local idname = args[1]
    local choices = {}
    local act = "Unknown"
    if ftype == "eat" then act = "Eat" elseif ftype == "drink" then act = "Drink" end
    local name = vRP.getItemName(idname)

    choices[act] = {function(player,choice)
      local user_id = vRP.getUserId(player)
      if user_id ~= nil then
        if vRP.tryGetInventoryItem(user_id,idname,1,false) then
          if vary_hunger ~= 0 then vRP.varyHunger(user_id,vary_hunger) end
          if vary_thirst ~= 0 then vRP.varyThirst(user_id,vary_thirst) end

          if ftype == "drink" then
            vRPclient.notify(player,{"~b~ Drinking "..name.."."})
            play_drink(player)
          elseif ftype == "eat" then
            vRPclient.notify(player,{"~o~ Eating "..name.."."})
            play_eat(player)
          end

          vRP.closeMenu(player)
        end
      end
    end}

    return choices
  end

  return fgen
end

-- DRINKS --

items["water"] = {"Agua Vitalis","", gen("drink",0,-25),0.5}
items["milk"] = {"Leite Agros","", gen("drink",0,-5),0.5}
items["coffee"] = {"Cafe Camelo","", gen("drink",0,-10),0.2}
items["tea"] = {"Cha de Urtigas","", gen("drink",0,-15),0.2}
items["icetea"] = {"Ice-Tea","", gen("drink",0,-20), 0.5}
items["orangejuice"] = {"Sumol Laranja","", gen("drink",0,-25),0.5}
items["gocagola"] = {"Coca Cola","", gen("drink",0,-35),0.3}
items["redgull"] = {"Red Bull","", gen("drink",0,-40),0.3}
items["lemonlimonad"] = {"7 UP","", gen("drink",0,-45),0.3}
items["vodka"] = {"Vodka","", gen("drink",15,-65),0.5}

--FOOD

-- create Breed item
items["bread"] = {"Pao","", gen("eat",-10,0),0.5}
items["donut"] = {"Donut","", gen("eat",-15,0),0.2}
items["tacos"] = {"Pizza","", gen("eat",-20,0),0.2}
items["sandwich"] = {"Sandes de Presunto","", gen("eat",-25,0),0.5}
items["kebab"] = {"Kebab","", gen("eat",-45,0),0.85}
items["pdonut"] = {"Donut Chocolate","", gen("eat",-25,0),0.5}
items["catfish"] = {"Sardinha","", gen("eat",10,15),0.3}
items["bass"] = {"Salmao","", gen("eat",10,15),0.3}

return items
