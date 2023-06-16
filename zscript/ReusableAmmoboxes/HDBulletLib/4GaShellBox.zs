class Reusable4gaShellBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.insertTime 8;
		HDMagAmmo.extractTime 16;

		HDMagAmmo.maxPerUnit 25;
		HDMagAmmo.roundType "HD4GBAmmo";
		HDMagAmmo.roundBulk ENC_4GBLOADED;

		tag "$TAG_4G_SHELL_BOX";
		Inventory.pickupMessage "$PICKUP_4G_SHELL_BOX";
		HDPickup.refId HDLD_REUSABLE_4GSHELL_BOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "4GBXA0";
		ReusableAmmobox.emptySprite "4GBXW0";
		ReusableAmmobox.roundSprite "4GSIA0";
		
        ReusableAmmobox.extractSound "boxes/extract/4gaShells";
        ReusableAmmobox.insertSound "boxes/insert/4gaShells";
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
