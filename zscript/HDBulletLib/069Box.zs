class Legacy_069Box : ReusableAmmobox {
	default {
		scale 0.5;

		HDMagAmmo.MaxPerUnit 30;
		HDMagAmmo.RoundType "HD069BoreAmmo";
		HDMagAmmo.RoundBulk ENC_069BORE_LOADED;

		tag "$TAG_069_BOX";
		Inventory.PickupMessage "$PICKUP_069_BOX";
		HDPickup.refid LEGACY_HDLD_069BOX;

		ReusableAmmobox.fullSprite "42BXA0";
		ReusableAmmobox.emptySprite "42BXW0";
		ReusableAmmobox.roundSprite "42BRA0";
	}

	States {
		Spawn:
			42BX A -1;
			stop;
		spawnempty:
			42BX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}