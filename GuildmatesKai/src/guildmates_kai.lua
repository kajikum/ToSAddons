local session = session;
local ui = ui;

-- addon infromation
local addonName = 'GuildmatesKai';
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
function GUILDMATES_KAI_ON_INIT(addon, frame)
    g.addon = addon;
    g.frame = frame;

    GUILDMATES_KAI_SETUP_HOOKS();
end

-- Setup any hooks
function GUILDMATES_KAI_SETUP_HOOKS()
    acutil.setupHook(GUILDMATES_KAI_POPUP_GUILD_MEMBER, "POPUP_GUILD_MEMBER");
    -- acutil.setupHook(GUILDMATES_KAI_UPDATE_GUILDINFO, "UPDATE_GUILDINFO");
    acutil.setupHook(GUILDMATES_KAI_OPEN_PARTY_MEMBER_INFO, "OPEN_PARTY_MEMBER_INFO");
    acutil.setupHook(GUILDMATES_KAI_REQUEST_LIKE_STATE, "REQUEST_LIKE_STATE");
end

-- Popup menu
function GUILDMATES_KAI_POPUP_GUILD_MEMBER(parent, ctrl)
    local aid = parent:GetUserValue("AID");
    if aid == "None" then
        aid = ctrl:GetUserValue("AID");
    end

    local memberInfo = session.party.GetPartyMemberInfoByAID(PARTY_GUILD, aid);
    local isLeader = AM_I_LEADER(PARTY_GUILD);
    local myAid = session.loginInfo.GetAID();

    local name = memberInfo:GetName();

    local contextMenuCtrlName = string.format("{@st41}%s{/}", name);
    local context = ui.CreateContextMenu("PC_CONTEXT_MENU", name, 0, 0, 170, 100);

    if isLeader == 1 and aid ~= myAid then
        ui.AddContextMenuItem(context, ScpArgMsg("ChangeDuty"), string.format("GUILD_CHANGE_DUTY('%s')", name));
        ui.AddContextMenuItem(context, ScpArgMsg("Ban"), string.format("GUILD_BAN('%s')", name));
        local mapName = session.GetMapName();
        if mapName == 'guild_agit_1' then
            ui.AddContextMenuItem(context, ScpArgMsg("GiveGuildLeaderPermission"), string.format("SEND_REQ_GUILD_MASTER('%s')", name));
        end
    end

    if isLeader == 1 then
        local list = session.party.GetPartyMemberList(PARTY_GUILD);
        if list:Count() == 1 then
            ui.AddContextMenuItem(context, ScpArgMsg("Disband"), "ui.Chat('/destroyguild')");
        end
    else
        if aid == myAid then
            ui.AddContextMenuItem(context, ScpArgMsg("GULID_OUT"), "OUT_GUILD()");
        end
    end

    -- add menus by GUILDMATES KAI
    ui.AddContextMenuItem(context, 'キャラクター情報', string.format("OPEN_PARTY_MEMBER_INFO('%s')", name));
    ui.AddContextMenuItem(context, ScpArgMsg("PARTY_INVITE"), string.format("PARTY_INVITE(\"%s\")", name));
    ui.AddContextMenuItem(context, ScpArgMsg("ReqAddFriend"), string.format("friends.RequestRegister('%s')", name));

    ui.AddContextMenuItem(context, ScpArgMsg("WHISPER"), string.format("ui.WhisperTo('%s')", name));
    ui.AddContextMenuItem(context, ScpArgMsg("Cancel"), "None");
    ui.OpenContextMenu(context);
end

function GUILDMATES_KAI_OPEN_PARTY_MEMBER_INFO(targetName)
    g.pcCompareFirstPass = true;
    party.ReqMemberDetailInfo(targetName);
end

function GUILDMATES_KAI_REQUEST_LIKE_STATE(familyName)
    if g.pcCompareFirstPass == true then
        g.pcCompareFirstPass = false;
        return;
    end

    _G['REQUEST_LIKE_STATE_OLD'](familyName);
end