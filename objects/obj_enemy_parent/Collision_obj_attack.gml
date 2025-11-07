if(alarm[1]<0)
{
	hp -= other.damage;
	image_blend = c_red;
	kb_x = sing(x-other.x);
	kb_y = sing(y-other.y);
	alarm[1]=20;
}