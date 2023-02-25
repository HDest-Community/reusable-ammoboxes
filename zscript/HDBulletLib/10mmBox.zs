class Legacy_10mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.maxPerUnit 100;
		HDMagAmmo.roundType "HD10mAmmo";
		HDMagAmmo.roundBulk enc_10_loaded;

		tag "$TAG_10MM_BOX";
		Inventory.pickupMessage "$PICKUP_10MM_BOX";
		HDPickup.refId LEGACY_HDLD_10MMBOX;

		ReusableAmmobox.fullSprite "BX10A0";
		ReusableAmmobox.emptySprite "BX10W0";
		ReusableAmmobox.roundSprite "PR10A0";

        ReusableAmmobox.extractSound "boxes/extract/10mm";
        ReusableAmmobox.insertSound "boxes/insert/10mm";
	}

	States {
		Spawn:
			BX10 A -1;
			stop;
		spawnempty:
			BX10 W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}