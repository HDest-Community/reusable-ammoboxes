class Legacy_45ACPBox : ReusableAmmobox {
	default {
		XScale 0.40;
		YScale 0.40;

		HDMagAmmo.maxPerUnit 50;
		HDMagAmmo.roundType "HD45ACPAmmo";
		HDMagAmmo.roundBulk 0.55;

		tag "$TAG_45ACP_BOX";
		Inventory.pickupMessage "$PICKUP_45ACP_BOX";
		HDPickup.refId LEGACY_HDLD_45ACPBOX;

		ReusableAmmobox.fullSprite "45BXA0";
		ReusableAmmobox.emptySprite "45BXW0";
		ReusableAmmobox.roundSprite "45RNA0";
	}

	States {
		Spawn:
			45BX A -1;
			stop;
		spawnempty:
			45BX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
			stop;
	}
}