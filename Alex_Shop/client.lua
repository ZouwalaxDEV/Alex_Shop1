local open = false 
local magasin =  RageUI.CreateMenu('Supérette', 'Bienvenue au shop')
local subMenu1 = RageUI.CreateSubMenu(magasin,"Magasin","Boisson")
local subMenu2 = RageUI.CreateSubMenu(magasin,"Magasin","Nourriture")
local subMenu3 = RageUI.CreateSubMenu(magasin,"Magasin","Électronique")
magasin:SetStyleSize(10) 
magasin.Display.Glare = true
magasin.Display.Header = true 
magasin.Closed = function()
    FreezeEntityPosition(PlayerPedId(), false)
  open = false
end

OpenMenu = function()
     if open then 
         open = false
         RageUI.Visible(magasin, false)
         return
     else
         open = true 
         RageUI.Visible(magasin, true)
         CreateThread(function()
         while open do 
            FreezeEntityPosition(PlayerPedId(), true)
            RageUI.IsVisible(magasin,function() 
              RageUI.Button("Boisson", nil, {RageUI.BadgeStyle, RightLabel = "→→", RageUI.BadgeStyle}, true, {},subMenu1)
              RageUI.Button("Nourriture", nil, {RageUI.BadgeStyle, RightLabel = "→→", RageUI.BadgeStyle}, true, {},subMenu2)
              RageUI.Button("Électronique", nil, {RageUI.BadgeStyle, RightLabel = "→→", RageUI.BadgeStyle}, true, {},subMenu3)
              end)
              RageUI.IsVisible(subMenu1,function()
                  RageUI.Separator('Boisson') 
                  RageUI.Separator("Connecté en tant qu'id [~b~"..GetPlayerServerId(PlayerId()).."~s~].")
                  RageUI.Button("Eau", "~b~Voici de l'eau fraîche", {RightLabel = "~b~[8$]"}, true , {
					onSelected = function()
						TriggerServerEvent('ZouwaBuyEau')	
					end
				})
                RageUI.Button("Coco Cola", "~b~Voici un Coca Cola", {RightLabel = "~b~[12$]"}, true , {
					onSelected = function()
						TriggerServerEvent('ZouwaBuycoca')	
					end
				})
              end)
              RageUI.IsVisible(subMenu2,function()
                RageUI.Separator('Nourriture') 
                RageUI.Separator("Connecté en tant qu'id [~b~"..GetPlayerServerId(PlayerId()).."~s~].")
                RageUI.Button("Pain", "~b~Voici du pain chaud", {RightLabel = "~g~[10$]"}, true , {
					onSelected = function()
						TriggerServerEvent('ZouwaBuybread')
					end
				})
                RageUI.Button("Burger", "~b~Voici un bon burger", {RightLabel = "~g~[18$]"}, true , {
					onSelected = function()
						TriggerServerEvent('ZouwaBuyburger')
					end
				})
            end)
            RageUI.IsVisible(subMenu3,function()
                RageUI.Separator('Électronique') 
                RageUI.Separator("Connecté en tant qu'id [~b~"..GetPlayerServerId(PlayerId()).."~s~].")
                RageUI.Button("Téléphone", "~b~Voici un nouveau téléphone", {RightLabel = "~y~[500$]"}, true , {
					onSelected = function()
						TriggerServerEvent('ZouwaBuyPhone')
					end
				})
            end)
          Wait(1)
         end
      end)
   end
end      




-- Emplacement magasin

local position = {
    {x = -707.41, y = -914.04, z = 19.22, },
    {x = 1135.53, y = -982.07, z = 46.42, },
    {x = 1163.56, y = -323.71, z = 69.21, },
    {x = 373.94, y = 326.69, z = 103.57, },
    {x = 2557.3, y = 382.11, z = 108.62, },
    {x = -3039.85, y = 585.59, z = 7.91, },
    {x = -3241.91, y = 1001.42, z = 12.83, },
    {x = 547.65, y = 2670.88, z = 42.16, },
    {x = 1961.41, y = 3740.89, z = 32.34, },
    {x = 2679.02, y = 3280.67, z = 55.24, },
    {x = 1729.17, y = 6414.94, z = 35.04, },
    {x = -1222.85, y = -907.05, z = 12.33, },
    {x = -1487.17, y = -379.83, z = 40.16, },
    {x = -2968.41, y = 390.05, z = 15.04, },
    {x = 1166.41, y = 2709.31, z = 38.16, },
    {x = -48.52, y = -1757.29, z = 29.42, },
    {x = -1820.86, y = 792.52, z = 138.12, },
    {x = 25.75, y = -1347.15, z = 29.5, },
    {x = 1698.44, y = 4924.39, z = 42.06, }
}   

Citizen.CreateThread(function()
    while true do
        NearZone = false

        for k,v in pairs(position) do

				local interval = 1
            	local pos = GetEntityCoords(PlayerPedId(), false)
            	local dest = vector3(v.x, v.y, v.z)
            	local distance = GetDistanceBetweenCoords(pos, dest, true)
            	if distance > 2 then
                	interval = 1
            	else
                	interval = 1

                	local dist = Vdist(pos.x, pos.y, pos.z, position[k].x, position[k].y, position[k].z)
                	NearZone = true 

                	if distance < 3 then
                    	if not InAction then 
						Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le magasin", 0)
                        DrawMarker(6, v.x, v.y, v.z - 0.99, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.4, 0.4, 0.4, 0, 120, 255, 200, false, false, nil, nil, nil, false) 
                    end
                    if IsControlJustReleased(1, 51) then
                        OpenMenu()
                    end
                end
                break
            end
        end
        if not NearZone then 
            Wait(500)
        else
            Wait(1)
        end
    end
end)

-- Emplacement des blips

local blips = {
    {title="Magasin", colour=2, id=59, x = -707.41, y = -914.04, z = 19.22},
    {title="Magasin", colour=2, id=59, x = 1135.63, y = -982.07, z = 46.42},
    {title="Magasin", colour=2, id=59, x = 1163.56, y = -323.71, z = 69.21},
    {title="Magasin", colour=2, id=59, x = 373.94, y = 326.69, z = 103.57},
    {title="Magasin", colour=2, id=59, x = 2557.3, y = 382.11, z = 108.62},
    {title="Magasin", colour=2, id=59, x = -3039.85, y = 585.59, z = 7.91},
    {title="Magasin", colour=2, id=59, x = -3241.91, y = 1001.42, z = 12.83},
    {title="Magasin", colour=2, id=59, x = 547.65, y = 2670.88, z = 42.16},
    {title="Magasin", colour=2, id=59, x = 1961.41, y = 3740.89, z = 32.34},
    {title="Magasin", colour=2, id=59, x = 2679.02, y = 3280.67, z = 55.24},
    {title="Magasin", colour=2, id=59, x = 1729.17, y = 6414.94, z = 35.04},
    {title="Magasin", colour=2, id=59, x = -1222.85, y = -907.05, z = 12.33},
    {title="Magasin", colour=2, id=59, x = -1487.17, y = -379.83, z = 40.16},
    {title="Magasin", colour=2, id=59, x = -2968.41, y = 390.05, z = 15.04},
    {title="Magasin", colour=2, id=59, x = 1166.41, y = 2709.31, z = 38.16},
    {title="Magasin", colour=2, id=59, x = -48.52, y = -1757.29, z = 29.42},
    {title="Magasin", colour=2, id=59, x = -1820.86, y = 792.52, z = 138.12},
    {title="Magasin", colour=2, id=59, x = 25.75, y = -1346.9, z = 29.22},
    {title="Magasin", colour=2, id=59, x = 1698.44, y = 4924.39, z = 42.06}
}


-- Config du blips 

Citizen.CreateThread(function()

for _, info in pairs(blips) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, 0.7)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
end
end)
