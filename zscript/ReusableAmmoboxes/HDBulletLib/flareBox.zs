class ReusableFlareBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.insertTime 6;
        HDMagAmmo.extractTime 10;

        HDMagAmmo.maxPerUnit 20;
        HDMagAmmo.roundBulk ENC_SHELLLOADED * .9;

        tag "$TAG_FLARE_BOX";
        Inventory.pickupMessage "$PICKUP_FLARE_BOX";
        HDPickup.refId HDLD_REUSABLE_FLARE_BOX;

        ReusableAmmobox.extractMax 4;
        ReusableAmmobox.fullSprite "FLBXA0";
        ReusableAmmobox.emptySprite "FLBXW0";
        ReusableAmmobox.roundSprite "FLARA0";

        ReusableAmmobox.extractSound "boxes/extract/flareShells";
        ReusableAmmobox.insertSound "boxes/insert/flareShells";

        ReusableAmmobox.roundClass "HDFlareAmmo";
    }

    States {
        Spawn:
            FLBX A -1;
            stop;
        spawnempty:
            FLBX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class ReusableFlareBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "ReusableFlareBox";
    }
}
