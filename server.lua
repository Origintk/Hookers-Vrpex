--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- eventos
RegisterServerEvent('hookers:checkmoney')
AddEventHandler('hookers:checkmoney', function(hook)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)

	  if vRP.tryPayment(user_id,200) then
		TriggerClientEvent('hookers:success', player)
	  else
		TriggerClientEvent('hookers:notenough', player)
	  end	
end)
