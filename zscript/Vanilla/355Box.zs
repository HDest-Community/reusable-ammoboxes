class Legacy_355Box : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 72;
		HDMagAmmo.RoundType "HDRevolverAmmo";
		HDMagAmmo.RoundBulk ENC_355_LOADED;

		tag "$TAG_355_BOX";
		Inventory.PickupMessage "$PICKUP_355_BOX";
		HDPickup.refid LEGACY_HDLD_355BOX;

		ReusableAmmobox.fullSprite "3BOXA0";
		ReusableAmmobox.emptySprite "3BOXW0";
		ReusableAmmobox.roundSprite "3RNDA0";
	}

	override void GetItemsThatUseThis(){
		itemsthatusethis.push("HDRevolver");
	}

	States {
		Spawn:
			3BOX A -1;
			stop;
		spawnempty:
			3BOX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}