CLASS.name = "Medyk Jednostki Cerber"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("gorgonm_uniform", 1)
	end
end

CLASS_GORGONM = CLASS.index

