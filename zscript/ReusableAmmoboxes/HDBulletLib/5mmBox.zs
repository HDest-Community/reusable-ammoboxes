class Reusable5mmBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.insertTime 2;
        HDMagAmmo.extractTime 6;

        HDMagAmmo.maxPerUnit 160;
        HDMagAmmo.roundBulk ENC_5MM_LOADED;

        tag "$TAG_5MM_BOX";
        Inventory.pickupMessage "$PICKUP_5MM_BOX";
        HDPickup.refId HDLD_REUSABLE_5MM_BOX;

        ReusableAmmobox.extractMax 16;
        ReusableAmmobox.fullSprite "5MBXA0";
        ReusableAmmobox.emptySprite "5MBXW0";
        ReusableAmmobox.roundSprite "5MMZA0";
        
        ReusableAmmobox.extractSound "boxes/extract/5mm";
        ReusableAmmobox.insertSound "boxes/insert/5mm";

        ReusableAmmobox.roundClass "HD5mm_Ammo";
    }

    States {
        Spawn:
            5MBX A -1;
            stop;
        spawnempty:
            5MBX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable5mmBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable5mmBox";
    }
}
