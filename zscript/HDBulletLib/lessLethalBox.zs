class Legacy_LessLethalBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.inserttime 6;
		HDMagAmmo.extracttime 10;

		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDLLShellAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED;

		tag "$TAG_LESSLETHAL_BOX";
		Inventory.PickupMessage "$PICKUP_LESSLETHAL_BOX";
		HDPickup.refid LEGACY_HDLD_LESSLETHALBOX;

		ReusableAmmobox.extractMax 4;
		ReusableAmmobox.fullSprite "LLBXA0";
		ReusableAmmobox.emptySprite "LLBXW0";
		ReusableAmmobox.roundSprite "LLS1A0";
	}

	States {
		Spawn:
			LLBX A -1;
			stop;
		spawnempty:
			LLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}