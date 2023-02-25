class Legacy_FlareBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.inserttime 6;
		HDMagAmmo.extracttime 10;

		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDFlareAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED * .9;

		tag "$TAG_FLARE_BOX";
		Inventory.PickupMessage "$PICKUP_FLARE_BOX";
		HDPickup.refid LEGACY_HDLD_FLAREBOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "FLBXA0";
		ReusableAmmobox.emptySprite "FLBXW0";
		ReusableAmmobox.roundSprite "FLARA0";
	}

	States {
		Spawn:
			FLBX A -1;
			stop;
		spawnempty:
			FLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}