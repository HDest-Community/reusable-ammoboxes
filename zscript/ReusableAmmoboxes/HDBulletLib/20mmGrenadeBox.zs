class Reusable20mmGrenadeBox : ReusableAmmobox {
	default {
		scale 0.33;

		HDMagAmmo.insertTime 8;
		HDMagAmmo.extractTime 16;

		HDMagAmmo.MagBulk 5;
		HDMagAmmo.maxPerUnit 10;
		HDMagAmmo.roundType "WAN_20mmGrenadeAmmo";
		HDMagAmmo.roundBulk enc_20mmgrenadeloaded;

		tag "$TAG_20MM_BOX";
		Inventory.pickupMessage "$PICKUP_20MM_BOX";
		HDPickup.refId HDLD_REUSABLE_10MM_BOX;

		ReusableAmmobox.fullSprite "BX20A0";
		ReusableAmmobox.emptySprite "BX20W0";
		ReusableAmmobox.roundSprite "MA7GB0";

        ReusableAmmobox.extractSound "boxes/extract/20mm";
        ReusableAmmobox.insertSound "boxes/insert/20mm";
	}

	States {
		Spawn:
			BX20 A -1;
			stop;
		spawnempty:
			BX20 W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}
