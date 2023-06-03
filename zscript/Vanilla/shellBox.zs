class Legacy_ShellBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.insertTime 6;
		HDMagAmmo.extractTime 10;

		HDMagAmmo.maxPerUnit 20;
		HDMagAmmo.roundType "HDShellAmmo";
		HDMagAmmo.roundBulk ENC_SHELLLOADED;

		tag "$TAG_SHELL_BOX";
		Inventory.pickupMessage "$PICKUP_SHELL_BOX";
		translation "160:167=80:105";
		HDPickup.refId LEGACY_HDLD_SHELLBOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "SBOXA0";
		ReusableAmmobox.emptySprite "SBOXW0";
		ReusableAmmobox.roundSprite "SHL1A0";

        ReusableAmmobox.extractSound "boxes/extract/12gShells";
        ReusableAmmobox.insertSound "boxes/insert/12gShells";
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
