class Legacy_500LightBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 40;
		HDMagAmmo.RoundType "HD500SWLightAmmo";
		HDMagAmmo.RoundBulk ENC_50SW_LOADED;
		tag "$TAG_500_LIGHT_BOX";
//		Inventory.PickupMessage "$PICKUP_500_LIGHT_BOX";
		HDPickup.refid LEGACY_HDLD_500LBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_500_LIGHT_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"5LBXA0":"5LBXW0";
		return magsprite,"SWRNA0","HD500SWLightAmmo",0.6;
	}

	States {
		Spawn:
			5LBX A -1;
			stop;
		spawnempty:
			5LBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}