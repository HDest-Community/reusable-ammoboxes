class Legacy_500HeavyBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HD500SWHeavyAmmo";
		HDMagAmmo.RoundBulk ENC_50SW_LOADED;

		tag "$TAG_500_HEAVY_BOX";
		Inventory.PickupMessage "$PICKUP_500_HEAVY_BOX";
		HDPickup.refid LEGACY_HDLD_500HBOX;

		ReusableAmmobox.fullSprite "5HBXA0";
		ReusableAmmobox.emptySprite "5HBXW0";
		ReusableAmmobox.roundSprite "SWRNB0";
	}

	States {
		Spawn:
			5HBX A -1;
			stop;
		spawnempty:
			5HBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}