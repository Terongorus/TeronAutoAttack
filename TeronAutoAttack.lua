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

-- New function and slash command for Auto Shot
SLASH_AUTOSHOT1 = '/startautoshot'
function SlashCmdList.AUTOSHOT(command)
    for i = 1, 172 do
        local actionName = GetActionText(i);
        if actionName == z then -- Check if the action matches "Auto Shot"
            if not IsCurrentAction(i) then
                UseAction(i); -- Cast "Auto Shot" only if it's not already active
            end
            break;
        end
    end
end