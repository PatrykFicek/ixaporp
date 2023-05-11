CLASS.name = "Piechur Jednostki Hydra"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()

	if (character) then
		inventory:Add("hydrap_uniform", 1)
	end
end

CLASS_HYDRAP = CLASS.index

