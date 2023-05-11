
ITEM.name = "Płyn do chłodnicy"
ITEM.model = Model("models/illusion/eftcontainers/alkali.mdl")
ITEM.description = "A small roll of hand-made gauze."

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 20, 100))
	end
}
