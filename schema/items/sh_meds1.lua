
ITEM.name = "Meds1"
ITEM.model = Model("models/illusion/eftcontainers/ai2.mdl")
ITEM.description = "A small roll of hand-made gauze."
ITEM.category = "Medical"
ITEM.price = 18

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 20, 100))
	end
}
