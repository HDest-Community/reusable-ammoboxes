class Legacy_SlugBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDSlugAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED;
		tag "$TAG_SHELL_BOX";
		Inventory.PickupMessage "Picked up a box of 12ga slugs.";
		HDPickup.refid LEGACY_HDLD_SHELLBOX;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"SLBXA0":"SLBXW0";
		return magsprite,"SLG1A0","HDSlugAmmo",0.6;
	}

	// [UZ] HDBulletlib doesn't define this
	// override void GetItemsThatUseThis() {
		// itemsthatusethis.push("Hunter");
		// itemsthatusethis.push("Slayer");
	// }

	States {
		Spawn:
			SLBX A -1;
			stop;
		spawnempty:
			SLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}