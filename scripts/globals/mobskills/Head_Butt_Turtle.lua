---------------------------------------------------
-- Head Butt (Adamantoise)
-- Deals damage to single target. Additional effects: Accuracy Down and large knockback
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 3;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);

	-- Large Knockdown ----------------------------

	local typeEffect = EFFECT_ACCURACY_DOWN;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 50, 0, 120);

	target:delHP(dmg);
	return dmg;
end;
