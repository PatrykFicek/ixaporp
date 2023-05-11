CLASS.name = "Snajper Jednostki Cerber"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("gorgons_uniform", 1)
	end
end

CLASS_GORGONS = CLASS.index

