class Legacy_50OMGBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HD50OMGAmmo";
		HDMagAmmo.RoundBulk ENC_50OMG_LOADED;

		tag "$TAG_50OMG_BOX";
		Inventory.PickupMessage "$PICKUP_50OMG_BOX";
		HDPickup.refid LEGACY_HDLD_50OMGBOX;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"OGBXA0":"OGBXW0";
		return magsprite,"OGBLA0","HD50OMGAmmo",0.6;
	}

	States {
		Spawn:
			OGBX A -1;
			stop;
		spawnempty:
			OGBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}