local ui = ui;

-- addon infromation
local addonName = 'ExtendedMinimap';
local addonNameLower = string.lower(addonName);
local author = 'zak1ck';

-- initialize addon
_G['ADDONS'] = _G['ADDONS'] or {};
_G["ADDONS"][author] = _G["ADDONS"][author] or {};
_G["ADDONS"][author][addonName] = _G["ADDONS"][author][addonName] or {};
local g = _G["ADDONS"][author][addonName];

-- load acutil
local acutil = require('acutil');

-- loaded message
CHAT_SYSTEM(string.format("%s.lua is loaded", addonName));

-- init function
function EXTENDED_MINIMAP_ON_INIT(addon, frame)
    EXTENDED_MINIMAP_SETUP_HOOKS();
end

-- setup hooks
function EXTENDED_MINIMAP_SETUP_HOOKS()
    local minimap = ui.GetFrame("minimap");
    minimap:SetEventScript(ui.RBUTTONDOWN, "EXTENDED_MINIMAP_POPUP_MINIMAP_MENU");
end

-- ミニマップの背景スキン変更処理
function EXTENDED_MINIMAP_CHANGE_BACKGROUND_SKIN(skin)
    local minimap = ui.GetFrame("minimap");
    minimap:GetChild("mbg"):SetSkinName(skin);
end

-- ミニマップ画像の透過処理
function EXTENDED_MINIMAP_CHANGE_ALPHA_NUM_OF_MINIMAP(alpha)
    local minimap = ui.GetFrame("minimap");
    minimap:GetChild("map_bg"):SetAlpha(alpha);
    minimap:GetChild("map"):SetAlpha(alpha);
end

-- ミニマップのコンテキストメニュー
function EXTENDED_MINIMAP_POPUP_MINIMAP_MENU(parent, ctrl)
    local context = ui.CreateContextMenu("MINIMAP_CONTEXT_MENU", name, 0, 0, 150, 100);

    -- 背景スキン
    local subContextBGSkin = ui.CreateContextMenu("MINIMAP_SUBCONTEXT_MENU_BG_SKIN", "", 0, 0, 0, 0);
    ui.AddContextMenuItem(subContextBGSkin, "無し" , string.format("EXTENDED_MINIMAP_CHANGE_BACKGROUND_SKIN('%s')", "None"));
    ui.AddContextMenuItem(subContextBGSkin, "デフォルト" , string.format("EXTENDED_MINIMAP_CHANGE_BACKGROUND_SKIN('%s')", "chat_window"));
    ui.AddContextMenuItem(context, "背景 {img white_right_arrow 18 18}", "", nil, 0, 1, subContextBGSkin);

    -- 透過率
    local subContextMapAlpha = ui.CreateContextMenu("MINIMAP_SUBCONTEXT_MENU_ALPHA", "", 0, 0, 0, 0);
    for i = 0, 10 do
        ui.AddContextMenuItem(subContextMapAlpha, (i*10).."%" , string.format("EXTENDED_MINIMAP_CHANGE_ALPHA_NUM_OF_MINIMAP(%d)", (i*10)));
    end
    ui.AddContextMenuItem(context, "透過率 {img white_right_arrow 18 18}", "", nil, 0, 1, subContextMapAlpha);

    context:Resize(130, context:GetHeight());
    ui.OpenContextMenu(context);
end