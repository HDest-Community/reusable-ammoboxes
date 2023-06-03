class Legacy_355Box : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.maxPerUnit 72;
		HDMagAmmo.roundType "HDRevolverAmmo";
		HDMagAmmo.roundBulk ENC_355_LOADED;

		tag "$TAG_355_BOX";
		Inventory.pickupMessage "$PICKUP_355_BOX";
		HDPickup.refId LEGACY_HDLD_355BOX;

		ReusableAmmobox.fullSprite "3BOXA0";
		ReusableAmmobox.emptySprite "3BOXW0";
		ReusableAmmobox.roundSprite "3RNDA0";

        ReusableAmmobox.extractSound "boxes/extract/355";
        ReusableAmmobox.insertSound "boxes/insert/355";
	}

	States {
		Spawn:
			3BOX A -1;
			stop;
		spawnempty:
			3BOX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}