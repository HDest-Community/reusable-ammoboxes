class Legacy_FlareBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDFlareAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED * .9;
		tag "$TAG_FLARE_BOX";
//		Inventory.PickupMessage "$PICKUP_FLARE_BOX";
		HDPickup.refid LEGACY_HDLD_FLAREBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_FLARE_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"FLBXA0":"FLBXW0";
		return magsprite,"FLARA0","HDFlareAmmo",0.6;
	}

	// [UZ] HDBulletlib doesn't define this
	// override void GetItemsThatUseThis() {
	// }

	States {
		Spawn:
			FLBX A -1;
			stop;
		spawnempty:
			FLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}