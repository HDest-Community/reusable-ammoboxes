class Reusable7mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.maxPerUnit 50;
		HDMagAmmo.roundBulk ENC_776_LOADED;

		tag "$TAG_7MM_BOX";
		Inventory.pickupMessage "$PICKUP_7MM_BOX";
		HDPickup.refId HDLD_REUSABLE_7MM_BOX;

		ReusableAmmobox.fullSprite "7BOXA0";
		ReusableAmmobox.emptySprite "7BOXW0";
		ReusableAmmobox.roundSprite "7RNDA0";

        ReusableAmmobox.extractSound "boxes/extract/7mm";
        ReusableAmmobox.insertSound "boxes/insert/7mm";

        ReusableAmmobox.roundClass "SevenMilAmmo";
	}

	States {
		Spawn:
			7BOX A -1;
			stop;
		spawnempty:
			7BOX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}