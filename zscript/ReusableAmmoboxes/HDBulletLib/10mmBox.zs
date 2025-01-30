class Reusable10mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.maxPerUnit 100;
		HDMagAmmo.roundBulk enc_10_loaded;

		tag "$TAG_10MM_BOX";
		Inventory.pickupMessage "$PICKUP_10MM_BOX";
		HDPickup.refId HDLD_REUSABLE_10MM_BOX;

		ReusableAmmobox.fullSprite "BX10A0";
		ReusableAmmobox.emptySprite "BX10W0";
		ReusableAmmobox.roundSprite "PR10A0";

        ReusableAmmobox.extractSound "boxes/extract/10mm";
        ReusableAmmobox.insertSound "boxes/insert/10mm";

        ReusableAmmobox.roundClass "HD10mAmmo";
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