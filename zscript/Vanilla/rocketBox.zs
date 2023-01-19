class Legacy_RocketBox : ReusableAmmobox {
	default {
		scale 0.6;

		HDMagAmmo.inserttime 8;
		HDMagAmmo.extracttime 16;

		HDMagAmmo.MagBulk 5;
		HDMagAmmo.MaxPerUnit 5;
		HDMagAmmo.RoundType "HDRocketAmmo";
		HDMagAmmo.RoundBulk ENC_ROCKETLOADED*1.25;

		tag "$TAG_RPG_BOX";
//		Inventory.PickupMessage "$PICKUP_RPG_BOX";
		HDPickup.refid LEGACY_HDLD_RKTBOX;

		ReusableAmmobox.extractMax 1;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_RPG_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"RBOXA0":"RBOXW0";
		return magsprite,"ROQPA0","HDRocketAmmo",0.6;
	}

	override void GetItemsThatUseThis(){
		itemsthatusethis.push("HDRL");
		itemsthatusethis.push("Blooper");
		itemsthatusethis.push("HDIEDKit");
	}

	override bool IsUsed(){
		if(!owner)return true;
		for(int i=0;i<itemsthatusethis.size();i++){
			if(owner.countinv(itemsthatusethis[i]))return true;
		}
		let zzz=HDWeapon(owner.findinventory("ZM66AssaultRifle"));
		if(zzz&&!(zzz.weaponstatus[0]&ZM66F_NOLAUNCHER))return true;
		let lll=HDWeapon(owner.findinventory("LiberatorRifle"));
		if(lll&&!(lll.weaponstatus[0]&LIBF_NOLAUNCHER))return true;
		return false;
	}


	States {
		Spawn:
			RBOX A -1;
			stop;
		spawnempty:
			RBOX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}