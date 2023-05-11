CLASS.name = "Gwardzista Jednostki Argus"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("argusg_uniform", 1)
	end
end

CLASS_ARGUSG = CLASS.index

