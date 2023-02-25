class Legacy_RocketBox : ReusableAmmobox {
	default {
		scale 0.6;

		HDMagAmmo.insertTime 8;
		HDMagAmmo.extractTime 16;

		HDMagAmmo.MagBulk 5;
		HDMagAmmo.maxPerUnit 5;
		HDMagAmmo.roundType "HDRocketAmmo";
		HDMagAmmo.roundBulk ENC_ROCKETLOADED*1.25;

		tag "$TAG_RPG_BOX";
		Inventory.pickupMessage "$PICKUP_RPG_BOX";
		HDPickup.refId LEGACY_HDLD_RKTBOX;

		ReusableAmmobox.extractMax 1;
		ReusableAmmobox.fullSprite "RBOXA0";
		ReusableAmmobox.emptySprite "RBOXW0";
		ReusableAmmobox.roundSprite "ROQPA0";
	}

	override void GetItemsThatUseThis(){
		itemsthatusethis.push("HDRL");
		itemsthatusethis.push("Blooper");
		itemsthatusethis.push("HDIEDKit");
	}

	override bool IsUsed(){
		if(!owner) return true;

		// Check for all configured items that use this
		for(int i = 0;i < itemsthatusethis.size(); i++) {
			if(owner.countinv(itemsthatusethis[i])) return true;
		}
		
		// Check for ZM66 w/ GL
		let zzz = HDWeapon(owner.findinventory("ZM66AssaultRifle"));
		if(zzz && !(zzz.weaponstatus[0] & ZM66F_NOLAUNCHER)) return true;
		
		// Check for Liberator w/ GL
		let lll = HDWeapon(owner.findinventory("LiberatorRifle"));
		if(lll && !(lll.weaponstatus[0] & LIBF_NOLAUNCHER)) return true;
		
		return false;
	}


	States {
		Spawn:
			RBOX A -1;
			stop;
		spawnempty:
			RBOX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}