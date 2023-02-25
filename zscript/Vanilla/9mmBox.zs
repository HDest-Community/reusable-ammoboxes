class Legacy_9mmBox : ReusableAmmobox {
	default {
		scale 0.4;

		HDMagAmmo.MaxPerUnit 100;
		HDMagAmmo.RoundType "HDPistolAmmo";
		HDMagAmmo.RoundBulk ENC_9_LOADED;

		tag "$TAG_9MM_BOX";
		Inventory.PickupMessage "$PICKUP_9MM_BOX";
		HDPickup.refid LEGACY_HDLD_9MMBOX;

		ReusableAmmobox.fullSprite "9BOXA0";
		ReusableAmmobox.emptySprite "9BOXW0";
		ReusableAmmobox.roundSprite "PRNDA0";
	}

	override void GetItemsThatUseThis() {
		itemsthatusethis.push("DERPUsable");
		itemsthatusethis.push("DERPDEAD");
		itemsthatusethis.push("HDPistol");
		itemsthatusethis.push("HDRevolver");
		itemsthatusethis.push("HDSMG");
	}

	States {
		Spawn:
			9BOX A -1;
			stop;
		spawnempty:
			9BOX W -1{
				brollsprite=true;brollcenter=true;
				roll=180;
			}stop;
	}
}