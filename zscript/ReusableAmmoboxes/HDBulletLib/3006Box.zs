class Reusable3006Box : ReusableAmmobox {
	default {
		xscale 0.5;
		yscale 0.4;

		HDMagAmmo.maxPerUnit 40;
		HDMagAmmo.roundBulk ENC_776_LOADED * 1.25;

		tag "$TAG_3006_BOX";
		Inventory.pickupMessage "$PICKUP_3006_BOX";
		HDPickup.refId HDLD_REUSABLE_3006_BOX;

		ReusableAmmobox.fullSprite "M1A1Y0";
		ReusableAmmobox.emptySprite "M1A1W0";
		ReusableAmmobox.roundSprite "7RNDA0";

        ReusableAmmobox.extractSound "boxes/extract/3006";
        ReusableAmmobox.insertSound "boxes/insert/3006";

        ReusableAmmobox.roundClass "ThirtyAughtSixAmmo";
	}

	States {
		Spawn:
			M1A1 Y -1;
			stop;
		spawnempty:
			M1A1 W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}