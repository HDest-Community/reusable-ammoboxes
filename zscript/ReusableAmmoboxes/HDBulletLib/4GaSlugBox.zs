class Reusable4gaSlugBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.insertTime 8;
		HDMagAmmo.extractTime 16;

		HDMagAmmo.maxPerUnit 25;
		HDMagAmmo.roundBulk ENC_4GSLOADED;

		tag "$TAG_4G_SLUG_BOX";
		Inventory.pickupMessage "$PICKUP_4G_SLUG_BOX";
		HDPickup.refId HDLD_REUSABLE_4GSLUG_BOX;

		ReusableAmmobox.extractMax 2;
		ReusableAmmobox.fullSprite "4GBXA0";
		ReusableAmmobox.emptySprite "4GBXW0";
		ReusableAmmobox.roundSprite "4GS1A0";
		
        ReusableAmmobox.extractSound "boxes/extract/4gaSlugs";
        ReusableAmmobox.insertSound "boxes/insert/4gaSlugs";

        ReusableAmmobox.roundClass "HD4GSAmmo";
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
