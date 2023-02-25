class Legacy_10mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 100;
		HDMagAmmo.RoundType "HD10mAmmo";
		HDMagAmmo.RoundBulk enc_10_loaded;

		tag "$TAG_10MM_BOX";
		Inventory.PickupMessage "$PICKUP_10MM_BOX";
		HDPickup.refid LEGACY_HDLD_10MMBOX;

		ReusableAmmobox.fullSprite "BX10A0";
		ReusableAmmobox.emptySprite "BX10W0";
		ReusableAmmobox.roundSprite "PR10A0";
	}

	States {
		Spawn:
			BX10 A -1;
			stop;
		spawnempty:
			BX10 W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}