local addonName = 'Alchemy';
local addonNameLower = string.lower(addonName);
local author = 'zak1ck';

-- initialize addon
_G['ADDONS'] = _G['ADDONS'] or {};
_G["ADDONS"][author] = _G["ADDONS"][author] or {};
_G["ADDONS"][author][addonName] = _G["ADDONS"][author][addonName] or {};
local g = _G["ADDONS"][author][addonName];

-- settings.json location
g.settingsFileLoc = string.format("../addons/%s/settings.json", addonNameLower);

-- load acutil
local acutil = require('acutil');

-- load only once
if not g.loaded then
    -- default settings
    g.settings = {
        selected = "Hat_628047"
    };

    -- define recipes
    g.recipeList = {
        ["Drug_HP3"] = {
            { name = "Drug_HP1", row = 0, col = 0 },
            { name = "Drug_HP1", row = 1, col = 0 },
            { name = "Drug_HP2", row = 0, col = 1 }
        },
        ["misc_jore14"] = {
            { name = "misc_jore12", row = 0, col = 0 }
        },
        ["misc_jore15"] = {
            { name = "misc_jore13", row = 0, col = 0 },
            { name = "misc_jore13", row = 0, col = 1 },
            { name = "misc_jore13", row = 1, col = 0 },
            { name = "misc_jore13", row = 1, col = 1 }
        },
        ["Hat_628042"] = {
            { name = "wood_01", row = 0, col = 0 },
            { name = "wood_01", row = 0, col = 1 },
            { name = "wood_01", row = 0, col = 3 },
            { name = "wood_01", row = 0, col = 4 },
            { name = "misc_ore09", row = 1, col = 0 },
            { name = "misc_Echad3", row = 1, col = 1 },
            { name = "wood_01", row = 1, col = 2 },
            { name = "misc_shtayim3", row = 1, col = 3 },
            { name = "misc_ore09", row = 1, col = 4 },
            { name = "wood_01", row = 2, col = 0 },
            { name = "wood_01", row = 2, col = 1 },
            { name = "wood_01", row = 2, col = 3 },
            { name = "wood_01", row = 2, col = 4 }
        },
        ["Hat_628047"] = {
            { name = "misc_goldbar", row = 0, col = 1 },
            { name = "misc_goldbar", row = 0, col = 2 },
            { name = "misc_goldbar", row = 1, col = 0 },
            { name = "misc_goldbar", row = 1, col = 1 },
            { name = "misc_goldbar", row = 1, col = 2 },
            { name = "misc_goldbar", row = 1, col = 3 }
        },
        ["misc_0019"] = {
            { name = "misc_0001", row = 0, col = 0 },
            { name = "misc_0001", row = 0, col = 1 },
            { name = "misc_0001", row = 1, col = 0 },
            { name = "misc_0001", row = 1, col = 1 },
            { name = "misc_0001", row = 2, col = 0 },
            { name = "misc_0001", row = 2, col = 1 }
        },
        ["misc_Grummer"] = {
            { name = "misc_0010", row = 0, col = 0 },
            { name = "misc_0010", row = 0, col = 1 },
            { name = "misc_0010", row = 0, col = 2 },
            { name = "misc_0010", row = 1, col = 0 },
            { name = "misc_0010", row = 1, col = 1 },
            { name = "misc_0010", row = 1, col = 2 }
        },
        ["TSF02_105"] = {
            { name = "misc_ore09", row = 0, col = 0 },
            { name = "misc_ore09", row = 1, col = 0 },
            { name = "misc_ore09", row = 2, col = 0 },
            { name = "misc_ore09", row = 3, col = 0 },
            { name = "misc_ore09", row = 4, col = 0 },
            { name = "misc_ore09", row = 5, col = 0 }
        },
        ["STF02_107"] = {
            { name = "misc_ore09", row = 0, col = 0 },
            { name = "misc_ore09", row = 0, col = 1 },
            { name = "misc_ore09", row = 1, col = 1 },
            { name = "misc_ore09", row = 2, col = 1 },
            { name = "misc_ore09", row = 3, col = 1 }
        },
        ["food_Popolion"] = {
            { name = "misc_0001", row = 0, col = 0 },
            { name = "misc_0001", row = 0, col = 1 },
            { name = "misc_0001", row = 1, col = 0 },
            { name = "misc_0001", row = 1, col = 1 }
        },
        ["misc_0006"] = {
            { name = "misc_0002", row = 0, col = 0 },
            { name = "misc_0002", row = 0, col = 1 },
            { name = "misc_0002", row = 1, col = 0 },
            { name = "misc_0002", row = 1, col = 1 }
        },
        ["misc_0008"] = {
            { name = "misc_0005", row = 0, col = 0 },
            { name = "misc_0005", row = 0, col = 1 },
            { name = "misc_0005", row = 1, col = 0 },
            { name = "misc_0005", row = 1, col = 1 }
        },
        ["misc_0009"] = {
            { name = "misc_0004", row = 0, col = 0 },
            { name = "misc_0004", row = 0, col = 1 },
            { name = "misc_0004", row = 1, col = 0 },
            { name = "misc_0004", row = 1, col = 1 }
        },
        ["misc_0010"] = {
            { name = "misc_0006", row = 0, col = 0 },
            { name = "misc_0006", row = 0, col = 1 },
            { name = "misc_0006", row = 1, col = 0 },
            { name = "misc_0006", row = 1, col = 1 }
        },
        ["misc_0013"] = {
            { name = "misc_0008", row = 0, col = 0 },
            { name = "misc_0008", row = 0, col = 1 },
            { name = "misc_0008", row = 1, col = 0 },
            { name = "misc_0008", row = 1, col = 1 }
        },
        ["misc_0119"] = {
            { name = "misc_0010", row = 0, col = 0 },
            { name = "misc_0010", row = 0, col = 1 },
            { name = "misc_0010", row = 1, col = 0 },
            { name = "misc_0010", row = 1, col = 1 }
        },
        ["misc_0014"] = {
            { name = "misc_0119", row = 0, col = 0 },
            { name = "misc_0119", row = 0, col = 1 },
            { name = "misc_0119", row = 1, col = 0 },
            { name = "misc_0119", row = 1, col = 1 }
        },
        ["misc_0016"] = {
            { name = "misc_0008", row = 0, col = 0 },
            { name = "misc_0008", row = 0, col = 1 },
            { name = "misc_0008", row = 1, col = 0 },
            { name = "misc_0008", row = 1, col = 1 },
            { name = "misc_0008", row = 2, col = 0 },
            { name = "misc_0008", row = 2, col = 1 }
        },
        ["misc_0106"] = {
            { name = "misc_0005", row = 0, col = 0 },
            { name = "misc_0005", row = 1, col = 0 },
            { name = "misc_0005", row = 2, col = 0 },
            { name = "misc_0005", row = 3, col = 0 }
        },
        ["misc_0015"] = {
            { name = "misc_0016", row = 0, col = 0 },
            { name = "misc_0016", row = 0, col = 1 },
            { name = "misc_0016", row = 1, col = 0 },
            { name = "misc_0016", row = 1, col = 1 }
        },
        ["misc_0019"] = {
            { name = "misc_0015", row = 0, col = 0 },
            { name = "misc_0015", row = 0, col = 1 },
            { name = "misc_0015", row = 1, col = 0 },
            { name = "misc_0015", row = 1, col = 1 }
        },
        ["misc_0018"] = {
            { name = "misc_0014", row = 0, col = 0 },
            { name = "misc_0014", row = 0, col = 1 },
            { name = "misc_0014", row = 1, col = 0 },
            { name = "misc_0014", row = 1, col = 1 },
            { name = "misc_0014", row = 2, col = 0 },
            { name = "misc_0014", row = 2, col = 1 }
        },
        ["misc_Grummer"] = {
            { name = "misc_0010", row = 0, col = 0 },
            { name = "misc_0010", row = 0, col = 1 },
            { name = "misc_0019", row = 1, col = 0 },
            { name = "misc_0019", row = 1, col = 1 }
        },
        ["misc_leafly"] = {
            { name = "misc_0119", row = 0, col = 0 },
            { name = "misc_0119", row = 0, col = 1 },
            { name = "misc_0119", row = 0, col = 2 },
            { name = "misc_0119", row = 1, col = 0 }
        },
        ["misc_puragi"] = {
            { name = "misc_0018", row = 0, col = 0 },
            { name = "misc_0018", row = 1, col = 0 },
            { name = "misc_0018", row = 2, col = 0 }
        },
        ["misc_0022"] = {
            { name = "misc_leafly", row = 0, col = 0 },
            { name = "misc_leafly", row = 0, col = 1 },
            { name = "misc_leafly", row = 0, col = 2 },
            { name = "misc_leafly", row = 1, col = 0 },
            { name = "misc_leafly", row = 1, col = 1 },
            { name = "misc_leafly", row = 1, col = 2 },
            { name = "misc_leafly", row = 2, col = 0 },
            { name = "misc_leafly", row = 2, col = 1 },
            { name = "misc_leafly", row = 2, col = 2 }
        },
        ["misc_banshee"] = {
            { name = "misc_0018", row = 0, col = 0 },
            { name = "misc_0018", row = 0, col = 1 },
            { name = "misc_0018", row = 1, col = 0 },
            { name = "misc_0018", row = 1, col = 1 }
        },
        ["misc_zigri"] = {
            { name = "misc_puragi", row = 0, col = 0 },
            { name = "misc_puragi", row = 0, col = 1 },
            { name = "misc_puragi", row = 1, col = 0 },
            { name = "misc_puragi", row = 1, col = 1 }
        },
        ["misc_humming_bud"] = {
            { name = "misc_leafly", row = 0, col = 0 },
            { name = "misc_leafly", row = 0, col = 1 },
            { name = "misc_leafly", row = 0, col = 3 },
            { name = "misc_leafly", row = 1, col = 0 },
            { name = "misc_leafly", row = 1, col = 1 },
            { name = "misc_leafly", row = 1, col = 3 }
        },
        ["misc_seedmia"] = {
            { name = "misc_0022", row = 0, col = 0 },
            { name = "misc_0022", row = 0, col = 1 },
            { name = "misc_0022", row = 1, col = 0 },
            { name = "misc_0022", row = 1, col = 1 }
        },
        ["misc_mallardu"] = {
            { name = "food_Popolion", row = 0, col = 0 },
            { name = "food_Popolion", row = 0, col = 1 },
            { name = "food_Popolion", row = 0, col = 3 },
            { name = "food_Popolion", row = 1, col = 0 },
            { name = "food_Popolion", row = 1, col = 1 },
            { name = "food_Popolion", row = 1, col = 3 }
        },
        ["misc_0112"] = {
            { name = "misc_seedmia", row = 0, col = 0 },
            { name = "misc_seedmia", row = 1, col = 0 },
            { name = "misc_seedmia", row = 2, col = 0 }
        },
        ["misc_0113"] = {
            { name = "misc_banshee", row = 0, col = 0 },
            { name = "misc_banshee", row = 0, col = 1 },
            { name = "misc_banshee", row = 1, col = 0 },
            { name = "misc_banshee", row = 1, col = 1 }
        },
        ["misc_0035"] = {
            { name = "misc_0112", row = 0, col = 0 },
            { name = "misc_0112", row = 1, col = 0 },
            { name = "misc_0112", row = 2, col = 0 }
        },
        ["misc_maize"] = {
            { name = "misc_0113", row = 0, col = 0 },
            { name = "misc_0113", row = 0, col = 1 },
            { name = "misc_0113", row = 1, col = 0 },
            { name = "misc_0113", row = 1, col = 1 }
        },
        ["misc_0037"] = {
            { name = "misc_humming_bud", row = 0, col = 0 },
            { name = "misc_humming_bud", row = 0, col = 1 },
            { name = "misc_humming_bud", row = 1, col = 0 },
            { name = "misc_humming_bud", row = 1, col = 1 }
        },
        ["misc_Rudas_loxodon"] = {
            { name = "misc_mallardu", row = 0, col = 0 },
            { name = "misc_mallardu", row = 0, col = 1 },
            { name = "misc_mallardu", row = 1, col = 0 },
            { name = "misc_mallardu", row = 1, col = 1 }
        },
        ["misc_0040"] = {
            { name = "misc_0035", row = 0, col = 0 },
            { name = "misc_0035", row = 0, col = 1 },
            { name = "misc_0035", row = 1, col = 0 },
            { name = "misc_0035", row = 1, col = 1 }
        },
        ["misc_Caro"] = {
            { name = "misc_maize", row = 0, col = 0 },
            { name = "misc_maize", row = 0, col = 1 },
            { name = "misc_maize", row = 1, col = 0 },
            { name = "misc_maize", row = 1, col = 1 }
        },
        ["misc_Mentiwood"] = {
            { name = "misc_0040", row = 0, col = 0 },
            { name = "misc_0040", row = 0, col = 1 },
            { name = "misc_0040", row = 1, col = 0 },
            { name = "misc_0040", row = 1, col = 1 }
        },
        ["misc_0026"] = {
            { name = "misc_zigri", row = 0, col = 0 },
            { name = "misc_zigri", row = 0, col = 1 },
            { name = "misc_zigri", row = 1, col = 0 },
            { name = "misc_zigri", row = 1, col = 1 }
        },
        ["misc_glizardon"] = {
            { name = "misc_0018", row = 0, col = 0 },
            { name = "misc_0018", row = 0, col = 1 },
            { name = "misc_0018", row = 1, col = 0 },
            { name = "misc_0018", row = 1, col = 1 },
            { name = "misc_0018", row = 2, col = 0 },
            { name = "misc_0018", row = 2, col = 1 }
        },
        ["misc_Corylus"] = {
            { name = "misc_Caro", row = 0, col = 0 },
            { name = "misc_Caro", row = 1, col = 0 },
            { name = "misc_Caro", row = 2, col = 0 },
            { name = "misc_Caro", row = 3, col = 0 }
        },
        ["misc_galok"] = {
            { name = "misc_Mentiwood", row = 0, col = 0 },
            { name = "misc_Mentiwood", row = 0, col = 1 },
            { name = "misc_Mentiwood", row = 1, col = 0 },
            { name = "misc_Mentiwood", row = 1, col = 1 }
        },
        ["misc_0025"] = {
            { name = "misc_0026", row = 0, col = 0 },
            { name = "misc_0026", row = 0, col = 1 },
            { name = "misc_0026", row = 1, col = 0 },
            { name = "misc_0026", row = 1, col = 1 }
        },
        ["misc_Spector_Gh"] = {
            { name = "misc_Corylus", row = 0, col = 0 },
            { name = "misc_Corylus", row = 0, col = 1 },
            { name = "misc_Corylus", row = 1, col = 0 },
            { name = "misc_Corylus", row = 1, col = 1 }
        },
        ["misc_0043"] = {
            { name = "misc_Corylus", row = 0, col = 0 },
            { name = "misc_Corylus", row = 1, col = 0 },
            { name = "misc_Corylus", row = 2, col = 0 }
        },
        ["misc_0122"] = {
            { name = "misc_galok", row = 0, col = 0 },
            { name = "misc_galok", row = 1, col = 0 },
            { name = "misc_galok", row = 2, col = 0 }
        },
        ["misc_Velwriggler"] = {
            { name = "misc_Spector_Gh", row = 0, col = 0 },
            { name = "misc_Spector_Gh", row = 1, col = 0 },
            { name = "misc_Spector_Gh", row = 2, col = 0 },
            { name = "misc_Spector_Gh", row = 3, col = 0 }
        },
        ["misc_0046"] = {
            { name = "misc_0025", row = 0, col = 0 },
            { name = "misc_0025", row = 0, col = 1 },
            { name = "misc_0025", row = 0, col = 2 },
            { name = "misc_0025", row = 1, col = 0 },
            { name = "misc_0025", row = 1, col = 1 },
            { name = "misc_0025", row = 1, col = 2 }
        },
        ["misc_0044"] = {
            { name = "misc_0043", row = 0, col = 0 },
            { name = "misc_0043", row = 0, col = 1 },
            { name = "misc_0043", row = 1, col = 0 },
            { name = "misc_0043", row = 1, col = 1 }
        },
        ["misc_0045"] = {
            { name = "misc_0122", row = 0, col = 0 },
            { name = "misc_0122", row = 0, col = 1 },
            { name = "misc_0122", row = 1, col = 0 },
            { name = "misc_0122", row = 1, col = 1 }
        },
        ["misc_0102"] = {
            { name = "misc_Velwriggler", row = 0, col = 0 },
            { name = "misc_Velwriggler", row = 0, col = 1 },
            { name = "misc_Velwriggler", row = 1, col = 0 },
            { name = "misc_Velwriggler", row = 1, col = 1 }
        },
        ["misc_0049"] = {
            { name = "misc_0044", row = 0, col = 0 },
            { name = "misc_0044", row = 0, col = 1 },
            { name = "misc_0044", row = 1, col = 0 },
            { name = "misc_0044", row = 1, col = 1 },
            { name = "misc_0044", row = 2, col = 0 },
            { name = "misc_0044", row = 2, col = 1 }
        },
        ["misc_0047"] = {
            { name = "misc_0045", row = 0, col = 0 },
            { name = "misc_0045", row = 0, col = 1 },
            { name = "misc_0045", row = 1, col = 0 },
            { name = "misc_0045", row = 1, col = 1 }
        },
        ["misc_Ammon"] = {
            { name = "misc_0102", row = 0, col = 0 },
            { name = "misc_0102", row = 0, col = 1 },
            { name = "misc_0102", row = 1, col = 0 },
            { name = "misc_0102", row = 1, col = 1 }
        },
        ["misc_0135"] = {
            { name = "misc_Ammon", row = 0, col = 0 },
            { name = "misc_Ammon", row = 0, col = 1 },
            { name = "misc_Ammon", row = 1, col = 0 },
            { name = "misc_Ammon", row = 1, col = 1 },
            { name = "misc_Ammon", row = 2, col = 0 },
            { name = "misc_Ammon", row = 2, col = 1 }
        },
        ["misc_0109"] = {
            { name = "misc_0049", row = 0, col = 0 },
            { name = "misc_0049", row = 0, col = 1 },
            { name = "misc_0049", row = 1, col = 0 },
            { name = "misc_0049", row = 1, col = 1 },
            { name = "misc_0049", row = 2, col = 0 },
            { name = "misc_0049", row = 2, col = 1 }
        },
        ["misc_0055"] = {
            { name = "misc_0047", row = 0, col = 0 },
            { name = "misc_0047", row = 0, col = 1 },
            { name = "misc_0047", row = 1, col = 0 },
            { name = "misc_0047", row = 1, col = 1 }
        },
        ["misc_0056"] = {
            { name = "misc_Ammon", row = 0, col = 0 },
            { name = "misc_Ammon", row = 0, col = 1 },
            { name = "misc_Ammon", row = 1, col = 0 },
            { name = "misc_Ammon", row = 1, col = 1 }
        },
        ["misc_Dumaro"] = {
            { name = "misc_0046", row = 0, col = 0 },
            { name = "misc_0046", row = 0, col = 1 },
            { name = "misc_0046", row = 0, col = 2 },
            { name = "misc_0046", row = 1, col = 0 },
            { name = "misc_0046", row = 1, col = 1 },
            { name = "misc_0046", row = 1, col = 2 }
        },
        ["misc_0058"] = {
            { name = "misc_0135", row = 0, col = 0 },
            { name = "misc_0135", row = 0, col = 1 },
            { name = "misc_0135", row = 1, col = 0 },
            { name = "misc_0135", row = 1, col = 1 },
            { name = "misc_0135", row = 2, col = 0 }
        },
        ["misc_0059"] = {
            { name = "misc_0025", row = 0, col = 0 },
            { name = "misc_0025", row = 0, col = 1 },
            { name = "misc_0025", row = 1, col = 0 },
            { name = "misc_0025", row = 1, col = 1 }
        },
        ["misc_Ticen"] = {
            { name = "misc_0058", row = 0, col = 0 },
            { name = "misc_0058", row = 0, col = 1 },
            { name = "misc_0058", row = 1, col = 0 },
            { name = "misc_0058", row = 1, col = 1 }
        },
        ["misc_Tucen"] = {
            { name = "misc_0056", row = 0, col = 0 },
            { name = "misc_0056", row = 0, col = 1 },
            { name = "misc_0056", row = 1, col = 0 },
            { name = "misc_0056", row = 1, col = 1 }
        },
        ["misc_0060"] = {
            { name = "misc_Dumaro", row = 0, col = 0 },
            { name = "misc_Dumaro", row = 0, col = 1 },
            { name = "misc_Dumaro", row = 1, col = 0 },
            { name = "misc_Dumaro", row = 1, col = 1 }
        },
        ["misc_0061"] = {
            { name = "misc_Ticen", row = 0, col = 0 },
            { name = "misc_Ticen", row = 0, col = 1 },
            { name = "misc_Ticen", row = 1, col = 0 },
            { name = "misc_Ticen", row = 1, col = 1 },
            { name = "misc_Ticen", row = 2, col = 0 },
            { name = "misc_Ticen", row = 2, col = 1 }
        },
        ["misc_0153"] = {
            { name = "misc_0055", row = 0, col = 0 },
            { name = "misc_0055", row = 0, col = 1 },
            { name = "misc_0055", row = 1, col = 0 },
            { name = "misc_0055", row = 1, col = 1 }
        },
        ["misc_Sakmoli"] = {
            { name = "misc_0047", row = 0, col = 0 },
            { name = "misc_0047", row = 0, col = 1 },
            { name = "misc_0047", row = 1, col = 0 },
            { name = "misc_0047", row = 1, col = 1 },
            { name = "misc_0047", row = 2, col = 0 },
            { name = "misc_0047", row = 2, col = 1 }
        },
        ["misc_0128"] = {
            { name = "misc_0060", row = 0, col = 0 },
            { name = "misc_0060", row = 0, col = 1 },
            { name = "misc_0060", row = 1, col = 0 },
            { name = "misc_0060", row = 1, col = 1 }
        },
        ["misc_Repusbunny"] = {
            { name = "misc_0153", row = 0, col = 0 },
            { name = "misc_0153", row = 0, col = 1 },
            { name = "misc_0153", row = 1, col = 0 },
            { name = "misc_0153", row = 1, col = 1 }
        },
        ["misc_Hallowventor"] = {
            { name = "misc_0061", row = 0, col = 0 },
            { name = "misc_0061", row = 0, col = 1 },
            { name = "misc_0061", row = 1, col = 0 },
            { name = "misc_0061", row = 1, col = 1 }
        },
        ["misc_Tontulia"] = {
            { name = "misc_Tucen", row = 0, col = 0 },
            { name = "misc_Tucen", row = 0, col = 1 },
            { name = "misc_Tucen", row = 1, col = 0 },
            { name = "misc_Tucen", row = 1, col = 1 }
        },
        ["misc_0062"] = {
            { name = "misc_0128", row = 0, col = 0 },
            { name = "misc_0128", row = 0, col = 1 },
            { name = "misc_0128", row = 1, col = 0 },
            { name = "misc_0128", row = 1, col = 1 }
        },
        ["misc_0105"] = {
            { name = "misc_Hallowventor", row = 0, col = 0 },
            { name = "misc_Hallowventor", row = 0, col = 1 },
            { name = "misc_Hallowventor", row = 1, col = 0 },
            { name = "misc_Hallowventor", row = 1, col = 1 }
        },
        ["misc_0063"] = {
            { name = "misc_Tontulia", row = 0, col = 0 },
            { name = "misc_Tontulia", row = 0, col = 1 },
            { name = "misc_Tontulia", row = 1, col = 0 },
            { name = "misc_Tontulia", row = 1, col = 1 }
        },
        ["misc_Karas"] = {
            { name = "misc_Dumaro", row = 0, col = 0 },
            { name = "misc_Dumaro", row = 0, col = 1 },
            { name = "misc_Dumaro", row = 1, col = 0 },
            { name = "misc_Dumaro", row = 1, col = 1 },
            { name = "misc_Dumaro", row = 2, col = 0 },
            { name = "misc_Dumaro", row = 2, col = 1 }
        },
        ["misc_0064"] = {
            { name = "misc_0105", row = 0, col = 0 },
            { name = "misc_0105", row = 0, col = 1 },
            { name = "misc_0105", row = 1, col = 0 },
            { name = "misc_0105", row = 1, col = 1 }
        },
        ["misc_0104"] = {
            { name = "misc_0062", row = 0, col = 0 },
            { name = "misc_0062", row = 0, col = 1 },
            { name = "misc_0062", row = 1, col = 0 },
            { name = "misc_0062", row = 1, col = 1 }
        },
        ["misc_0065"] = {
            { name = "misc_Karas", row = 0, col = 0 },
            { name = "misc_Karas", row = 0, col = 1 },
            { name = "misc_Karas", row = 1, col = 0 },
            { name = "misc_Karas", row = 1, col = 1 }
        },
        ["misc_shtayim"] = {
            { name = "misc_0064", row = 0, col = 0 },
            { name = "misc_0064", row = 0, col = 1 },
            { name = "misc_0064", row = 1, col = 0 },
            { name = "misc_0064", row = 1, col = 1 }
        },
        ["misc_0094"] = {
            { name = "misc_0065", row = 0, col = 0 },
            { name = "misc_0065", row = 0, col = 1 },
            { name = "misc_0065", row = 1, col = 0 },
            { name = "misc_0065", row = 1, col = 1 }
        },
        ["misc_0093"] = {
            { name = "misc_shtayim", row = 0, col = 0 },
            { name = "misc_shtayim", row = 0, col = 1 },
            { name = "misc_shtayim", row = 1, col = 0 },
            { name = "misc_shtayim", row = 1, col = 1 }
        },
        ["misc_schlesien_darkmage"] = {
            { name = "misc_0104", row = 0, col = 0 },
            { name = "misc_0104", row = 0, col = 1 },
            { name = "misc_0104", row = 1, col = 0 },
            { name = "misc_0104", row = 1, col = 1 }
        },
        ["misc_0070"] = {
            { name = "misc_0093", row = 0, col = 0 },
            { name = "misc_0093", row = 0, col = 1 },
            { name = "misc_0093", row = 1, col = 0 },
            { name = "misc_0093", row = 1, col = 1 }
        },
        ["misc_Haming2"] = {
            { name = "misc_Tontulia", row = 0, col = 0 },
            { name = "misc_Tontulia", row = 0, col = 1 },
            { name = "misc_Tontulia", row = 1, col = 0 }
        },
        ["misc_0140"] = {
            { name = "misc_Repusbunny", row = 0, col = 0 },
            { name = "misc_Repusbunny", row = 0, col = 1 },
            { name = "misc_Repusbunny", row = 1, col = 0 },
            { name = "misc_Repusbunny", row = 1, col = 1 }
        },
        ["misc_0139"] = {
            { name = "misc_schlesien_darkmage", row = 0, col = 0 },
            { name = "misc_schlesien_darkmage", row = 0, col = 1 },
            { name = "misc_schlesien_darkmage", row = 1, col = 0 },
            { name = "misc_schlesien_darkmage", row = 1, col = 1 }
        },
        ["misc_0155"] = {
            { name = "misc_Haming2", row = 0, col = 0 },
            { name = "misc_Haming2", row = 0, col = 1 },
            { name = "misc_Haming2", row = 1, col = 0 },
            { name = "misc_Haming2", row = 1, col = 1 }
        },
        ["misc_Lizardman"] = {
            { name = "misc_0070", row = 0, col = 0 },
            { name = "misc_0070", row = 1, col = 0 },
            { name = "misc_0070", row = 2, col = 0 }
        },
        ["misc_0074"] = {
            { name = "misc_0139", row = 0, col = 0 },
            { name = "misc_0139", row = 0, col = 1 },
            { name = "misc_0139", row = 1, col = 0 },
            { name = "misc_0139", row = 1, col = 1 }
        },
        ["misc_0075"] = {
            { name = "misc_0070", row = 0, col = 0 },
            { name = "misc_0070", row = 0, col = 1 },
            { name = "misc_0070", row = 1, col = 0 },
            { name = "misc_0070", row = 1, col = 1 }
        },
        ["misc_0097"] = {
            { name = "misc_0093", row = 0, col = 0 },
            { name = "misc_0093", row = 1, col = 0 },
            { name = "misc_0093", row = 2, col = 0 },
            { name = "misc_0093", row = 2, col = 1 }
        },
        ["misc_0076"] = {
            { name = "misc_0075", row = 0, col = 0 },
            { name = "misc_0075", row = 0, col = 1 },
            { name = "misc_0075", row = 1, col = 0 },
            { name = "misc_0075", row = 1, col = 1 }
        },
        ["misc_Cockatries"] = {
            { name = "misc_0140", row = 0, col = 0 },
            { name = "misc_0140", row = 0, col = 1 },
            { name = "misc_0140", row = 1, col = 0 },
            { name = "misc_0140", row = 1, col = 1 }
        },
        ["misc_Minos1"] = {
            { name = "misc_Lizardman", row = 0, col = 0 },
            { name = "misc_Lizardman", row = 0, col = 1 },
            { name = "misc_Lizardman", row = 1, col = 0 },
            { name = "misc_Lizardman", row = 1, col = 1 }
        },
        ["misc_Stoulet"] = {
            { name = "misc_0155", row = 0, col = 0 },
            { name = "misc_0155", row = 0, col = 1 },
            { name = "misc_0155", row = 1, col = 0 },
            { name = "misc_0155", row = 1, col = 1 }
        },
        ["misc_0127"] = {
            { name = "misc_0074", row = 0, col = 0 },
            { name = "misc_0074", row = 0, col = 1 },
            { name = "misc_0074", row = 1, col = 0 },
            { name = "misc_0074", row = 1, col = 1 }
        },
        ["misc_Bushspider_purple"] = {
            { name = "misc_Cockatries", row = 0, col = 0 },
            { name = "misc_Cockatries", row = 0, col = 1 },
            { name = "misc_Cockatries", row = 1, col = 0 },
            { name = "misc_Cockatries", row = 1, col = 1 }
        },
        ["misc_Fisherman"] = {
            { name = "misc_Minos1", row = 0, col = 0 },
            { name = "misc_Minos1", row = 1, col = 0 },
            { name = "misc_Minos1", row = 2, col = 0 },
            { name = "misc_Minos1", row = 3, col = 0 }
        },
        ["misc_ellomago"] = {
            { name = "misc_Bushspider_purple", row = 0, col = 0 },
            { name = "misc_Bushspider_purple", row = 0, col = 1 },
            { name = "misc_Bushspider_purple", row = 1, col = 0 },
            { name = "misc_Bushspider_purple", row = 1, col = 1 }
        },
        ["misc_0129"] = {
            { name = "misc_0127", row = 0, col = 0 },
            { name = "misc_0127", row = 1, col = 0 },
            { name = "misc_0127", row = 2, col = 0 },
            { name = "misc_0127", row = 3, col = 0 }
        },
        ["misc_Bume_Goblin"] = {
            { name = "misc_0013", row = 0, col = 0 },
            { name = "misc_0013", row = 0, col = 1 },
            { name = "misc_0013", row = 1, col = 0 },
            { name = "misc_0013", row = 1, col = 1 },
            { name = "misc_0013", row = 2, col = 0 },
            { name = "misc_0013", row = 2, col = 1 }
        },
        ["misc_arburn_pokubu_blue2"] = {
            { name = "misc_Stoulet", row = 0, col = 0 },
            { name = "misc_Stoulet", row = 0, col = 1 },
            { name = "misc_Stoulet", row = 1, col = 0 },
            { name = "misc_Stoulet", row = 1, col = 1 }
        },
        ["misc_0100"] = {
            { name = "misc_Fisherman", row = 0, col = 0 },
            { name = "misc_Fisherman", row = 0, col = 1 },
            { name = "misc_Fisherman", row = 1, col = 0 },
            { name = "misc_Fisherman", row = 1, col = 1 }
        },
        ["misc_0079"] = {
            { name = "misc_arburn_pokubu_blue2", row = 0, col = 0 },
            { name = "misc_arburn_pokubu_blue2", row = 0, col = 1 },
            { name = "misc_arburn_pokubu_blue2", row = 1, col = 0 },
            { name = "misc_arburn_pokubu_blue2", row = 1, col = 1 }
        },
        ["misc_rublem"] = {
            { name = "misc_Bume_Goblin", row = 0, col = 0 },
            { name = "misc_Bume_Goblin", row = 0, col = 1 },
            { name = "misc_Bume_Goblin", row = 1, col = 0 },
            { name = "misc_Bume_Goblin", row = 1, col = 1 }
        },
        ["misc_0080"] = {
            { name = "misc_ellomago", row = 0, col = 0 },
            { name = "misc_ellomago", row = 0, col = 1 },
            { name = "misc_ellomago", row = 1, col = 0 },
            { name = "misc_ellomago", row = 1, col = 1 }
        },
        ["misc_Armory"] = {
            { name = "misc_rublem", row = 0, col = 0 },
            { name = "misc_rublem", row = 0, col = 1 },
            { name = "misc_rublem", row = 1, col = 0 },
            { name = "misc_rublem", row = 1, col = 1 }
        },
        ["misc_0081"] = {
            { name = "misc_0100", row = 0, col = 0 },
            { name = "misc_0100", row = 0, col = 1 },
            { name = "misc_0100", row = 1, col = 0 },
            { name = "misc_0100", row = 1, col = 1 }
        },
        ["misc_chromadog"] = {
            { name = "misc_0129", row = 0, col = 0 },
            { name = "misc_0129", row = 0, col = 1 },
            { name = "misc_0129", row = 1, col = 0 },
            { name = "misc_0129", row = 1, col = 1 }
        },
        ["misc_0083"] = {
            { name = "misc_0079", row = 0, col = 0 },
            { name = "misc_0079", row = 0, col = 1 },
            { name = "misc_0079", row = 1, col = 0 },
            { name = "misc_0079", row = 1, col = 1 }
        },
        ["misc_0086"] = {
            { name = "misc_chromadog", row = 0, col = 0 },
            { name = "misc_chromadog", row = 0, col = 1 },
            { name = "misc_chromadog", row = 1, col = 0 },
            { name = "misc_chromadog", row = 1, col = 1 }
        },
        ["misc_minivern"] = {
            { name = "misc_0080", row = 0, col = 0 },
            { name = "misc_0080", row = 0, col = 1 },
            { name = "misc_0080", row = 1, col = 0 },
            { name = "misc_0080", row = 1, col = 1 }
        },
        ["misc_0088"] = {
            { name = "misc_0081", row = 0, col = 0 },
            { name = "misc_0081", row = 0, col = 1 },
            { name = "misc_0081", row = 1, col = 0 },
            { name = "misc_0081", row = 1, col = 1 }
        },
        ["misc_0132"] = {
            { name = "misc_0083", row = 0, col = 0 },
            { name = "misc_0083", row = 0, col = 1 },
            { name = "misc_0083", row = 1, col = 0 },
            { name = "misc_0083", row = 1, col = 1 }
        },
        ["misc_0133"] = {
            { name = "misc_minivern", row = 0, col = 0 },
            { name = "misc_minivern", row = 0, col = 1 },
            { name = "misc_minivern", row = 1, col = 0 },
            { name = "misc_minivern", row = 1, col = 1 }
        },
        ["misc_0134"] = {
            { name = "misc_0080", row = 0, col = 0 },
            { name = "misc_0080", row = 1, col = 0 },
            { name = "misc_0080", row = 2, col = 0 }
        },
        ["misc_0136"] = {
            { name = "misc_0086", row = 0, col = 0 },
            { name = "misc_0086", row = 1, col = 0 },
            { name = "misc_0086", row = 1, col = 1 },
            { name = "misc_0086", row = 2, col = 0 }
        },
        ["misc_0137"] = {
            { name = "misc_minivern", row = 0, col = 0 },
            { name = "misc_minivern", row = 0, col = 1 },
            { name = "misc_minivern", row = 1, col = 0 },
            { name = "misc_minivern", row = 1, col = 1 },
            { name = "misc_minivern", row = 2, col = 0 },
            { name = "misc_minivern", row = 2, col = 1 }
        },
        ["misc_0138"] = {
            { name = "misc_0129", row = 0, col = 0 },
            { name = "misc_0129", row = 0, col = 1 },
            { name = "misc_0129", row = 0, col = 2 },
            { name = "misc_0129", row = 1, col = 0 }
        },
        ["misc_Infroholder"] = {
            { name = "misc_chromadog", row = 0, col = 0 },
            { name = "misc_chromadog", row = 1, col = 0 },
            { name = "misc_chromadog", row = 2, col = 0 },
            { name = "misc_chromadog", row = 3, col = 0 }
        },
        ["misc_0141"] = {
            { name = "misc_0136", row = 0, col = 0 },
            { name = "misc_0136", row = 0, col = 1 },
            { name = "misc_0136", row = 1, col = 0 },
            { name = "misc_0136", row = 1, col = 1 }
        },
        ["misc_Rubabos"] = {
            { name = "misc_0137", row = 0, col = 0 },
            { name = "misc_0137", row = 0, col = 1 },
            { name = "misc_0137", row = 1, col = 0 },
            { name = "misc_0137", row = 1, col = 1 }
        },
        ["misc_0184"] = {
            { name = "misc_Infroholder", row = 0, col = 0 },
            { name = "misc_Infroholder", row = 0, col = 1 },
            { name = "misc_Infroholder", row = 1, col = 0 },
            { name = "misc_Infroholder", row = 1, col = 1 }
        },
        ["misc_0143"] = {
            { name = "misc_0134", row = 0, col = 0 },
            { name = "misc_0134", row = 0, col = 1 },
            { name = "misc_0134", row = 1, col = 0 },
            { name = "misc_0134", row = 1, col = 1 }
        },
        ["misc_0144"] = {
            { name = "misc_0138", row = 0, col = 0 },
            { name = "misc_0138", row = 0, col = 1 },
            { name = "misc_0138", row = 1, col = 0 },
            { name = "misc_0138", row = 1, col = 1 }
        },
        ["misc_0149"] = {
            { name = "misc_0141", row = 0, col = 0 },
            { name = "misc_0141", row = 0, col = 1 },
            { name = "misc_0141", row = 1, col = 0 },
            { name = "misc_0141", row = 1, col = 1 }
        },
        ["misc_0152"] = {
            { name = "misc_0184", row = 0, col = 0 },
            { name = "misc_0184", row = 0, col = 1 },
            { name = "misc_0184", row = 1, col = 0 },
            { name = "misc_0184", row = 1, col = 1 }
        },
        ["misc_0165"] = {
            { name = "misc_0143", row = 0, col = 0 },
            { name = "misc_0143", row = 0, col = 1 },
            { name = "misc_0143", row = 1, col = 0 },
            { name = "misc_0143", row = 1, col = 1 }
        },
        ["misc_0166"] = {
            { name = "misc_0144", row = 0, col = 0 },
            { name = "misc_0144", row = 0, col = 1 },
            { name = "misc_0144", row = 1, col = 0 },
            { name = "misc_0144", row = 1, col = 1 }
        },
        ["misc_0168"] = {
            { name = "misc_0149", row = 0, col = 0 },
            { name = "misc_0149", row = 0, col = 1 },
            { name = "misc_0149", row = 1, col = 0 },
            { name = "misc_0149", row = 1, col = 1 }
        },
        ["tree_root_mole1"] = {
            { name = "misc_0165", row = 0, col = 0 },
            { name = "misc_0165", row = 0, col = 1 },
            { name = "misc_0165", row = 1, col = 0 },
            { name = "misc_0165", row = 1, col = 1 }
        },
        ["misc_0170"] = {
            { name = "misc_0152", row = 0, col = 0 },
            { name = "misc_0152", row = 0, col = 2 },
            { name = "misc_0152", row = 1, col = 0 },
            { name = "misc_0152", row = 1, col = 1 },
            { name = "misc_0152", row = 1, col = 2 },
            { name = "misc_0152", row = 2, col = 0 },
            { name = "misc_0152", row = 2, col = 2 }
        },
        ["misc_0156"] = {
            { name = "misc_0166", row = 0, col = 0 },
            { name = "misc_0166", row = 0, col = 1 },
            { name = "misc_0166", row = 1, col = 0 },
            { name = "misc_0166", row = 1, col = 1 }
        },
        ["misc_0157"] = {
            { name = "misc_0088", row = 0, col = 0 },
            { name = "misc_0088", row = 0, col = 1 },
            { name = "misc_0088", row = 1, col = 0 },
            { name = "misc_0088", row = 1, col = 1 }
        },
        ["misc_0158"] = {
            { name = "misc_0157", row = 0, col = 0 },
            { name = "misc_0157", row = 0, col = 1 },
            { name = "misc_0157", row = 0, col = 2 },
            { name = "misc_0157", row = 1, col = 0 },
            { name = "misc_0157", row = 1, col = 1 },
            { name = "misc_0157", row = 1, col = 2 },
            { name = "misc_0157", row = 2, col = 0 },
            { name = "misc_0157", row = 2, col = 1 },
            { name = "misc_0157", row = 2, col = 2 }
        },
        ["misc_0147"] = {
            { name = "tree_root_mole1", row = 0, col = 0 },
            { name = "tree_root_mole1", row = 0, col = 1 },
            { name = "tree_root_mole1", row = 1, col = 0 },
            { name = "tree_root_mole1", row = 1, col = 1 }
        },
        ["misc_0161"] = {
            { name = "misc_0158", row = 0, col = 0 },
            { name = "misc_0158", row = 0, col = 1 },
            { name = "misc_0158", row = 1, col = 0 },
            { name = "misc_0158", row = 1, col = 1 }
        },
        ["misc_0162"] = {
            { name = "misc_0170", row = 0, col = 0 },
            { name = "misc_0170", row = 0, col = 1 },
            { name = "misc_0170", row = 1, col = 0 },
            { name = "misc_0170", row = 1, col = 1 }
        },
        ["misc_0131"] = {
            { name = "misc_0147", row = 0, col = 0 },
            { name = "misc_0147", row = 0, col = 1 },
            { name = "misc_0147", row = 1, col = 0 },
            { name = "misc_0147", row = 1, col = 1 }
        },
        ["misc_0163"] = {
            { name = "misc_0168", row = 0, col = 0 },
            { name = "misc_0168", row = 0, col = 1 },
            { name = "misc_0168", row = 1, col = 0 },
            { name = "misc_0168", row = 1, col = 1 }
        },
        ["misc_0164"] = {
            { name = "misc_0162", row = 0, col = 0 },
            { name = "misc_0162", row = 0, col = 1 },
            { name = "misc_0162", row = 1, col = 0 },
            { name = "misc_0162", row = 1, col = 1 }
        },
        ["misc_Mushroom_boy"] = {
            { name = "misc_0131", row = 0, col = 0 },
            { name = "misc_0131", row = 0, col = 1 },
            { name = "misc_0131", row = 0, col = 2 },
            { name = "misc_0131", row = 1, col = 0 },
            { name = "misc_0131", row = 1, col = 1 },
            { name = "misc_0131", row = 1, col = 2 }
        },
        ["misc_0171"] = {
            { name = "misc_Mushroom_boy", row = 0, col = 0 },
            { name = "misc_Mushroom_boy", row = 0, col = 1 },
            { name = "misc_Mushroom_boy", row = 1, col = 0 },
            { name = "misc_Mushroom_boy", row = 1, col = 1 }
        },
        ["misc_0172"] = {
            { name = "misc_0163", row = 0, col = 0 },
            { name = "misc_0163", row = 0, col = 1 },
            { name = "misc_0163", row = 1, col = 0 },
            { name = "misc_0163", row = 1, col = 1 }
        },
        ["misc_0173"] = {
            { name = "misc_0148", row = 0, col = 0 },
            { name = "misc_0148", row = 0, col = 1 },
            { name = "misc_0148", row = 0, col = 2 },
            { name = "misc_0148", row = 1, col = 0 },
            { name = "misc_0148", row = 1, col = 1 },
            { name = "misc_0148", row = 1, col = 2 }
        },
        ["misc_0174"] = {
            { name = "misc_0172", row = 0, col = 0 },
            { name = "misc_0172", row = 0, col = 1 },
            { name = "misc_0172", row = 1, col = 0 },
            { name = "misc_0172", row = 1, col = 1 }
        },
        ["misc_0175"] = {
            { name = "misc_Mushroom_boy", row = 0, col = 0 },
            { name = "misc_Mushroom_boy", row = 1, col = 0 },
            { name = "misc_Mushroom_boy", row = 2, col = 0 }
        },
        ["misc_0176"] = {
            { name = "misc_0171", row = 0, col = 0 },
            { name = "misc_0171", row = 0, col = 1 },
            { name = "misc_0171", row = 1, col = 0 },
            { name = "misc_0171", row = 1, col = 1 }
        },
        ["misc_0178"] = {
            { name = "misc_kowak", row = 0, col = 0 },
            { name = "misc_kowak", row = 0, col = 1 },
            { name = "misc_kowak", row = 1, col = 0 },
            { name = "misc_kowak", row = 1, col = 1 }
        },
        ["misc_mushroom_ent"] = {
            { name = "misc_Mushroom_boy", row = 0, col = 0 },
            { name = "misc_Mushroom_boy", row = 0, col = 1 },
            { name = "misc_Mushroom_boy", row = 1, col = 0 },
            { name = "misc_Mushroom_boy", row = 1, col = 1 },
            { name = "misc_Mushroom_boy", row = 2, col = 0 },
            { name = "misc_Mushroom_boy", row = 2, col = 1 }
        },
        ["misc_0179"] = {
            { name = "misc_0176", row = 0, col = 0 },
            { name = "misc_0176", row = 1, col = 0 },
            { name = "misc_0176", row = 2, col = 0 },
            { name = "misc_0176", row = 3, col = 0 }
        },
        ["misc_0181"] = {
            { name = "misc_0175", row = 0, col = 0 },
            { name = "misc_0175", row = 0, col = 1 },
            { name = "misc_0175", row = 1, col = 0 },
            { name = "misc_0175", row = 1, col = 1 }
        },
        ["misc_0092"] = {
            { name = "misc_0178", row = 0, col = 0 },
            { name = "misc_0178", row = 0, col = 1 },
            { name = "misc_0178", row = 1, col = 0 },
            { name = "misc_0178", row = 1, col = 1 }
        },
        ["misc_anchor"] = {
            { name = "misc_0173", row = 0, col = 0 },
            { name = "misc_0173", row = 0, col = 1 },
            { name = "misc_0173", row = 1, col = 0 },
            { name = "misc_0173", row = 1, col = 1 }
        },
        ["misc_velffigy"] = {
            { name = "misc_0181", row = 0, col = 0 },
            { name = "misc_0181", row = 0, col = 1 },
            { name = "misc_0181", row = 1, col = 0 },
            { name = "misc_0181", row = 1, col = 1 }
        },
        ["misc_glyquare"] = {
            { name = "misc_anchor", row = 0, col = 0 },
            { name = "misc_anchor", row = 0, col = 1 },
            { name = "misc_anchor", row = 1, col = 0 },
            { name = "misc_anchor", row = 1, col = 1 }
        },
        ["misc_Rambear"] = {
            { name = "misc_0179", row = 0, col = 0 },
            { name = "misc_0179", row = 0, col = 1 },
            { name = "misc_0179", row = 1, col = 0 },
            { name = "misc_0179", row = 1, col = 1 }
        },
        ["misc_goblin"] = {
            { name = "misc_Bume_Goblin", row = 0, col = 0 },
            { name = "misc_Bume_Goblin", row = 0, col = 1 },
            { name = "misc_Bume_Goblin", row = 1, col = 0 },
            { name = "misc_Bume_Goblin", row = 1, col = 1 },
            { name = "misc_Bume_Goblin", row = 2, col = 0 },
            { name = "misc_Bume_Goblin", row = 2, col = 1 }
        },
        ["misc_Lemuria"] = {
            { name = "misc_0092", row = 0, col = 0 },
            { name = "misc_0092", row = 0, col = 1 },
            { name = "misc_0092", row = 1, col = 0 },
            { name = "misc_0092", row = 1, col = 1 }
        },
        ["misc_0034"] = {
            { name = "misc_0019", row = 0, col = 0 },
            { name = "misc_0019", row = 0, col = 1 },
            { name = "misc_0019", row = 0, col = 2 },
            { name = "misc_0019", row = 1, col = 0 },
            { name = "misc_0019", row = 1, col = 1 },
            { name = "misc_0019", row = 2, col = 0 }
        },
        ["misc_0047"] = {
            { name = "misc_0034", row = 0, col = 0 },
            { name = "misc_0034", row = 1, col = 1 },
            { name = "misc_0034", row = 1, col = 3 },
            { name = "misc_0034", row = 2, col = 2 },
            { name = "misc_0034", row = 2, col = 3 },
            { name = "misc_0034", row = 3, col = 2 }
        },
        ["misc_0055"] = {
            { name = "misc_0047", row = 0, col = 0 },
            { name = "misc_0047", row = 1, col = 1 },
            { name = "misc_0047", row = 1, col = 3 },
            { name = "misc_0047", row = 2, col = 2 },
            { name = "misc_0047", row = 2, col = 3 },
            { name = "misc_0047", row = 3, col = 2 }
        },
        ["misc_0103"] = {
            { name = "misc_0055", row = 0, col = 0 },
            { name = "misc_0055", row = 1, col = 1 },
            { name = "misc_0055", row = 1, col = 3 },
            { name = "misc_0055", row = 2, col = 2 },
            { name = "misc_0055", row = 2, col = 3 },
            { name = "misc_0055", row = 3, col = 2 }
        },
        ["misc_0122"] = {
            { name = "misc_0103", row = 0, col = 0 },
            { name = "misc_0103", row = 1, col = 1 },
            { name = "misc_0103", row = 1, col = 3 },
            { name = "misc_0103", row = 2, col = 2 },
            { name = "misc_0103", row = 2, col = 3 },
            { name = "misc_0103", row = 3, col = 2 }
        },
        ["misc_0128"] = {
            { name = "misc_0122", row = 0, col = 0 },
            { name = "misc_0122", row = 1, col = 1 },
            { name = "misc_0122", row = 1, col = 3 },
            { name = "misc_0122", row = 2, col = 2 },
            { name = "misc_0122", row = 2, col = 3 },
            { name = "misc_0122", row = 3, col = 2 }
        },
        ["misc_0131"] = {
            { name = "misc_0128", row = 0, col = 0 },
            { name = "misc_0128", row = 1, col = 1 },
            { name = "misc_0128", row = 1, col = 3 },
            { name = "misc_0128", row = 2, col = 2 },
            { name = "misc_0128", row = 2, col = 3 },
            { name = "misc_0128", row = 3, col = 2 }
        },
        ["misc_0134"] = {
            { name = "misc_0131", row = 0, col = 0 },
            { name = "misc_0131", row = 1, col = 1 },
            { name = "misc_0131", row = 1, col = 3 },
            { name = "misc_0131", row = 2, col = 2 },
            { name = "misc_0131", row = 2, col = 3 },
            { name = "misc_0131", row = 3, col = 2 }
        },
        ["misc_0152"] = {
            { name = "misc_0134", row = 0, col = 0 },
            { name = "misc_0134", row = 1, col = 1 },
            { name = "misc_0134", row = 1, col = 3 },
            { name = "misc_0134", row = 2, col = 2 },
            { name = "misc_0134", row = 2, col = 3 },
            { name = "misc_0134", row = 3, col = 2 }
        },
        ["misc_0155"] = {
            { name = "misc_0152", row = 0, col = 0 },
            { name = "misc_0152", row = 1, col = 1 },
            { name = "misc_0152", row = 1, col = 3 },
            { name = "misc_0152", row = 2, col = 2 },
            { name = "misc_0152", row = 2, col = 3 },
            { name = "misc_0152", row = 3, col = 2 }
        },
        ["misc_0187"] = {
            { name = "misc_0155", row = 0, col = 0 },
            { name = "misc_0155", row = 1, col = 1 },
            { name = "misc_0155", row = 1, col = 3 },
            { name = "misc_0155", row = 2, col = 2 },
            { name = "misc_0155", row = 2, col = 3 },
            { name = "misc_0155", row = 3, col = 2 }
        },
        ["misc_0223"] = {
            { name = "misc_0187", row = 0, col = 0 },
            { name = "misc_0187", row = 1, col = 1 },
            { name = "misc_0187", row = 1, col = 3 },
            { name = "misc_0187", row = 2, col = 2 },
            { name = "misc_0187", row = 2, col = 3 },
            { name = "misc_0187", row = 3, col = 2 }
        },
        ["misc_0226"] = {
            { name = "misc_0223", row = 0, col = 0 },
            { name = "misc_0223", row = 1, col = 1 },
            { name = "misc_0223", row = 1, col = 3 },
            { name = "misc_0223", row = 2, col = 2 },
            { name = "misc_0223", row = 2, col = 3 },
            { name = "misc_0223", row = 3, col = 2 }
        },
        ["misc_0269"] = {
            { name = "misc_0226", row = 0, col = 0 },
            { name = "misc_0226", row = 1, col = 1 },
            { name = "misc_0226", row = 1, col = 3 },
            { name = "misc_0226", row = 2, col = 2 },
            { name = "misc_0226", row = 2, col = 3 },
            { name = "misc_0226", row = 3, col = 2 }
        },
        ["misc_0275"] = {
            { name = "misc_0269", row = 0, col = 0 },
            { name = "misc_0269", row = 1, col = 1 },
            { name = "misc_0269", row = 1, col = 3 },
            { name = "misc_0269", row = 2, col = 2 },
            { name = "misc_0269", row = 2, col = 3 },
            { name = "misc_0269", row = 3, col = 2 }
        },
        ["misc_0139"] = {
            { name = "misc_0132", row = 0, col = 0 },
            { name = "misc_0132", row = 0, col = 1 },
            { name = "misc_0132", row = 0, col = 2 },
            { name = "misc_0132", row = 1, col = 0 },
            { name = "misc_0132", row = 1, col = 2 },
            { name = "misc_0132", row = 2, col = 0 },
            { name = "misc_0132", row = 2, col = 1 },
            { name = "misc_0132", row = 2, col = 2 }
        },
        ["misc_0141"] = {
            { name = "misc_0139", row = 0, col = 0 },
            { name = "misc_0139", row = 0, col = 1 },
            { name = "misc_0139", row = 0, col = 2 },
            { name = "misc_0139", row = 1, col = 0 },
            { name = "misc_0139", row = 1, col = 2 },
            { name = "misc_0139", row = 2, col = 0 },
            { name = "misc_0139", row = 2, col = 1 },
            { name = "misc_0139", row = 2, col = 2 }
        },
        ["misc_0162"] = {
            { name = "misc_0141", row = 0, col = 0 },
            { name = "misc_0141", row = 0, col = 1 },
            { name = "misc_0141", row = 0, col = 2 },
            { name = "misc_0141", row = 1, col = 0 },
            { name = "misc_0141", row = 1, col = 2 },
            { name = "misc_0141", row = 2, col = 0 },
            { name = "misc_0141", row = 2, col = 1 },
            { name = "misc_0141", row = 2, col = 2 }
        },
        ["misc_0225"] = {
            { name = "misc_0162", row = 0, col = 0 },
            { name = "misc_0162", row = 0, col = 1 },
            { name = "misc_0162", row = 0, col = 2 },
            { name = "misc_0162", row = 1, col = 0 },
            { name = "misc_0162", row = 1, col = 2 },
            { name = "misc_0162", row = 2, col = 0 },
            { name = "misc_0162", row = 2, col = 1 },
            { name = "misc_0162", row = 2, col = 2 }
        },
        ["misc_0263"] = {
            { name = "misc_0225", row = 0, col = 0 },
            { name = "misc_0225", row = 0, col = 1 },
            { name = "misc_0225", row = 0, col = 2 },
            { name = "misc_0225", row = 1, col = 0 },
            { name = "misc_0225", row = 1, col = 2 },
            { name = "misc_0225", row = 2, col = 0 },
            { name = "misc_0225", row = 2, col = 1 },
            { name = "misc_0225", row = 2, col = 2 }
        },
        ["misc_0267"] = {
            { name = "misc_0263", row = 0, col = 0 },
            { name = "misc_0263", row = 0, col = 1 },
            { name = "misc_0263", row = 0, col = 2 },
            { name = "misc_0263", row = 1, col = 0 },
            { name = "misc_0263", row = 1, col = 2 },
            { name = "misc_0263", row = 2, col = 0 },
            { name = "misc_0263", row = 2, col = 1 },
            { name = "misc_0263", row = 2, col = 2 }
        },
        ["misc_0041"] = {
            { name = "misc_0020", row = 0, col = 0 },
            { name = "misc_0020", row = 0, col = 3 },
            { name = "misc_0020", row = 1, col = 1 },
            { name = "misc_0020", row = 1, col = 2 },
            { name = "misc_0020", row = 2, col = 0 },
            { name = "misc_0020", row = 2, col = 3 }
        },
        ["misc_0049"] = {
            { name = "misc_0041", row = 0, col = 0 },
            { name = "misc_0041", row = 0, col = 3 },
            { name = "misc_0041", row = 1, col = 1 },
            { name = "misc_0041", row = 1, col = 2 },
            { name = "misc_0041", row = 2, col = 0 },
            { name = "misc_0041", row = 2, col = 3 }
        },
        ["misc_0109"] = {
            { name = "misc_0049", row = 0, col = 0 },
            { name = "misc_0049", row = 0, col = 3 },
            { name = "misc_0049", row = 1, col = 1 },
            { name = "misc_0049", row = 1, col = 2 },
            { name = "misc_0049", row = 2, col = 0 },
            { name = "misc_0049", row = 2, col = 3 }
        },
        ["misc_0119"] = {
            { name = "misc_0109", row = 0, col = 0 },
            { name = "misc_0109", row = 0, col = 3 },
            { name = "misc_0109", row = 1, col = 1 },
            { name = "misc_0109", row = 1, col = 2 },
            { name = "misc_0109", row = 2, col = 0 },
            { name = "misc_0109", row = 2, col = 3 }
        },
        ["misc_0138"] = {
            { name = "misc_0119", row = 0, col = 0 },
            { name = "misc_0119", row = 0, col = 3 },
            { name = "misc_0119", row = 1, col = 1 },
            { name = "misc_0119", row = 1, col = 2 },
            { name = "misc_0119", row = 2, col = 0 },
            { name = "misc_0119", row = 2, col = 3 }
        },
        ["misc_0221"] = {
            { name = "misc_0138", row = 0, col = 0 },
            { name = "misc_0138", row = 0, col = 3 },
            { name = "misc_0138", row = 1, col = 1 },
            { name = "misc_0138", row = 1, col = 2 },
            { name = "misc_0138", row = 2, col = 0 },
            { name = "misc_0138", row = 2, col = 3 }
        },
        ["misc_0235"] = {
            { name = "misc_0221", row = 0, col = 0 },
            { name = "misc_0221", row = 0, col = 3 },
            { name = "misc_0221", row = 1, col = 1 },
            { name = "misc_0221", row = 1, col = 2 },
            { name = "misc_0221", row = 2, col = 0 },
            { name = "misc_0221", row = 2, col = 3 }
        },
        ["misc_0149"] = {
            { name = "misc_0147", row = 0, col = 0 },
            { name = "misc_0147", row = 0, col = 1 },
            { name = "misc_0147", row = 0, col = 3 },
            { name = "misc_0147", row = 1, col = 2 },
            { name = "misc_0147", row = 2, col = 1 },
            { name = "misc_0147", row = 2, col = 3 },
            { name = "misc_0147", row = 3, col = 1 },
            { name = "misc_0147", row = 3, col = 2 }
        },
        ["misc_0222"] = {
            { name = "misc_0149", row = 0, col = 0 },
            { name = "misc_0149", row = 0, col = 1 },
            { name = "misc_0149", row = 0, col = 3 },
            { name = "misc_0149", row = 1, col = 2 },
            { name = "misc_0149", row = 2, col = 1 },
            { name = "misc_0149", row = 2, col = 3 },
            { name = "misc_0149", row = 3, col = 1 },
            { name = "misc_0149", row = 3, col = 2 }
        },
        ["misc_0229"] = {
            { name = "misc_0222", row = 0, col = 0 },
            { name = "misc_0222", row = 0, col = 1 },
            { name = "misc_0222", row = 0, col = 3 },
            { name = "misc_0222", row = 1, col = 2 },
            { name = "misc_0222", row = 2, col = 1 },
            { name = "misc_0222", row = 2, col = 3 },
            { name = "misc_0222", row = 3, col = 1 },
            { name = "misc_0222", row = 3, col = 2 }
        },
        ["misc_0232"] = {
            { name = "misc_0229", row = 0, col = 0 },
            { name = "misc_0229", row = 0, col = 1 },
            { name = "misc_0229", row = 0, col = 3 },
            { name = "misc_0229", row = 1, col = 2 },
            { name = "misc_0229", row = 2, col = 1 },
            { name = "misc_0229", row = 2, col = 3 },
            { name = "misc_0229", row = 3, col = 1 },
            { name = "misc_0229", row = 3, col = 2 }
        },
        ["misc_0236"] = {
            { name = "misc_0232", row = 0, col = 0 },
            { name = "misc_0232", row = 0, col = 1 },
            { name = "misc_0232", row = 0, col = 3 },
            { name = "misc_0232", row = 1, col = 2 },
            { name = "misc_0232", row = 2, col = 1 },
            { name = "misc_0232", row = 2, col = 3 },
            { name = "misc_0232", row = 3, col = 1 },
            { name = "misc_0232", row = 3, col = 2 }
        },
        ["misc_0237"] = {
            { name = "misc_0236", row = 0, col = 0 },
            { name = "misc_0236", row = 0, col = 1 },
            { name = "misc_0236", row = 0, col = 3 },
            { name = "misc_0236", row = 1, col = 2 },
            { name = "misc_0236", row = 2, col = 1 },
            { name = "misc_0236", row = 2, col = 3 },
            { name = "misc_0236", row = 3, col = 1 },
            { name = "misc_0236", row = 3, col = 2 }
        },
        ["misc_0260"] = {
            { name = "misc_0237", row = 0, col = 0 },
            { name = "misc_0237", row = 0, col = 1 },
            { name = "misc_0237", row = 0, col = 3 },
            { name = "misc_0237", row = 1, col = 2 },
            { name = "misc_0237", row = 2, col = 1 },
            { name = "misc_0237", row = 2, col = 3 },
            { name = "misc_0237", row = 3, col = 1 },
            { name = "misc_0237", row = 3, col = 2 }
        },
        ["misc_0278"] = {
            { name = "misc_0260", row = 0, col = 0 },
            { name = "misc_0260", row = 0, col = 1 },
            { name = "misc_0260", row = 0, col = 3 },
            { name = "misc_0260", row = 1, col = 2 },
            { name = "misc_0260", row = 2, col = 1 },
            { name = "misc_0260", row = 2, col = 3 },
            { name = "misc_0260", row = 3, col = 1 },
            { name = "misc_0260", row = 3, col = 2 }
        },
        ["misc_0027"] = {
            { name = "misc_0012", row = 0, col = 0 },
            { name = "misc_0012", row = 0, col = 1 },
            { name = "misc_0012", row = 1, col = 2 },
            { name = "misc_0012", row = 2, col = 1 },
            { name = "misc_0012", row = 3, col = 1 }
        },
        ["misc_0054"] = {
            { name = "misc_0027", row = 0, col = 0 },
            { name = "misc_0027", row = 0, col = 1 },
            { name = "misc_0027", row = 1, col = 2 },
            { name = "misc_0027", row = 2, col = 1 },
            { name = "misc_0027", row = 3, col = 1 }
        },
        ["misc_0072"] = {
            { name = "misc_0054", row = 0, col = 0 },
            { name = "misc_0054", row = 0, col = 1 },
            { name = "misc_0054", row = 1, col = 2 },
            { name = "misc_0054", row = 2, col = 1 },
            { name = "misc_0054", row = 3, col = 1 }
        },
        ["misc_0080"] = {
            { name = "misc_0072", row = 0, col = 0 },
            { name = "misc_0072", row = 0, col = 1 },
            { name = "misc_0072", row = 1, col = 2 },
            { name = "misc_0072", row = 2, col = 1 },
            { name = "misc_0072", row = 3, col = 1 }
        },
        ["misc_0144"] = {
            { name = "misc_0080", row = 0, col = 0 },
            { name = "misc_0080", row = 0, col = 1 },
            { name = "misc_0080", row = 1, col = 2 },
            { name = "misc_0080", row = 2, col = 1 },
            { name = "misc_0080", row = 3, col = 1 }
        },
        ["misc_0166"] = {
            { name = "misc_0144", row = 0, col = 0 },
            { name = "misc_0144", row = 0, col = 1 },
            { name = "misc_0144", row = 1, col = 2 },
            { name = "misc_0144", row = 2, col = 1 },
            { name = "misc_0144", row = 3, col = 1 }
        },
        ["misc_0176"] = {
            { name = "misc_0166", row = 0, col = 0 },
            { name = "misc_0166", row = 0, col = 1 },
            { name = "misc_0166", row = 1, col = 2 },
            { name = "misc_0166", row = 2, col = 1 },
            { name = "misc_0166", row = 3, col = 1 }
        },
        ["misc_0212"] = {
            { name = "misc_0176", row = 0, col = 0 },
            { name = "misc_0176", row = 0, col = 1 },
            { name = "misc_0176", row = 1, col = 2 },
            { name = "misc_0176", row = 2, col = 1 },
            { name = "misc_0176", row = 3, col = 1 }
        },
        ["misc_0216"] = {
            { name = "misc_0212", row = 0, col = 0 },
            { name = "misc_0212", row = 0, col = 1 },
            { name = "misc_0212", row = 1, col = 2 },
            { name = "misc_0212", row = 2, col = 1 },
            { name = "misc_0212", row = 3, col = 1 }
        },
        ["misc_0266"] = {
            { name = "misc_0216", row = 0, col = 0 },
            { name = "misc_0216", row = 0, col = 1 },
            { name = "misc_0216", row = 1, col = 2 },
            { name = "misc_0216", row = 2, col = 1 },
            { name = "misc_0216", row = 3, col = 1 }
        },
        ["misc_0270"] = {
            { name = "misc_0266", row = 0, col = 0 },
            { name = "misc_0266", row = 0, col = 1 },
            { name = "misc_0266", row = 1, col = 2 },
            { name = "misc_0266", row = 2, col = 1 },
            { name = "misc_0266", row = 3, col = 1 }
        },
        ["misc_0028"] = {
            { name = "misc_0022", row = 0, col = 0 },
            { name = "misc_0022", row = 0, col = 1 },
            { name = "misc_0022", row = 1, col = 2 },
            { name = "misc_0022", row = 2, col = 1 },
            { name = "misc_0022", row = 3, col = 1 }
        },
        ["misc_0201"] = {
            { name = "misc_0028", row = 0, col = 0 },
            { name = "misc_0028", row = 0, col = 1 },
            { name = "misc_0028", row = 1, col = 2 },
            { name = "misc_0028", row = 2, col = 1 },
            { name = "misc_0028", row = 3, col = 1 }
        },
        ["misc_0205"] = {
            { name = "misc_0201", row = 0, col = 0 },
            { name = "misc_0201", row = 0, col = 1 },
            { name = "misc_0201", row = 1, col = 2 },
            { name = "misc_0201", row = 2, col = 1 },
            { name = "misc_0201", row = 3, col = 1 }
        },
        ["misc_0175"] = {
            { name = "misc_0130", row = 0, col = 0 },
            { name = "misc_0130", row = 0, col = 1 },
            { name = "misc_0130", row = 1, col = 2 },
            { name = "misc_0130", row = 2, col = 1 },
            { name = "misc_0130", row = 3, col = 1 }
        },
        ["misc_0177"] = {
            { name = "misc_0175", row = 0, col = 0 },
            { name = "misc_0175", row = 0, col = 1 },
            { name = "misc_0175", row = 1, col = 2 },
            { name = "misc_0175", row = 2, col = 1 },
            { name = "misc_0175", row = 3, col = 1 }
        },
        ["misc_0208"] = {
            { name = "misc_0177", row = 0, col = 0 },
            { name = "misc_0177", row = 0, col = 1 },
            { name = "misc_0177", row = 1, col = 2 },
            { name = "misc_0177", row = 2, col = 1 },
            { name = "misc_0177", row = 3, col = 1 }
        },
        ["misc_0083"] = {
            { name = "misc_0018", row = 0, col = 0 },
            { name = "misc_0018", row = 0, col = 1 },
            { name = "misc_0018", row = 2, col = 1 },
            { name = "misc_0018", row = 3, col = 1 },
            { name = "misc_0018", row = 3, col = 2 },
            { name = "misc_0018", row = 4, col = 1 }
        },
        ["misc_0100"] = {
            { name = "misc_0083", row = 0, col = 0 },
            { name = "misc_0083", row = 0, col = 1 },
            { name = "misc_0083", row = 2, col = 1 },
            { name = "misc_0083", row = 3, col = 1 },
            { name = "misc_0083", row = 3, col = 2 },
            { name = "misc_0083", row = 4, col = 1 }
        },
        ["misc_0102"] = {
            { name = "misc_0100", row = 0, col = 0 },
            { name = "misc_0100", row = 0, col = 1 },
            { name = "misc_0100", row = 2, col = 1 },
            { name = "misc_0100", row = 3, col = 1 },
            { name = "misc_0100", row = 3, col = 2 },
            { name = "misc_0100", row = 4, col = 1 }
        },
        ["misc_0159"] = {
            { name = "misc_0102", row = 0, col = 0 },
            { name = "misc_0102", row = 0, col = 1 },
            { name = "misc_0102", row = 2, col = 1 },
            { name = "misc_0102", row = 3, col = 1 },
            { name = "misc_0102", row = 3, col = 2 },
            { name = "misc_0102", row = 4, col = 1 }
        },
        ["misc_0192"] = {
            { name = "misc_0159", row = 0, col = 0 },
            { name = "misc_0159", row = 0, col = 1 },
            { name = "misc_0159", row = 2, col = 1 },
            { name = "misc_0159", row = 3, col = 1 },
            { name = "misc_0159", row = 3, col = 2 },
            { name = "misc_0159", row = 4, col = 1 }
        },
        ["misc_0210"] = {
            { name = "misc_0192", row = 0, col = 0 },
            { name = "misc_0192", row = 0, col = 1 },
            { name = "misc_0192", row = 2, col = 1 },
            { name = "misc_0192", row = 3, col = 1 },
            { name = "misc_0192", row = 3, col = 2 },
            { name = "misc_0192", row = 4, col = 1 }
        },
        ["misc_0215"] = {
            { name = "misc_0210", row = 0, col = 0 },
            { name = "misc_0210", row = 0, col = 1 },
            { name = "misc_0210", row = 2, col = 1 },
            { name = "misc_0210", row = 3, col = 1 },
            { name = "misc_0210", row = 3, col = 2 },
            { name = "misc_0210", row = 4, col = 1 }
        },
        ["misc_0218"] = {
            { name = "misc_0215", row = 0, col = 0 },
            { name = "misc_0215", row = 0, col = 1 },
            { name = "misc_0215", row = 2, col = 1 },
            { name = "misc_0215", row = 3, col = 1 },
            { name = "misc_0215", row = 3, col = 2 },
            { name = "misc_0215", row = 4, col = 1 }
        },
        ["misc_0231"] = {
            { name = "misc_0218", row = 0, col = 0 },
            { name = "misc_0218", row = 0, col = 1 },
            { name = "misc_0218", row = 2, col = 1 },
            { name = "misc_0218", row = 3, col = 1 },
            { name = "misc_0218", row = 3, col = 2 },
            { name = "misc_0218", row = 4, col = 1 }
        },
        ["misc_0234"] = {
            { name = "misc_0231", row = 0, col = 0 },
            { name = "misc_0231", row = 0, col = 1 },
            { name = "misc_0231", row = 2, col = 1 },
            { name = "misc_0231", row = 3, col = 1 },
            { name = "misc_0231", row = 3, col = 2 },
            { name = "misc_0231", row = 4, col = 1 }
        },
        ["misc_0246"] = {
            { name = "misc_0234", row = 0, col = 0 },
            { name = "misc_0234", row = 0, col = 1 },
            { name = "misc_0234", row = 2, col = 1 },
            { name = "misc_0234", row = 3, col = 1 },
            { name = "misc_0234", row = 3, col = 2 },
            { name = "misc_0234", row = 4, col = 1 }
        },
        ["misc_0247"] = {
            { name = "misc_0246", row = 0, col = 0 },
            { name = "misc_0246", row = 0, col = 1 },
            { name = "misc_0246", row = 2, col = 1 },
            { name = "misc_0246", row = 3, col = 1 },
            { name = "misc_0246", row = 3, col = 2 },
            { name = "misc_0246", row = 4, col = 1 }
        },
        ["misc_0268"] = {
            { name = "misc_0247", row = 0, col = 0 },
            { name = "misc_0247", row = 0, col = 1 },
            { name = "misc_0247", row = 2, col = 1 },
            { name = "misc_0247", row = 3, col = 1 },
            { name = "misc_0247", row = 3, col = 2 },
            { name = "misc_0247", row = 4, col = 1 }
        },
        ["misc_0271"] = {
            { name = "misc_0268", row = 0, col = 0 },
            { name = "misc_0268", row = 0, col = 1 },
            { name = "misc_0268", row = 2, col = 1 },
            { name = "misc_0268", row = 3, col = 1 },
            { name = "misc_0268", row = 3, col = 2 },
            { name = "misc_0268", row = 4, col = 1 }
        },
        ["egg_008"] = {
            { name = "misc_quicksilver", row = 0, col = 0 },
            { name = "misc_0011", row = 0, col = 1 },
            { name = "misc_0236", row = 0, col = 2 },
            { name = "misc_whip_vine_ra2", row = 1, col = 2 },
            { name = "misc_0244", row = 1, col = 3 },
            { name = "misc_yekubite3", row = 1, col = 4 },
            { name = "misc_Fire_Dragon2", row = 2, col = 3 },
            { name = "misc_goldbar", row = 3, col = 3 },
            { name = "misc_talt", row = 4, col = 2 },
            { name = "misc_seedOil", row = 4, col = 3 },
            { name = "misc_hanaming2", row = 4, col = 4 },
            { name = "misc_Dumaro", row = 6, col = 1 },
            { name = "misc_liena_pants_1", row = 6, col = 3 },
            { name = "rsc_2_1", row = 6, col = 5 },
            { name = "misc_icepiece", row = 6, col = 7 }
        },
        ["misc_quicksilver"] = {
            { name = "misc_silverbar", row = 0, col = 0 },
            { name = "misc_silverbar", row = 0, col = 1 },
            { name = "misc_silverbar", row = 1, col = 0 },
            { name = "misc_silverbar", row = 3, col = 1 },
            { name = "misc_silverbar", row = 2, col = 2 }
        },
        ["misc_0011"] = {
            { name = "OnionPiece_Red", row = 0, col = 0 },
            { name = "OnionPiece_Red", row = 0, col = 2 },
            { name = "OnionPiece_Red", row = 1, col = 1 },
            { name = "OnionPiece_Red", row = 2, col = 0 },
            { name = "OnionPiece_Red", row = 2, col = 2 }
        },
        ["misc_whip_vine_ra2"] = {
            { name = "misc_popolion3", row = 0, col = 0 },
            { name = "misc_popolion3", row = 0, col = 1 },
            { name = "misc_popolion3", row = 0, col = 2 },
            { name = "misc_popolion3", row = 0, col = 3 }
        },
        ["misc_0244"] = {
            { name = "misc_0196", row = 0, col = 0 },
            { name = "misc_0196", row = 0, col = 2 },
            { name = "misc_0196", row = 1, col = 3 },
            { name = "misc_0196", row = 2, col = 4 },
            { name = "misc_0196", row = 3, col = 3 },
            { name = "misc_0196", row = 4, col = 1 }
        },
        ["misc_yekubite3"] = {
            { name = "misc_yekubite2", row = 0, col = 0 },
            { name = "misc_yekubite2", row = 0, col = 1 },
            { name = "misc_yekubite2", row = 2, col = 1 },
            { name = "misc_yekubite2", row = 3, col = 1 },
            { name = "misc_yekubite2", row = 3, col = 2 },
            { name = "misc_yekubite2", row = 4, col = 1 }
        },
        ["misc_Fire_Dragon2"] = {
            { name = "misc_0079", row = 0, col = 0 },
            { name = "misc_0079", row = 0, col = 1 },
            { name = "misc_0079", row = 2, col = 1 },
            { name = "misc_0079", row = 3, col = 1 },
            { name = "misc_0079", row = 3, col = 2 },
            { name = "misc_0079", row = 3, col = 5 }
        },
        ["misc_goldbar"] = {
            { name = "misc_talt", row = 0, col = 0 },
            { name = "misc_talt", row = 0, col = 1 },
            { name = "misc_talt", row = 1, col = 0 },
            { name = "misc_talt", row = 1, col = 1 },
            { name = "misc_talt", row = 2, col = 0 },
            { name = "misc_talt", row = 2, col = 1 },
            { name = "misc_talt", row = 3, col = 0 },
            { name = "misc_talt", row = 3, col = 1 },
            { name = "misc_talt", row = 4, col = 0 },
            { name = "misc_talt", row = 4, col = 1 }
        },
        ["misc_talt"] = {
            { name = "misc_goldbar", row = 0, col = 0 },
            { name = "misc_goldbar", row = 3, col = 3 }
        },
        ["misc_seedOil"] = {
            { name = "misc_seedmia", row = 0, col = 0 },
            { name = "misc_seedmia", row = 1, col = 1 },
            { name = "misc_seedmia", row = 2, col = 2 }
        },
        ["misc_hanaming2"] = {
            { name = "leaf_hanaming", row = 0, col = 0 },
            { name = "leaf_hanaming", row = 0, col = 4 },
            { name = "leaf_hanaming", row = 1, col = 1 },
            { name = "leaf_hanaming", row = 1, col = 3 },
            { name = "leaf_hanaming", row = 2, col = 2 }
        },
        ["misc_liena_pants_1"] = {
            { name = "misc_0135", row = 0, col = 0 },
            { name = "misc_0135", row = 0, col = 1 },
            { name = "misc_0135", row = 1, col = 1 },
            { name = "misc_0135", row = 2, col = 1 },
            { name = "misc_0135", row = 3, col = 0 },
            { name = "misc_0135", row = 3, col = 2 }
        },
        ["rsc_2_1"] = {
            { name = "misc_mud", row = 0, col = 0 },
            { name = "misc_mud", row = 1, col = 1 },
            { name = "misc_mud", row = 2, col = 0 },
            { name = "misc_mud", row = 2, col = 1 },
            { name = "misc_mud", row = 2, col = 2 }
        },
        ["misc_icepiece"] = {
            { name = "Drug_holywater", row = 0, col = 0 },
            { name = "Drug_holywater", row = 0, col = 1 },
            { name = "Drug_holywater", row = 1, col = 0 },
            { name = "Drug_holywater", row = 1, col = 1 }
        }
    };
end

-- loaded message
CHAT_SYSTEM(string.format("%s.lua is loaded", addonName));

-- save settings
function ALCHEMY_SAVE_SETTINGS()
    acutil.saveJSON(g.settingsFileLoc, g.settings);
end

-- load settings
function ALCHEMY_LOAD_SETTINGS(force)
    if not g.loaded or force  then
        local settings, err = acutil.loadJSON(g.settingsFileLoc, g.settings);
        if err then
            CHAT_SYSTEM(string.format("[%s] cannot load setting files", addonName));
        else
            g.settings = settings;
        end
        g.loaded = true;
    end
end

-- setup hooks
function ALCHEMY_SETUP_HOOKS()
    acutil.setupHook(ALCHEMY_ON_PUZZLECRAFT_OPEN, 'PUZZLECRAFT_OPEN');
end

-- initialize
function ALCHEMY_ON_INIT(addon, frame)
    g.addon = addon;
    g.frame = frame;

    ALCHEMY_LOAD_SETTINGS();
    ALCHEMY_SETUP_HOOKS();
end

-- on puzzlecraft open
function ALCHEMY_ON_PUZZLECRAFT_OPEN(frame)
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');

    -- create or get groupbox
    local recipeBg = bg:CreateOrGetControl('groupbox', 'alchemy_recipe_bg', 0, 0, 365, 35);
    recipeBg = tolua.cast(recipeBg, 'ui::CGroupBox');
    recipeBg:Move(0, 0);
    recipeBg:SetOffset(35, 570);
    recipeBg:EnableScrollBar(0);
    recipeBg:EnableResizeByParent(0);
    recipeBg:SetSkinName('test_frame_midle');
    recipeBg:SetEventScript(ui.LBUTTONUP, 'ALCHEMY_POPUP_RECIPE_LIST');

    -- create or get droplist
    local recipeText = recipeBg:CreateOrGetControl('richtext', 'alchemy_recipe_text', 0, 0, 360, 35);
    recipeText = tolua.cast(recipeText, 'ui::CRichText');
    recipeText:SetFormat('%s');
    recipeText:SetGravity(ui.LEFT, ui.TOP);
    recipeText:Move(0, 0);
    recipeText:SetOffset(15, 7);
    recipeText:SetText(GetClass('Item', g.settings.selected).Name);
    recipeText:SetFontName('white_16_ol');
    recipeText:SetTextAlign('left', 'center');
    recipeText:ShowWindow(1);
    recipeText:SetEventScript(ui.LBUTTONUP, 'ALCHEMY_POPUP_RECIPE_LIST');

    -- create or get load button
    local loadRecipeBtn = bg:CreateOrGetControl('button', 'alchemy_recipe_load_button', 0, 0, 100, 42);
    loadRecipeBtn:SetSkinName('test_pvp_btn');
    loadRecipeBtn:SetGravity(ui.LEFT, ui.TOP);
    loadRecipeBtn:SetText('{@st66}Load{/}');
    loadRecipeBtn:Move(0,0);
    loadRecipeBtn:SetOffset(420, 565);
    loadRecipeBtn:ShowWindow(1);
    loadRecipeBtn:SetClickSound('button_click_stats');
    loadRecipeBtn:SetOverSound('button_over');
    loadRecipeBtn:SetEventScript(ui.LBUTTONUP, 'ALCHEMY_LOAD_RECIPE()');

    -- chain original function
    PUZZLECRAFT_OPEN_OLD(frame);
end

-- popup recipes
function ALCHEMY_POPUP_RECIPE_LIST()
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');
    local recipeBg = GET_CHILD(bg, 'alchemy_recipe_bg');

    -- load recipes
    local dropListFrame = ui.MakeDropListFrame(recipeBg, 0, 0, 365, 0, 11, ui.LEFT, 'ALCHEMY_ON_SELECT_RECIPE');
    for itemId, recipe in pairs(g.recipeList) do
        local item = GetClass('Item', itemId);
        ui.AddDropListItem(item.Name, ' ', itemId);
    end
end

-- on select recipe
function ALCHEMY_ON_SELECT_RECIPE(index, itemId)
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');
    local recipeBg = GET_CHILD(bg, 'alchemy_recipe_bg');
    local recipes = GET_CHILD(recipeBg, 'alchemy_recipe_text', 'ui::CDropList');

    -- set selected
    g.settings.selected = itemId;

    -- save settings
    ALCHEMY_SAVE_SETTINGS();

    recipes:SetText(GetClass('Item', itemId).Name);

    ALCHEMY_LOAD_RECIPE();
end

-- load recipe
function ALCHEMY_LOAD_RECIPE()
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');

   -- clear slotset
    PUZZLECRAFT_CLEAR_ALL_SLOT(bg);

    -- set items
    local recipe = g.recipeList[g.settings.selected];
    local slotset = GET_CHILD(bg, 'slotset', 'ui::CSlotSet');
    local slot = nil;
    for i = 1, #recipe do
        slot = slotset:GetSlotByRowCol(recipe[i]['row'], recipe[i]['col']);
        SET_SLOT_ITEM_INV(slot, GetClass('Item', recipe[i]['name']));
    end
    CHECK_NEW_PUZZLE(puzzlecraft, slot);
end
