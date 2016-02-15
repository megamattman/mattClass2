// This is an Unreal Script
class returnFirePrimary extends X2Ability config(GameData_SoldierSkills);

static function array<X2DataTemplate> CreateTemplates() {
	local array<X2DataTemplate> Templates;
	Templates.AddItem(addReturnFirePrimary());
	
	return Templates;
}

static function X2AbilityTemplate addReturnFirePrimary()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_CoveringFire                 CoveringFireEffect;
	local X2Condition_AbilityProperty           CoveringFireCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ReturnFirePrimary');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_returnfire";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

//	//FireEffect = new class'returnFirePrimary_Effect';
//	FireEffect = new class'X2Effect_CoveringFire';
//
	//fireeffect.buildpersistenteffect(1, true, false, false, egamerule_playerturnbegin);
	//fireeffect.setdisplayinfo(eperkbuff_passive, template.locfriendlyname, template.getmylongdescription(), template.iconimage,,,template.abilitysourcename);
	//template.addtargeteffect(fireeffect);
//
	CoveringFireEffect = new class'X2Effect_CoveringFire';
	CoveringFireEffect.AbilityToActivate = 'OverwatchShot';
	CoveringFireEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);

	CoveringFireCondition = new class'X2Condition_AbilityProperty';
	CoveringFireCondition.OwnerHasSoldierAbilities.AddItem('ReturnFirePrimary');
	CoveringFireEffect.TargetConditions.AddItem(CoveringFireCondition);
	Template.AddTargetEffect(CoveringFireEffect);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	Template.bCrossClassEligible = true;       //  this can only work with pistols, which only sharpshooters have

	return Template;
}