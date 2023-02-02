class Legacy_500HeavyBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HD500SWHeavyAmmo";
		HDMagAmmo.RoundBulk ENC_50SW_LOADED;

		tag "$TAG_500_HEAVY_BOX";
		Inventory.PickupMessage "$PICKUP_500_HEAVY_BOX";
		HDPickup.refid LEGACY_HDLD_500HBOX;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"5HBXA0":"5HBXW0";
		return magsprite,"SWRNB0","HD500SWHeavyAmmo",0.6;
	}

	States {
		Spawn:
			5HBX A -1;
			stop;
		spawnempty:
			5HBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}