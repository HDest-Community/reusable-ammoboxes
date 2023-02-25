class Legacy_4gaSlugBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.inserttime 8;
		HDMagAmmo.extracttime 16;

		HDMagAmmo.MaxPerUnit 25;
		HDMagAmmo.RoundType "HD4GSAmmo";
		HDMagAmmo.RoundBulk ENC_4GSLOADED;

		tag "$TAG_4G_SLUG_BOX";
		Inventory.PickupMessage "$PICKUP_4G_SLUG_BOX";
		HDPickup.refid LEGACY_HDLD_4GSLUGBOX;

		ReusableAmmobox.extractMax 2;
		ReusableAmmobox.fullSprite "4GBXA0";
		ReusableAmmobox.emptySprite "4GBXW0";
		ReusableAmmobox.roundSprite "4GSIA0";
	}

	States {
		Spawn:
			4GBX A -1;
			stop;
		spawnempty:
			4GBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}
