class Legacy_ExplosiveShellBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.inserttime 6;
		HDMagAmmo.extracttime 10;

		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDExplosiveShellAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED;

		tag "$TAG_EXPLOSIVE_SHELL_BOX";
		Inventory.PickupMessage "$PICKUP_EXPLOSIVE_SHELL_BOX";
		HDPickup.refid LEGACY_HDLD_EXPLOSIVESHELLBOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "XLBXA0";
		ReusableAmmobox.emptySprite "XLBXW0";
		ReusableAmmobox.roundSprite "XLS1A0";
	}

	States {
		Spawn:
			XLBX A -1;
			stop;
		spawnempty:
			XLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}