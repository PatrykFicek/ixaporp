CLASS.name = "Konserwator Wydziału Olimp"
CLASS.faction = FACTION_FUNTAR
CLASS.isDefault = false

function CLASS:OnSpawn(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()

	if (character) then
		inventory:Add("olimpk_clothing", 1)
	end
end

CLASS_OLIMPK = CLASS.index

