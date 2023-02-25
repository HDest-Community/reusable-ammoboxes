class Legacy_50AMBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 65;
		HDMagAmmo.RoundType "HD50AM_Ammo";
		HDMagAmmo.RoundBulk ENC_50AM_LOADED;

		tag "$TAG_50AM_BOX";
		Inventory.PickupMessage "$PICKUP_50AM_BOX";
		HDPickup.refid LEGACY_HDLD_50AMBOX;

		ReusableAmmobox.fullSprite "50AMX0";
		ReusableAmmobox.emptySprite "50AMV0";
		ReusableAmmobox.roundSprite "G50ZA0";
	}

	States {
		Spawn:
			50AM X -1;
			stop;
		spawnempty:
			50AM V -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}