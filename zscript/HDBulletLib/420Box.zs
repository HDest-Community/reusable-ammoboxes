class Legacy_420Box : Legacy_AmmoBox {
	default {
		scale 0.5;
		HDMagAmmo.MaxPerUnit 60;
		HDMagAmmo.RoundType "HDAurochsAmmo";
		HDMagAmmo.RoundBulk ENC_420_LOADED;
		tag "$TAG_420_BOX";
//		Inventory.PickupMessage "$PICKUP_420_BOX";
		HDPickup.refid LEGACY_HDLD_420BOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_420_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"420AA0":"420AW0";
		return magsprite,"420BA0","HDAurochsAmmo",0.6;
	}

	States {
		Spawn:
			420A A -1;
			stop;
		spawnempty:
			420A W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}