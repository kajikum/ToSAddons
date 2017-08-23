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
end

-- logging
function GUILDMATES_KAI_WRITE_LOG(text)
    local f = io.open("guildmates_kai.log", "a+");
    local time = os.date("*t");
    f:write(("%02d:%02d:%02d: %s\n"):format(time.hour, time.min, time.sec, text));
    f:close();
end

-- Update guild information
function GUILDMATES_KAI_UPDATE_GUILDINFO(frame)
    -- GUILDMATES_KAI
    if frame == nil then
        frame = ui.GetFrame("guild"):GetTopParentFrame();
    end
    -- /GUILDMATES_KAI

    local pcparty = session.party.GetPartyInfo(PARTY_GUILD);
    if pcparty == nil then
        frame:ShowWindow(0);
        return;
    end

    local information = GET_CHILD(frame, "information");
    local properties = GET_CHILD(frame, "properties");

    local isLeader = AM_I_LEADER(PARTY_GUILD);
    local leaderAID = pcparty.info:GetLeaderAID();
    local partyObj = GetIES(pcparty:GetObject());

    local partyname_edit = GET_CHILD_RECURSIVELY(frame, 'partyname_edit')
    local partynote = GET_CHILD_RECURSIVELY(frame, 'partynote')
    local notice_edit = GET_CHILD_RECURSIVELY(frame, 'notice_edit')
    partyname_edit:SetText(pcparty.info.name);
    partynote:SetText(pcparty.info:GetProfile());
    notice_edit:SetText(pcparty.info:GetNotice());

    partyname_edit:EnableHitTest(isLeader);
    partynote:EnableHitTest(isLeader);

    local savememo = GET_CHILD_RECURSIVELY(frame, 'savememo')
    savememo:ShowWindow(isLeader);

    local list = session.party.GetPartyMemberList(PARTY_GUILD);
    local count = list:Count();

    local gbox_member = information:GetChild("gbox_member");
    local gbox_list = gbox_member:GetChild("gbox_list");
    gbox_list:RemoveAllChild();

    local showOnlyConnected = config.GetXMLConfig("Guild_ShowOnlyConnected");

    local connectionCount = 0;
    for i = 0 , count - 1 do
        local partyMemberInfo = list:Element(i);

        if showOnlyConnected == 0 or partyMemberInfo:GetMapID() > 0 then

            local ctrlSet = gbox_list:CreateControlSet("guild_memberinfo", partyMemberInfo:GetAID(), ui.LEFT, ui.TOP, 0, 0, 0, 0);
            ctrlSet:SetUserValue("AID", partyMemberInfo:GetAID());
            local txt_teamname = ctrlSet:GetChild("txt_teamname");
            local txt_duty = ctrlSet:GetChild("txt_duty");
            local txt_location = ctrlSet:GetChild("txt_location");

            -- GUILDMATES_KAI
            local jobIcon = partyMemberInfo:GetIconInfo();
            local jobCls  = GetClassByType("Job", jobIcon.job);
            if nil ~= jobCls then
                txt_teamname:SetTextByKey("value", '{img ' ..  jobCls.Icon .. ' 25 25}' .. partyMemberInfo:GetName() .. " (" .. partyMemberInfo:GetLevel() .. ")");
            else
                txt_teamname:SetTextByKey("value", partyMemberInfo:GetName() .. " (" .. partyMemberInfo:GetLevel() .. ")");
            end
            GUILDMATES_KAI_PARTY_JOB_TOOLTIP(txt_teamname, partyMemberInfo);
            -- /GUILDMATES_KAI

            local grade = partyMemberInfo.grade;
            if leaderAID == partyMemberInfo:GetAID() then
                local dutyName = "{ol}{#FFFF00}" .. ScpArgMsg("GuildMaster") .. "{/}{/}";
                dutyName = dutyName .. " " .. pcparty:GetDutyName(grade);
                txt_duty:SetTextByKey("value", dutyName);
            else
                local dutyName = pcparty:GetDutyName(grade);
                txt_duty:SetTextByKey("value", dutyName);
            end

            local pic_online = GET_CHILD(ctrlSet, "pic_online");
            local locationText = "";
            if partyMemberInfo:GetMapID() > 0 then
                local mapCls = GetClassByType("Map", partyMemberInfo:GetMapID());
                if mapCls ~= nil then
                    locationText = string.format("[%s%d] %s", ScpArgMsg("Channel"), partyMemberInfo:GetChannel() + 1, mapCls.Name);
                    connectionCount = connectionCount + 1;
                end

                pic_online:SetImage("guild_online");
            else
                pic_online:SetImage("guild_offline");
            end

            txt_location:SetTextByKey("value", locationText);
            txt_location:SetTextTooltip(locationText);

            SET_EVENT_SCRIPT_RECURSIVELY(ctrlSet, ui.RBUTTONDOWN, "POPUP_GUILD_MEMBER");
        end
    end

    GBOX_AUTO_ALIGN(gbox_list, 0, 0, 0, true, false);

    local text_memberinfo = gbox_member:GetChild("text_memberinfo");

    local memberStateText = ScpArgMsg("GuildMember{Cur}/{Max}People,OnLine{On}People", "Cur", count, "Max", GUILD_BASIC_MAX_MEMBER + partyObj.AbilLevel_MemberExtend, "On", connectionCount);
    text_memberinfo:SetTextByKey("value", memberStateText);

    local chk_showonlyconnected = GET_CHILD(gbox_member, "chk_showonlyconnected");
    chk_showonlyconnected:SetCheck(showOnlyConnected);

    local chk_agit_enter_onlyguild = GET_CHILD(properties, "chk_agit_enter_onlyguild");
    chk_agit_enter_onlyguild:SetCheck(partyObj.GuildOnlyAgit);

    local existEnemy = GUILD_UPDATE_ENEMY_PARTY(frame, pcparty);
    if existEnemy == 1 then
        frame:RunUpdateScript("UPDATE_REMAIN_GUILD_ENEMY_TIME",20,0,0,1);
    else
        frame:StopUpdateScript("UPDATE_REMAIN_GUILD_ENEMY_TIME");
    end

    ON_GUILD_UPDATE_NEUTRALITY(frame, pcparty);

    GUILD_UPDATE_TOWERINFO(frame, pcparty, partyObj);

    UPDATE_GUILD_EVENT_INFO(frame, pcparty, partyObj);

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

    -- GUILDMATES KAI
    if option.GetCurrentCountry()=="Japanese" then
        ui.AddContextMenuItem(context, 'キャラクター情報', string.format("OPEN_PARTY_MEMBER_INFO('%s')", name));
    else
        ui.AddContextMenuItem(context, 'CharacterInfo', string.format("OPEN_PARTY_MEMBER_INFO('%s')", name));
    end
    ui.AddContextMenuItem(context, ScpArgMsg("PARTY_INVITE"), string.format("PARTY_INVITE(\"%s\")", name));
    ui.AddContextMenuItem(context, ScpArgMsg("ReqAddFriend"), string.format("friends.RequestRegister('%s')", name));
    -- /GUILDMATES_KAI

    ui.AddContextMenuItem(context, ScpArgMsg("WHISPER"), string.format("ui.WhisperTo('%s')", name));
    ui.AddContextMenuItem(context, ScpArgMsg("Cancel"), "None");
    ui.OpenContextMenu(context);
end

-- Tooptip
function GUILDMATES_KAI_PARTY_JOB_TOOLTIP(uiChild, partyMemberInfo)
    local pcInfo = session.otherPC.GetByFamilyName(partyMemberInfo:GetName());
    if pcInfo == nil then
        uiChild:SetTextTooltip(partyMemberInfo:GetName());
        return 0;
    end

    local cid = pcInfo:GetCID();
    if (nil == session.otherPC.GetByStrCID(cid)) or (nil == uiChild) then
        uiChild:SetTextTooltip(partyMemberInfo:GetName());
        return 0;
    end

    local otherPCInfo = session.otherPC.GetByStrCID(cid);

    local jobHistory = otherPCInfo.jobHistory;
    local gender = otherPCInfo:GetIconInfo().gender;
    local clsList, cnt  = GetClassList("Job");

    local nowJobInfo = jobHistory:GetJobHistory(jobHistory:GetJobHistoryCount() - 1);
    local nowJobCls;
    if nil == nowJobInfo then
        nowJobCls = otherPCInfo.JobName;
    else
        nowJobCls = GetClassByTypeFromList(clsList, nowJobInfo.jobID);
    end;

    local jobs = {};
    for i = 0, jobHistory:GetJobHistoryCount() - 1 do
        local jobInfo = jobHistory:GetJobHistory(i);

        if jobs[jobInfo.jobID] == nil then
            jobs[jobInfo.jobID] = jobInfo.grade;
        else
            if jobInfo.grade > jobs[jobInfo.jobID] then
                jobs[jobInfo.jobID] = jobInfo.grade;
            end
        end
    end

    local tooltipText = ("");
    for jobid, grade in pairs(jobs) do
        local cls = GetClassByTypeFromList(clsList, jobid);

        if cls.Name == nowJobCls.Name then
            tooltipText = tooltipText .. ("{@st41_yellow}").. GET_JOB_NAME(cls, gender);
        else
            tooltipText = tooltipText .. ("{@st41}").. GET_JOB_NAME(cls, gender);
        end

        for i = 1 , 3 do
            if i <= grade then
                tooltipText = tooltipText ..('{img star_in_arrow 20 20}');
            else
                tooltipText = tooltipText ..('{img star_out_arrow 20 20}');
            end
        end
        tooltipText = tooltipText ..('{nl}');
    end

    uiChild:SetTextTooltip(tooltipText);
    return 0;
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

acutil.setupHook(GUILDMATES_KAI_POPUP_GUILD_MEMBER, "POPUP_GUILD_MEMBER");
acutil.setupHook(GUILDMATES_KAI_UPDATE_GUILDINFO, "UPDATE_GUILDINFO");
acutil.setupHook(GUILDMATES_KAI_OPEN_PARTY_MEMBER_INFO, "OPEN_PARTY_MEMBER_INFO");
acutil.setupHook(GUILDMATES_KAI_REQUEST_LIKE_STATE, "REQUEST_LIKE_STATE");
