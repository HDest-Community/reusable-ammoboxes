class Reusable6mmBox : ReusableAmmobox {
	default {
		scale 0.3;

		HDMagAmmo.insertTime 3;
		HDMagAmmo.extractTime 6;

		HDMagAmmo.maxPerUnit 100;
		HDMagAmmo.roundType "HD6mmFlechetteAmmo";
		HDMagAmmo.roundBulk ENC_6MMFLECHETTE_LOADED;

		tag "$TAG_6MM_BOX";
		Inventory.pickupMessage "$PICKUP_6MM_BOX";
		HDPickup.refId HDLD_REUSABLE_6MMFLECHETTE_BOX;

		ReusableAmmobox.extractMax 12;
		ReusableAmmobox.fullSprite "ACRPK0";
		ReusableAmmobox.emptySprite "ACRPW0";
		ReusableAmmobox.roundSprite "ACRPI0";

        ReusableAmmobox.extractSound "boxes/extract/6mm";
        ReusableAmmobox.insertSound "boxes/insert/6mm";
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