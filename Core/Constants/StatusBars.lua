local _, addonTable = ...
local addon = addonTable.addon

addonTable.units = {
	player = "player",
	focus = "focus",
	target = "target",
	targetOfTarget = "targetOfTarget"
}

local unitFrames = {}
local statusBars = {}

if addon:IsRetail() == true then
	unitFrames.player = {
		alternatePowerBar = _G.PlayerFrameAlternateManaBar,
		frame = _G.PlayerFrame,
		frameTexture = _G.PlayerFrame.PlayerFrameContainer.FrameTexture,
		healthBar = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer.HealthBar,
		powerBar = _G.PlayerFrameManaBar
	}
	unitFrames.focus = {
		frame = _G.FocusFrame,
		healthBar = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
		reputationColour = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor
	}
	unitFrames.focusTarget = {}
	unitFrames.target = {
		frame = _G.TargetFrame,
		healthBar = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar,
		reputationColour = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor
	}
	unitFrames.targetOfTarget = {
		frame = _G.TargetFrameToT,
		healthBar = _G.TargetFrameToT.HealthBar
	}

	statusBars.player = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer.HealthBar
	statusBars.target = TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar
	statusBars.targetReputation = TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor
	statusBars.focus = FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar
	statusBars.focusReputation = FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor
	statusBars.playertargettarget = TargetFrameToT.HealthBar
	statusBars.alternateManaPower = PlayerFrameAlternateManaBar
	statusBars.power = PlayerFrameManaBar
end

addonTable.unitFrames = unitFrames
addonTable.StatusBars = statusBars
