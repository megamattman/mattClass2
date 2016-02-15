// This is an Unreal Script
class returnFirePrimary_Effect extends X2Effect_CoveringFire;
//DefaultProperties
//{
	//EffectName = "ReturnFire"
	//DuplicateResponse = eDupe_Ignore
	//AbilityToActivate = "PistolReturnFire"
	//GrantActionPoint = "returnfire"
	//MaxPointsPerTurn = 1
	//bDirectAttackOnly = true
	//bPreEmptiveFire = false
	//bOnlyDuringEnemyTurn = true
//}
defaultproperties
{
	effectname = "ReturnFirePrimary"
	duplicateresponse = edupe_ignore
	abilitytoactivate = "StandardShot"
	grantactionpoint = "returnfire"
	maxpointsperturn = 1
	bdirectattackonly = true
	bpreemptivefire = false
	bonlyduringenemyturn = true
}