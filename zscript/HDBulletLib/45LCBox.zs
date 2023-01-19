class Legacy_45LCBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 50;
		HDMagAmmo.RoundType "HD45LCAmmo";
		HDMagAmmo.RoundBulk ENC_355_LOADED * 2;

		tag "$TAG_45LC_BOX";
//		Inventory.PickupMessage "$PICKUP_45LC_BOX";
		HDPickup.refid LEGACY_HDLD_45LCBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_45LC_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"45LBA0":"45LBW0";
		return magsprite,"PR10A0","HD45LCAmmo",0.6;
	}

	States {
		Spawn:
			45LB A -1;
			stop;
		spawnempty:
			45LB W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}