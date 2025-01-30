class Reusable069Box : ReusableAmmobox {
	default {
		scale 0.5;

		HDMagAmmo.maxPerUnit 30;
		HDMagAmmo.roundBulk ENC_069BORE_LOADED;

		tag "$TAG_069_BOX";
		Inventory.pickupMessage "$PICKUP_069_BOX";
		HDPickup.refId HDLD_REUSABLE_069_BOX;

		ReusableAmmobox.fullSprite "42BXA0";
		ReusableAmmobox.emptySprite "42BXW0";
		ReusableAmmobox.roundSprite "42BRA0";

        ReusableAmmobox.extractSound "boxes/extract/069Bore";
        ReusableAmmobox.insertSound "boxes/insert/069Bore";

        ReusableAmmobox.roundClass "HD069BoreAmmo";
	}

	States {
		Spawn:
			42BX A -1;
			stop;
		spawnempty:
			42BX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}