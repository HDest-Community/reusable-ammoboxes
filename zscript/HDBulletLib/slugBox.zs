class Legacy_SlugBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDSlugAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED;
		tag "$TAG_SLUG_BOX";
//		Inventory.PickupMessage "$PICKUP_SLUG_BOX";
		HDPickup.refid LEGACY_HDLD_SLUGBOX;

		Legacy_AmmoBox.extractMin 1;
		Legacy_AmmoBox.extractMax 4;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_SLUG_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"SLBXA0":"SLBXW0";
		return magsprite,"SLG1A0","HDSlugAmmo",0.6;
	}

	States {
		Spawn:
			SLBX A -1;
			stop;
		spawnempty:
			SLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}