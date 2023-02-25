class Legacy_5mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.inserttime 2;
		HDMagAmmo.extracttime 6;

		HDMagAmmo.MaxPerUnit 160;
		HDMagAmmo.RoundType "HD5mm_Ammo";
		HDMagAmmo.RoundBulk ENC_5MM_LOADED;

		tag "$TAG_5MM_BOX";
		Inventory.PickupMessage "$PICKUP_5MM_BOX";
		HDPickup.refid LEGACY_HDLD_5MMBOX;

		ReusableAmmobox.extractMax 16;
		ReusableAmmobox.fullSprite "5MBXA0";
		ReusableAmmobox.emptySprite "5MBXW0";
		ReusableAmmobox.roundSprite "5MMZA0";
	}

	States {
		Spawn:
			5MBX A -1;
			stop;
		spawnempty:
			5MBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}