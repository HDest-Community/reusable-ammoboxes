class Legacy_355Box : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 72;
		HDMagAmmo.RoundType "HDRevolverAmmo";
		HDMagAmmo.RoundBulk ENC_355_LOADED;
		tag "$TAG_355_BOX";
		Inventory.PickupMessage "Picked up a box of .355 rounds.";
		HDPickup.refid LEGACY_HDLD_355BOX;
	}

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"3BOXA0":"3BOXW0";
		return magsprite,"3RNDA0","HDRevolverAmmo",0.6;
	}

	override void GetItemsThatUseThis(){
		itemsthatusethis.push("HDRevolver");
	}

	States {
		Spawn:
			3BOX A -1;
			stop;
		spawnempty:
			3BOX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}