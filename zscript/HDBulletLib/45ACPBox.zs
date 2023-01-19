class Legacy_45ACPBox : ReusableAmmobox {
	default {
		XScale 0.30;
		YScale 0.40;
		HDMagAmmo.MaxPerUnit 50;
		HDMagAmmo.RoundType "HD45ACPAmmo";
		HDMagAmmo.RoundBulk 0.55;
		tag "$TAG_45ACP_BOX";
//		Inventory.PickupMessage "$PICKUP_45ACP_BOX";
		HDPickup.refid LEGACY_HDLD_45ACPBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_45ACP_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"45BXA0":"45BXW0";
		return magsprite,"45RNA0","HD45ACPAmmo",0.6;
	}

	States {
		Spawn:
			45BX A -1;
			stop;
		spawnempty:
			45BX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}