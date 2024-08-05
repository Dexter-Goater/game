extends Sprite2D




func _on_jetpack_buy_pressed():
	if GlobalVar.coin > 0 and GlobalVar.jetpack_lvl < 3:
		GlobalVar.jetpack_lvl += 1
		GlobalVar.coin -= 1
		if GlobalVar.jetpack_lvl == 1:
			$Jetpack_icon.play('Lvl_1')
		elif GlobalVar.jetpack_lvl == 2:
			$Jetpack_icon.play('Lvl_2')
		else:
			$Jetpack_icon.play('Lvl_3')

func _on_gun_buy_pressed():
	if GlobalVar.coin > 0 and GlobalVar.gun_lvl < 3:
		GlobalVar.gun_lvl += 1
		GlobalVar.coin -= 1
		if GlobalVar.gun_lvl == 1:
			$Gun_icon.play('Lvl_1')
		elif GlobalVar.gun_lvl == 2:
			$Gun_icon.play('Lvl_2')
		else:
			$Gun_icon.play('Lvl_3')

func _on_o_2_buy_pressed():
	if GlobalVar.coin > 0 and GlobalVar.O2_lvl < 3:
		GlobalVar.O2_lvl += 1
		GlobalVar.coin -= 1
		if GlobalVar.O2_lvl == 1:
			$O2_icon.play('Lvl_1')
		elif GlobalVar.O2_lvl == 2:
			$O2_icon.play('Lvl_2')
		else:
			$O2_icon.play("Lvl_3")
