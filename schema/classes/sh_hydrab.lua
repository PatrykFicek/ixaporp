CLASS.name = "Badacz Jednostki Hydra"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()

	if (character) then
		inventory:Add("hydrab_uniform", 1)
	end
end

CLASS_HYDRAB = CLASS.index

