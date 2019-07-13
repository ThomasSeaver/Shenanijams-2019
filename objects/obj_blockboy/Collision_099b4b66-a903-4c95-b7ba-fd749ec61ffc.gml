/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5C7FBF30
/// @DnDArgument : "var" "other.sprite_index"
/// @DnDArgument : "value" "spr_bottle_blue"
if(other.sprite_index == spr_bottle_blue)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2CD1E5C3
	/// @DnDParent : 5C7FBF30
	/// @DnDArgument : "expr" "spr_blockboy_tiny"
	/// @DnDArgument : "var" "sprite_index"
	sprite_index = spr_blockboy_tiny;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 7A889FA8
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0A5741BB
	/// @DnDParent : 7A889FA8
	/// @DnDArgument : "expr" "spr_blockboy_green"
	/// @DnDArgument : "var" "sprite_index"
	sprite_index = spr_blockboy_green;
}

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 1DEB28F1
/// @DnDApplyTo : other
with(other) instance_destroy();