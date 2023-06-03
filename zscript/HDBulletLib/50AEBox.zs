class Reusable50AEBox : ReusableAmmobox {
	default {
		scale 0.32;

		HDMagAmmo.maxPerUnit 50;
		HDMagAmmo.roundType "HD50AEAmmo";
		HDMagAmmo.roundBulk .65;

		tag "$TAG_50AE_BOX";
		Inventory.pickupMessage "$PICKUP_50AE_BOX";
		HDPickup.refId HDLD_REUSABLE_50AE_BOX;

		ReusableAmmobox.fullSprite "50AEX0";
		ReusableAmmobox.emptySprite "50AEW0";
		ReusableAmmobox.roundSprite "PRNDA0";

        ReusableAmmobox.extractSound "boxes/extract/50AE";
        ReusableAmmobox.insertSound "boxes/insert/50AE";
	}

	States {
		Spawn:
			50AE X -1;
			stop;
		spawnempty:
			50AE W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}