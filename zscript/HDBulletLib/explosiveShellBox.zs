class Legacy_ExplosiveShellBox : Legacy_AmmoBox {
	default {
		scale 0.4;
		HDMagAmmo.MaxPerUnit 20;
		HDMagAmmo.RoundType "HDExplosiveShellAmmo";
		HDMagAmmo.RoundBulk ENC_SHELLLOADED;
		tag "$TAG_EXPLOSIVE_SHELL_BOX";
//		Inventory.PickupMessage "$PICKUP_EXPLOSIVE_SHELL_BOX";
		HDPickup.refid LEGACY_HDLD_EXPLOSIVESHELLBOX;
	}

	override string pickupmessage() {
	    return Stringtable.Localize("$PICKUP_EXPLOSIVE_SHELL_BOX");
    }

	override string,string,name,double getmagsprite(int thismagamt) {
		string magsprite=(thismagamt>0)?"XLBXA0":"XLBXW0";
		return magsprite,"XLS1A0","HDExplosiveShellAmmo",0.6;
	}

	States {
		Spawn:
			XLBX A -1;
			stop;
		spawnempty:
			XLBX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}