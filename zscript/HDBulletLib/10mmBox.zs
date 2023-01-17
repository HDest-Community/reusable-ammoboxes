class Legacy_10mmBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 100;
		HDMagAmmo.RoundType "HD10mAmmo";
		HDMagAmmo.RoundBulk enc_10_loaded;
		tag "$TAG_10MM_BOX";
//		Inventory.PickupMessage "$PICKUP_10MM_BOX";
		HDPickup.refid LEGACY_HDLD_10MMBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_10MM_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"BX10A0":"BX10W0";
		return magsprite,"PR10A0","HD10mAmmo",0.6;
	}

	States {
		Spawn:
			BX10 A -1;
			stop;
		spawnempty:
			BX10 W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}