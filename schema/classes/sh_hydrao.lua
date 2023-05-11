CLASS.name = "Oficer Jednostki Hydra"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()

	if (character) then
		inventory:Add("hydrao_uniform", 1)
	end
end

CLASS_HYDRAO = CLASS.index

