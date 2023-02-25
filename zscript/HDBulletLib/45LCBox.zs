class Legacy_45LCBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 50;
		HDMagAmmo.RoundType "HD45LCAmmo";
		HDMagAmmo.RoundBulk ENC_355_LOADED * 2;

		tag "$TAG_45LC_BOX";
		Inventory.PickupMessage "$PICKUP_45LC_BOX";
		HDPickup.refid LEGACY_HDLD_45LCBOX;

		ReusableAmmobox.fullSprite "45LBA0";
		ReusableAmmobox.emptySprite "45LBW0";
		ReusableAmmobox.roundSprite "PR10A0";
	}

	States {
		Spawn:
			45LB A -1;
			stop;
		spawnempty:
			45LB W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}