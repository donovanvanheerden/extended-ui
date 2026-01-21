local addonName, addonTable = ...
local addon = addonTable.addon

local AceConfig = _G.LibStub("AceConfig-3.0")
local AceConfigDialog = _G.LibStub("AceConfigDialog-3.0")
local AceDbOptions = _G.LibStub("AceDBOptions-3.0")

SLASH_Addon1 = "eui"
SLASH_ReloadUI = "rl"

addonTable.SlashCmd = {}

function addon:RegisterEvents()
	self:RegisterEvent("PLAYER_LOGIN")
	self:RegisterEvent("ADDON_LOADED")
end

function addon:RegisterCommands()
	SlashCmdList["ExtendedUI"] = addonTable.SlashCmd.OpenOptions
	SLASH_ExtendedUI1 = "/eui"

	SlashCmdList["ReloadUI"] = addonTable.SlashCmd.ReloadUI
	SLASH_ReloadUI1 = "/rl"

	-- self:RegisterChatCommand(SLASH_Addon1, "SlashCommand")
	-- self:RegisterChatCommand(SLASH_ReloadUI, "ReloadUI")
end

function addonTable.SlashCmd.ReloadUI(message, editBox)
	ConsoleExec("reloadui")
end

function addonTable.SlashCmd.OpenOptions(input)
	if InCombatLockdown() then
		self:Print("Cannot access options during combat.")
		return
	end

	if input == "debug" then
		self.db.debug = not self.db.debug
		self:Print("debug: " .. (self.db.debug and "on" or "off"))
	elseif input:trim() == "" then
		AceConfigDialog:Open(addonName)
	end
end

function addon:PLAYER_LOGIN()
	-- self:ApplyFont()
	self:ApplyStatusBarColors()
	self:ToggleHitIndicator()

	-- self:SecureHook("FCF_SetChatWindowFontSize", "FontSizeChanged")
end

function addon:ADDON_LOADED()
	-- self:ApplyFont()
end
