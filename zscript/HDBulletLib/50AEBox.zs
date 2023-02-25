class Legacy_50AEBox : ReusableAmmobox {
	default {
		scale 0.32;

		HDMagAmmo.MaxPerUnit 50;
		HDMagAmmo.RoundType "HD50AEAmmo";
		HDMagAmmo.RoundBulk .65;

		tag "$TAG_50AE_BOX";
		Inventory.PickupMessage "$PICKUP_50AE_BOX";
		HDPickup.refid LEGACY_HDLD_50AEBOX;

		ReusableAmmobox.fullSprite "50AEX0";
		ReusableAmmobox.emptySprite "50AEW0";
		ReusableAmmobox.roundSprite "PRNDA0";
	}

	States {
		Spawn:
			50AE X -1;
			stop;
		spawnempty:
			50AE W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}