class Legacy_069Box : Legacy_AmmoBox {
	default {
		scale 0.5;
		HDMagAmmo.MaxPerUnit 30;
		HDMagAmmo.RoundType "HD069BoreAmmo";
		HDMagAmmo.RoundBulk ENC_069BORE_LOADED;
		tag "$TAG_069_BOX";
//		Inventory.PickupMessage "$PICKUP_069_BOX";
		HDPickup.refid LEGACY_HDLD_069BOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_069_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"42BXA0":"42BXW0";
		return magsprite,"42BRA0","HD069BoreAmmo",0.6;
	}

	States {
		Spawn:
			42BX A -1;
			stop;
		spawnempty:
			42BX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}