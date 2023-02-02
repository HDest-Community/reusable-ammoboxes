class Legacy_7mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 50;
		HDMagAmmo.RoundType "SevenMilAmmo";
		HDMagAmmo.RoundBulk ENC_776_LOADED;

		tag "$TAG_7MM_BOX";
		Inventory.PickupMessage "$PICKUP_7MM_BOX";
		HDPickup.refid LEGACY_HDLD_7MMBOX;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"7BOXA0":"7BOXW0";
		return magsprite,"7RNDA0","SevenMilAmmo",0.6;
	}

	override void GetItemsThatUseThis(){
		itemsthatusethis.push("LiberatorRifle");
		itemsthatusethis.push("BossRifle");
		itemsthatusethis.push("AutoReloader");
	}

	States {
		Spawn:
			7BOX A -1;
			stop;
		spawnempty:
			7BOX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}