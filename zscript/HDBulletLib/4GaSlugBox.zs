class Legacy_4gaSlugBox : Legacy_AmmoBox {
	default {
		scale 0.1;
		HDMagAmmo.MaxPerUnit 25;
		HDMagAmmo.RoundType "HD4GSAmmo";
		HDMagAmmo.RoundBulk ENC_4GSLOADED;
		tag "$TAG_4G_SLUG_BOX";
//		Inventory.PickupMessage "$PICKUP_4G_SLUG_BOX";
		HDPickup.refid LEGACY_HDLD_4GSLUGBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_4G_SLUG_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"4GBXA0":"4GBXW0";
		return magsprite,"4GSIA0","HD4GSAmmo",0.6;
	}

	// [UZ] HDBulletlib doesn't define this
	// override void GetItemsThatUseThis() {
	// }

	States {
		Spawn:
			4GBX A -1;
			stop;
		spawnempty:
			4GBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}