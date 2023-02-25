class Legacy_4gaSlugBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.insertTime 8;
		HDMagAmmo.extractTime 16;

		HDMagAmmo.maxPerUnit 25;
		HDMagAmmo.roundType "HD4GSAmmo";
		HDMagAmmo.roundBulk ENC_4GSLOADED;

		tag "$TAG_4G_SLUG_BOX";
		Inventory.pickupMessage "$PICKUP_4G_SLUG_BOX";
		HDPickup.refId LEGACY_HDLD_4GSLUGBOX;

		ReusableAmmobox.extractMax 2;
		ReusableAmmobox.fullSprite "4GBXA0";
		ReusableAmmobox.emptySprite "4GBXW0";
		ReusableAmmobox.roundSprite "4GSIA0";
	}

	States {
		Spawn:
			4GBX A -1;
			stop;
		spawnempty:
			4GBX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}
