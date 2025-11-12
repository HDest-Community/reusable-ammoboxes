class Reusable500HeavyBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.maxPerUnit 20;
        HDMagAmmo.roundBulk ENC_50SW_LOADED;

        tag "$TAG_500_HEAVY_BOX";
        Inventory.pickupMessage "$PICKUP_500_HEAVY_BOX";
        HDPickup.refId HDLD_REUSABLE_500H_BOX;

        ReusableAmmobox.fullSprite "5HBXA0";
        ReusableAmmobox.emptySprite "5HBXW0";
        ReusableAmmobox.roundSprite "SWRNB0";

        ReusableAmmobox.extractSound "boxes/extract/500Heavy";
        ReusableAmmobox.insertSound "boxes/insert/500Heavy";

        ReusableAmmobox.roundClass "HD500SWHeavyAmmo";
    }

    States {
        Spawn:
            5HBX A -1;
            stop;
        spawnempty:
            5HBX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable500HeavyBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable500HeavyBox";
    }
}
