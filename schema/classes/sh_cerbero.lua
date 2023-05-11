CLASS.name = "Oficer Jednostki Cerber"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("cerbero_uniform", 1)
	end
end

CLASS_CERBERO = CLASS.index

