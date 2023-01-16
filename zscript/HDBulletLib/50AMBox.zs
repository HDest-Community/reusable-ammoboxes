class Legacy_50AMBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 65;
		HDMagAmmo.RoundType "HD50AM_Ammo";
		HDMagAmmo.RoundBulk ENC_50AM_LOADED;
		tag "$TAG_50AM_BOX";
//		Inventory.PickupMessage "$PICKUP_50AM_BOX";
		HDPickup.refid LEGACY_HDLD_50AMBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_50AM_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"50AMX0":"50AMV0";
		return magsprite,"G50ZA0","HD50AM_Ammo",0.6;
	}

	// [UZ] HDBulletlib doesn't define this
	// override void GetItemsThatUseThis() {
	// }

	States {
		Spawn:
			50AM X -1;
			stop;
		spawnempty:
			50AM V -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}