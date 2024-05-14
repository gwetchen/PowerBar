-- Reload UI
PowerBar_OnEvent = function(frame, event, arg1)
  local scalex, scaley, unlocked
  PowerBarDBPC = PowerBarDBPC or {}
  scalex = PowerBarDBPC["scalex"] or 1.0
  scaley = PowerBarDBPC["scaley"] or 1.0
  unlocked = PowerBarDBPC["unlocked"] or false
  frame:SetHeight(30*scaley)
  frame:SetWidth(220*scalex)
  frame:EnableMouse(unlocked)
  --[[if UnitPowerType("player") == 1 then
    frame:SetWidth(UnitMana("player")*(PowerBarFrame:GetWidth())/100+1)
    PowerBarFrame_TextFrame_Text:SetText("Rage: "..UnitMana("player"))
    frame:SetBackdropColor(1,0,0)
  end
  if UnitPowerType("player") == 3 then
    frame:SetWidth(UnitMana("player")*(PowerBarFrame:GetWidth())/100+1)
    PowerBarFrame_TextFrame_Text:SetText("Energy: "..UnitMana("player"))
    frame:SetBackdropColor(1,1,0)
  end
  if UnitPowerType("player") == 0 then
    frame:SetWidth((UnitMana("player") / (UnitManaMax("player"))) * 100 * (PowerBarFrame:GetWidth())/100+1)
    PowerBarFrame_TextFrame_Text:SetText("Mana: "..UnitMana("player"))
    frame:SetBackdropColor(0,0,1)
  end]]--
end
PowerBarFill_OnEvent = function(frame, event, arg1)
  if event == "UNIT_RAGE" and UnitIsUnit(arg1,"player") and UnitPowerType("player") == 1 then
    frame:SetWidth(UnitMana("player")*(PowerBarFrame:GetWidth())/100+1)
    PowerBarFrame_TextFrame_Text:SetText("Rage: "..UnitMana("player"))
    frame:SetBackdropColor(1,0,0)
  end
  if event == "UNIT_ENERGY" and UnitIsUnit(arg1,"player") and UnitPowerType("player") == 3 then
    frame:SetWidth(UnitMana("player")*(PowerBarFrame:GetWidth())/100+1)
    PowerBarFrame_TextFrame_Text:SetText("Energy: "..UnitMana("player"))
    frame:SetBackdropColor(1,1,0)
  end
  if event == "UNIT_MANA" and UnitIsUnit(arg1,"player") and UnitPowerType("player") == 0 then
    frame:SetWidth((UnitMana("player") / (UnitManaMax("player"))) * 100 * (PowerBarFrame:GetWidth())/100+1)
    PowerBarFrame_TextFrame_Text:SetText("Mana: "..UnitMana("player"))
    frame:SetBackdropColor(0,0,1)
  end
end
SlashCmdList["RAGETRACKER_COMMAND"] = function(Flag)
	local flag = string.lower(Flag)
  local scalex, scaley, unlocked
	if string.sub(flag,1,6) == "scalex" then
    scalex = tonumber(string.sub(flag,8))
		PowerBarFrame:SetWidth(220 * scalex)
    PowerBarDBPC["scalex"] = scalex
	end
	if string.sub(flag,1,6) == "scaley" then
    scaley = tonumber(string.sub(flag,8))
		PowerBarFrame:SetHeight(30 * scaley)
    PowerBarDBPC["scaley"] = scaley
	end
  if string.sub(flag,1,6) == "lock" then
    if PowerBarFrame:IsMouseEnabled() then
      unlocked = false
      PowerBarDBPC["unlocked"] = unlocked
      PowerBarFrame:EnableMouse(unlocked)
      local message = "PowerBar locked, /pb lock again to unlock"
      if print then print(message) else Print(message) end
    else
      unlocked = true
      PowerBarDBPC["unlocked"] = unlocked
      PowerBarFrame:EnableMouse(unlocked)
      local message = "PowerBar unlocked, Click > drag"
      if print then print(message) else Print(message) end
    end
  end
end
SLASH_RAGETRACKER_COMMAND1 = "/pb";
SLASH_RAGETRACKER_COMMAND2 = "/powerbar"