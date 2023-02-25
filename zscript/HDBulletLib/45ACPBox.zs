class Legacy_45ACPBox : ReusableAmmobox {
	default {
		XScale 0.40;
		YScale 0.40;

		HDMagAmmo.MaxPerUnit 50;
		HDMagAmmo.RoundType "HD45ACPAmmo";
		HDMagAmmo.RoundBulk 0.55;

		tag "$TAG_45ACP_BOX";
		Inventory.PickupMessage "$PICKUP_45ACP_BOX";
		HDPickup.refid LEGACY_HDLD_45ACPBOX;

		ReusableAmmobox.fullSprite "45BXA0";
		ReusableAmmobox.emptySprite "45BXW0";
		ReusableAmmobox.roundSprite "45RNA0";
	}

	States {
		Spawn:
			45BX A -1;
			stop;
		spawnempty:
			45BX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}