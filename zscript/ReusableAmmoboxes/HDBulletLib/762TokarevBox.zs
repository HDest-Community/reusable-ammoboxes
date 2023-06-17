class Reusable762TokarevBox : ReusableAmmobox {
	default {
		scale 0.3;

		HDMagAmmo.maxPerUnit 40;
		HDMagAmmo.roundType "HD762TokarevAmmo";
		HDMagAmmo.roundBulk ENC_762TOKAREV_LOADED;

		tag "$TAG_762TOKAREV_BOX";
		Inventory.pickupMessage "$PICKUP_762TOKAREV_BOX";
		HDPickup.refId HDLD_REUSABLE_762TOKAREV_BOX;

		ReusableAmmobox.fullSprite "T7BXA0";
		ReusableAmmobox.emptySprite "T7BXW0";
		ReusableAmmobox.roundSprite "T762A0";

        ReusableAmmobox.extractSound "boxes/extract/762Tokarev";
        ReusableAmmobox.insertSound "boxes/insert/762Tokarev";
	}

	States {
		Spawn:
			T7BX A -1;
			stop;
		spawnempty:
			T7BX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}