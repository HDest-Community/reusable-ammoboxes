class Legacy_ExplosiveShellBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDExplosiveShellAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED;
		tag "$TAG_EXPLOSIVE_SHELL_BOX";
		Inventory.PickupMessage "Picked up a box of 12ga explosive shells.";
		HDPickup.refid LEGACY_HDLD_EXPLOSIVESHELLBOX;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"XLBXA0":"XLBXW0";
		return magsprite,"XLS1A0","HDExplosiveShellAmmo",0.6;
	}

	// [UZ] HDBulletlib doesn't define this
	// override void GetItemsThatUseThis() {
		// itemsthatusethis.push("Hunter");
		// itemsthatusethis.push("Slayer");
	// }

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