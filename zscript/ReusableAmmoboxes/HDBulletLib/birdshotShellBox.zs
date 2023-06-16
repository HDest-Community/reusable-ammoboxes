class ReusableBirdshotShellBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.insertTime 6;
		HDMagAmmo.extractTime 10;

		HDMagAmmo.maxPerUnit 20;
		HDMagAmmo.roundType "HDBirdshotShellAmmo";
		HDMagAmmo.roundBulk ENC_SHELLLOADED;

		tag "$TAG_BIRDSHOT_BOX";
		Inventory.pickupMessage "$PICKUP_BIRDSHOT_BOX";
		HDPickup.refId HDLD_REUSABLE_BIRDSHOT_BOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "BBOXA0";
		ReusableAmmobox.emptySprite "BBOXW0";
		ReusableAmmobox.roundSprite "BSHLA0";

        ReusableAmmobox.extractSound "boxes/extract/birdshotShells";
        ReusableAmmobox.insertSound "boxes/insert/birdshotShells";
	}

	States {
		Spawn:
			BBOX A -1;
			stop;
		spawnempty:
			BBOX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}