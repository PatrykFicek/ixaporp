CLASS.name = "Dowódca Jednostki Cerber"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("gorgond_uniform", 1)
	end
end

CLASS_GORGOND = CLASS.index

