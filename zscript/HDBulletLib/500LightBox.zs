class Legacy_500LightBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 40;
		HDMagAmmo.RoundType "HD500SWLightAmmo";
		HDMagAmmo.RoundBulk ENC_50SW_LOADED;

		tag "$TAG_500_LIGHT_BOX";
		Inventory.PickupMessage "$PICKUP_500_LIGHT_BOX";
		HDPickup.refid LEGACY_HDLD_500LBOX;

		ReusableAmmobox.fullSprite "5LBXA0";
		ReusableAmmobox.emptySprite "5LBXW0";
		ReusableAmmobox.roundSprite "SWRNA0";
	}

	States {
		Spawn:
			5LBX A -1;
			stop;
		spawnempty:
			5LBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}