class Reusable500LightBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.maxPerUnit 40;
		HDMagAmmo.roundType "HD500SWLightAmmo";
		HDMagAmmo.roundBulk ENC_50SW_LOADED;

		tag "$TAG_500_LIGHT_BOX";
		Inventory.pickupMessage "$PICKUP_500_LIGHT_BOX";
		HDPickup.refId HDLD_REUSABLE_500L_BOX;

		ReusableAmmobox.fullSprite "5LBXA0";
		ReusableAmmobox.emptySprite "5LBXW0";
		ReusableAmmobox.roundSprite "SWRNA0";

        ReusableAmmobox.extractSound "boxes/extract/500Light";
        ReusableAmmobox.insertSound "boxes/insert/500Light";
	}

	States {
		Spawn:
			5LBX A -1;
			stop;
		spawnempty:
			5LBX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}