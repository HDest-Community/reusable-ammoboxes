class Reusable300SavageBox : ReusableAmmobox {
	default {
		scale 0.3;

		HDMagAmmo.maxPerUnit 48;
		HDMagAmmo.roundType "Savage300Ammo";
		HDMagAmmo.roundBulk ENC_776_LOADED;

		tag "$TAG_300SAVAGE_BOX";
		Inventory.pickupMessage "$PICKUP_300SAVAGE_BOX";
		HDPickup.refId HDLD_REUSABLE_300SAVAGE_BOX;

		ReusableAmmobox.fullSprite "S3BXA0";
		ReusableAmmobox.emptySprite "S3BXW0";
		ReusableAmmobox.roundSprite "7RNDA0";

        ReusableAmmobox.extractSound "boxes/extract/300Savage";
        ReusableAmmobox.insertSound "boxes/insert/300Savage";
	}

	States {
		Spawn:
			S3BX A -1;
			stop;
		spawnempty:
			S3BX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}