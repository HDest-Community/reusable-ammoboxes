class Legacy_500HeavyBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.maxPerUnit 20;
		HDMagAmmo.roundType "HD500SWHeavyAmmo";
		HDMagAmmo.roundBulk ENC_50SW_LOADED;

		tag "$TAG_500_HEAVY_BOX";
		Inventory.pickupMessage "$PICKUP_500_HEAVY_BOX";
		HDPickup.refId LEGACY_HDLD_500HBOX;

		ReusableAmmobox.fullSprite "5HBXA0";
		ReusableAmmobox.emptySprite "5HBXW0";
		ReusableAmmobox.roundSprite "SWRNB0";

        ReusableAmmobox.extractSound "boxes/extract/500Heavy";
        ReusableAmmobox.insertSound "boxes/insert/500Heavy";
	}

	States {
		Spawn:
			5HBX A -1;
			stop;
		spawnempty:
			5HBX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}