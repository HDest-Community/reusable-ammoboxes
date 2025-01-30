class ReusableShellBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.insertTime 6;
		HDMagAmmo.extractTime 10;

		HDMagAmmo.maxPerUnit 20;
		HDMagAmmo.roundBulk ENC_SHELLLOADED;

		tag "$TAG_SHELL_BOX";
		Inventory.pickupMessage "$PICKUP_SHELL_BOX";
		HDPickup.refId HDLD_REUSABLE_SHELL_BOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "SBOXA0";
		ReusableAmmobox.emptySprite "SBOXW0";
		ReusableAmmobox.roundSprite "SHL1A0";

        ReusableAmmobox.extractSound "boxes/extract/12gShells";
        ReusableAmmobox.insertSound "boxes/insert/12gShells";

        ReusableAmmobox.roundClass "HDShellAmmo";
	}

	States {
		Spawn:
			SBOX A -1;
			stop;
		spawnempty:
			SBOX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}
