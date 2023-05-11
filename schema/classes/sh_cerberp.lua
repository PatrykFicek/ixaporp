CLASS.name = "Piechur Jednostki Cerber"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = true

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	
	if (character) then
		inventory:Add("cerberp_uniform", 1)
	end
end

CLASS_CERBERp = CLASS.index

