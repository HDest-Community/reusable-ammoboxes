class Legacy_6mmBox : ReusableAmmobox {
	default {
		scale 0.3;

		HDMagAmmo.inserttime 3;
		HDMagAmmo.extracttime 6;

		HDMagAmmo.MaxPerUnit 100;
		HDMagAmmo.RoundType "HD6mmFlechetteAmmo";
		HDMagAmmo.RoundBulk ENC_6MMFLECHETTE_LOADED;

		tag "$TAG_6MM_BOX";
		Inventory.PickupMessage "$PICKUP_6MM_BOX";
		HDPickup.refid LEGACY_HDLD_6MMFLECHETTEBOX;

		ReusableAmmobox.extractMax 12;
		ReusableAmmobox.fullSprite "ACRPK0";
		ReusableAmmobox.emptySprite "ACRPW0";
		ReusableAmmobox.roundSprite "ACRPI0";
	}

	States {
		Spawn:
			ACRP K -1;
			stop;
		spawnempty:
			ACRP W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}