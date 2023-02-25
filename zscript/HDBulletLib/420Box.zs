class Legacy_420Box : ReusableAmmobox {
	default {
		scale 0.5;

		HDMagAmmo.MaxPerUnit 60;
		HDMagAmmo.RoundType "HDAurochsAmmo";
		HDMagAmmo.RoundBulk ENC_420_LOADED;

		tag "$TAG_420_BOX";
		Inventory.PickupMessage "$PICKUP_420_BOX";
		HDPickup.refid LEGACY_HDLD_420BOX;

		ReusableAmmobox.fullSprite "420AA0";
		ReusableAmmobox.emptySprite "420AW0";
		ReusableAmmobox.roundSprite "420BA0";
	}

	States {
		Spawn:
			420A A -1;
			stop;
		spawnempty:
			420A W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}