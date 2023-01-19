class Legacy_3006Box : ReusableAmmobox {
	default {
		xscale 0.5;
		yscale 0.4;
		HDMagAmmo.MaxPerUnit 40;
		HDMagAmmo.RoundType "ThirtyAughtSixAmmo";
		HDMagAmmo.RoundBulk ENC_776_LOADED * 1.25;
		tag "$TAG_3006_BOX";
//		Inventory.PickupMessage "$PICKUP_3006_BOX";
		HDPickup.refid LEGACY_HDLD_3006BOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_3006_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"M1A1Y0":"M1A1W0";
		return magsprite,"7RNDA0","ThirtyAughtSixAmmo",0.6;
	}

	States {
		Spawn:
			M1A1 Y -1;
			stop;
		spawnempty:
			M1A1 W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}