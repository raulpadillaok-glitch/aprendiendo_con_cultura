with(obj_carry_data)
{
	other.level = level;
	other.xp=xp;
	other.xp_requiere = xp_requiere;
	other.damage = damage;
	other.hp_total = hp_total;
	other.hp = hp_total;
	 instance_destroy();
}