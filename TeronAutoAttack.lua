--AttackTarget - Version 2
local attacking;
local target_change;
local no_combat;
local f = CreateFrame'Frame';

no_combat = PlayerFrame.inCombat;

f:RegisterEvent'PLAYER_ENTER_COMBAT'
f:RegisterEvent'PLAYER_LEAVE_COMBAT'
f:SetScript('OnEvent', function()
    attacking = event == 'PLAYER_ENTER_COMBAT'
    target_change = event == 'PLAYER_TARGET_CHANGED'
end)

SLASH_ATTACK1 = '/startattack'
function SlashCmdList.ATTACK(command)
    if not attacking or target_change or no_combat then
        AttackTarget();
        --TargetNearestEnemy();
        --CastSpellByName'Attack'
    end
end