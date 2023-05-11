
FACTION.name = "Mieszkańcy"
FACTION.description = "Mieszkaniec pustkowi"
FACTION.color = Color(150, 125, 100, 255)
FACTION.models = {
	"models/dizcordum/citizens/playermodels/pm_male_01s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_01s2.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_02s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_02s2.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_03s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_03s2.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_04s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_04s2.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_05s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_05s2.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_06s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_06s21.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_07s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_07s2.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_08s1.mdl",
	"models/dizcordum/citizens/playermodels/pm_male_08s2.mdl",
	"models/dizcordum/citizens/playermodels/p_female_01.mdl",
	"models/dizcordum/citizens/playermodels/p_female_02.mdl",
	"models/dizcordum/citizens/playermodels/p_female_03.mdl",
	"models/dizcordum/citizens/playermodels/p_female_04.mdl",
	"models/dizcordum/citizens/playermodels/p_female_05.mdl",
	"models/dizcordum/citizens/playermodels/p_female_06.mdl",
	"models/dizcordum/citizens/playermodels/p_female_07.mdl",
	"models/dizcordum/citizens/playermodels/p_female_08.mdl",
	
}
FACTION.isDefault = true

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()

	inventory:Add("backpack", 1)
end

FACTION_CITIZEN = FACTION.index
