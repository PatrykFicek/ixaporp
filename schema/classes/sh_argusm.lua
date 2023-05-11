CLASS.name = "Medyk Jednostki Argus"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("argusm_uniform", 1)
	end
end

CLASS_ARGUSM = CLASS.index

