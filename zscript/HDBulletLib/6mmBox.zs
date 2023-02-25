class Legacy_6mmBox : ReusableAmmobox {
	default {
		scale 0.3;

		HDMagAmmo.insertTime 3;
		HDMagAmmo.extractTime 6;

		HDMagAmmo.maxPerUnit 100;
		HDMagAmmo.roundType "HD6mmFlechetteAmmo";
		HDMagAmmo.roundBulk ENC_6MMFLECHETTE_LOADED;

		tag "$TAG_6MM_BOX";
		Inventory.pickupMessage "$PICKUP_6MM_BOX";
		HDPickup.refId LEGACY_HDLD_6MMFLECHETTEBOX;

		ReusableAmmobox.extractMax 12;
		ReusableAmmobox.fullSprite "ACRPK0";
		ReusableAmmobox.emptySprite "ACRPW0";
		ReusableAmmobox.roundSprite "ACRPI0";
	}

	States {
		Spawn:
			ACRP K -1;
			stop;
		spawnempty:
			ACRP W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}