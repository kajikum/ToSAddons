local ui = ui;

-- addon infromation
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
        selected = "",
        recipeList = {}
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
            if g.settings.recipeList == nil then
                g.settings.recipeList = {};
            end
        end
        g.loaded = true;
    end
end

-- setup hooks
function ALCHEMY_SETUP_HOOKS()
    acutil.setupHook(ALCHEMY_ON_PUZZLECRAFT_OPEN, 'PUZZLECRAFT_OPEN');
end

-- dofile('../alchemy.lua'); ALCHEMY_LOAD_SETTINGS(); ALCHEMY_SETUP_HOOKS()
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
    recipeBg:SetOverSound('button_over');
    recipeBg:SetEventScript(ui.LBUTTONDOWN, 'ALCHEMY_POPUP_RECIPE_LIST');

    -- create or get droplist
    local recipeText = recipeBg:CreateOrGetControl('richtext', 'alchemy_recipe_text', 0, 0, 360, 35);
    recipeText = tolua.cast(recipeText, 'ui::CRichText');
    recipeText:SetFormat('%s');
    recipeText:SetGravity(ui.LEFT, ui.TOP);
    recipeText:Move(0, 0);
    recipeText:SetOffset(15, 7);
    recipeText:SetText(g.settings.selected);
    recipeText:SetFontName('white_16_ol');
    recipeText:SetTextAlign('left', 'top');
    recipeText:ShowWindow(1);
    recipeText:SetEventScript(ui.LBUTTONDOWN, 'ALCHEMY_POPUP_RECIPE_LIST');

    -- create or get load button
    local saveRecipeBtn = bg:CreateOrGetControl('button', 'alchemy_recipe_load_button', 0, 0, 100, 42);
    saveRecipeBtn:SetSkinName('test_pvp_btn');
    saveRecipeBtn:SetGravity(ui.LEFT, ui.TOP);
    local btnText = "";
    btnText = "配置";
    saveRecipeBtn:SetText('{@st66}' .. btnText .. '{/}');
    saveRecipeBtn:Move(0,0);
    saveRecipeBtn:SetOffset(420, 565);
    saveRecipeBtn:ShowWindow(1);
    saveRecipeBtn:SetClickSound('button_click_stats');
    saveRecipeBtn:SetOverSound('button_over');
    saveRecipeBtn:SetEventScript(ui.LBUTTONDOWN, 'ALCHEMY_LOAD_RECIPE');

    -- <edit caption="" maxwidth="120" slideshow="false" spacey="0" textalign="left center" updateparent="false"/>
    local recipeEdit = bg:CreateOrGetControl('edit', 'alchemy_recipe_edit', 0, 0, 368, 35);
    recipeEdit = tolua.cast(recipeEdit, 'ui::CEditControl');
    recipeEdit:SetGravity(ui.LEFT, ui.TOP);
    recipeEdit:Move(0, 0);
    recipeEdit:SetOffset(32, 615);
    recipeEdit:SetFontName('white_16_ol');
    recipeEdit:SetTextAlign('left', 'center');
    recipeEdit:ShowWindow(1);
    -- recipeEdit:SetEventScript(ui.LBUTTONUP, 'ALCHEMY_POPUP_RECIPE_LIST');

    -- create or get save button
    local saveRecipeBtn = bg:CreateOrGetControl('button', 'alchemy_recipe_save_button', 0, 0, 100, 42);
    saveRecipeBtn:SetSkinName('test_pvp_btn');
    saveRecipeBtn:SetGravity(ui.LEFT, ui.TOP);
    local btnText = "";
    btnText = "保存";
    saveRecipeBtn:SetText('{@st66}' .. btnText .. '{/}');
    saveRecipeBtn:Move(0,0);
    saveRecipeBtn:SetOffset(420, 610);
    saveRecipeBtn:ShowWindow(1);
    saveRecipeBtn:SetClickSound('button_click_stats');
    saveRecipeBtn:SetOverSound('button_over');
    saveRecipeBtn:SetEventScript(ui.LBUTTONDOWN, 'ALCHEMY_SAVE_RECIPE');

    -- chain original function
    PUZZLECRAFT_OPEN_OLD(frame);
end


-- sort table by codepoints
function ALCHEMY_PAIRS(recipeList)
    local sorted = {}
    local i = 0;
    for key, _ in pairs(recipeList) do
        i = i + 1
        sorted[i] = { ['Name'] = key };
    end
    table.sort(sorted, function(a, b)
        return a['Name'] < b['Name'];
    end)
    i = 0;
    return function()
        i = i + 1
        if i > #sorted then
            return nil,nil
        else
            local key = sorted[i].Name
            return key, recipeList[key]
        end
    end
end
-- popup recipes
function ALCHEMY_POPUP_RECIPE_LIST()
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');
    local recipeBg = GET_CHILD(bg, 'alchemy_recipe_bg');

    -- load recipes
    local dropListFrame = ui.GetDropListFrame('ALCHEMY_ON_SELECT_RECIPE');
    if dropListFrame == nil then
        local dropListFrame = ui.MakeDropListFrame(recipeBg, 0, 0, 365, 0, 11, ui.LEFT, 'ALCHEMY_ON_SELECT_RECIPE');
        dropListFrame:SetOverSound("button_cursor_over_2");
        for recipeName, recipe in ALCHEMY_PAIRS(g.settings.recipeList) do
            ui.AddDropListItem(recipeName, ' ', recipeName);
        end
    end
end

-- on select recipe
function ALCHEMY_ON_SELECT_RECIPE(index, recipeName)
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');
    local recipeBg = GET_CHILD(bg, 'alchemy_recipe_bg');
    local recipeText = GET_CHILD(recipeBg, 'alchemy_recipe_text', 'ui::CRichText');

    -- set selected
    g.settings.selected = recipeName;

    -- save settings
    ALCHEMY_SAVE_SETTINGS();
    recipeText:SetText(recipeName);

    ALCHEMY_LOAD_RECIPE();
end

-- load recipe
function ALCHEMY_LOAD_RECIPE()
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');

   -- clear slotset
    PUZZLECRAFT_CLEAR_ALL_SLOT(bg);

    -- set items
    local recipe = g.settings.recipeList[g.settings.selected];
    if recipe == nil then
        return;
    end

    local slotset = GET_CHILD(bg, 'slotset', 'ui::CSlotSet');
    for i = 1, #recipe do
        local slot = slotset:GetSlotByRowCol(recipe[i]['row'], recipe[i]['col']);
        SET_SLOT_ITEM_INV(slot, GetClass('Item', recipe[i]['name']));
        -- FIXME: D&Dした時と同様の挙動に出来ない
        -- slot:SetText("", 'count', 'right', 'bottom', -2, 1);
        CHECK_NEW_PUZZLE(puzzlecraft, slot);
    end
end

-- save recipe
function ALCHEMY_SAVE_RECIPE()
    local puzzlecraft = ui.GetFrame('puzzlecraft');
    local bg = GET_CHILD(puzzlecraft, 'bg');
    local recipeEdit =  GET_CHILD(bg, "alchemy_recipe_edit", "ui::CEditControl");
    if recipeEdit:GetText() == "" then
        ui.SysMsg("レシピ名を入力してください。");
        return;
    end

    local slotset = GET_CHILD(bg, "slotset", "ui::CSlotSet");
    local recipe = {};
    for i = 0 , slotset:GetSlotCount() - 1 do
        local slot = slotset:GetSlotByIndex(i);
        local icon = slot:GetIcon();
        if icon ~= nil then
            local iconInfo = icon:GetInfo();
            if iconInfo:GetIESID() ~= '0' then
                local invItem = GET_ITEM_BY_GUID(iconInfo:GetIESID());
                local itemObj = GetIES(invItem:GetObject());
                local recipeSlot = {};
                recipeSlot.row = math.floor(i / slotset:GetCol());
                recipeSlot.col = math.mod(i, slotset:GetCol());
                recipeSlot.name = itemObj.ClassName;
                table.insert(recipe, recipeSlot);
            end
        end
    end

    if #recipe == 0 then
        ui.SysMsg("アイテムをインベントリから配置してください。");
        return;
    end

    g.settings.recipeList[recipeEdit:GetText()] = recipe;
    ALCHEMY_SAVE_SETTINGS();
    recipeEdit:SetText("");
end