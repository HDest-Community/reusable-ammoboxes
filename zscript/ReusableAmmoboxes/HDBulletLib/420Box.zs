class Reusable420Box : ReusableAmmobox {
    default {
        scale 0.5;

        HDMagAmmo.maxPerUnit 60;
        HDMagAmmo.roundBulk ENC_420_LOADED;

        tag "$TAG_420_BOX";
        Inventory.pickupMessage "$PICKUP_420_BOX";
        HDPickup.refId HDLD_REUSABLE_420_BOX;

        ReusableAmmobox.fullSprite "420AA0";
        ReusableAmmobox.emptySprite "420AW0";
        ReusableAmmobox.roundSprite "420BA0";

        ReusableAmmobox.extractSound "boxes/extract/aurochs";
        ReusableAmmobox.insertSound "boxes/insert/aurochs";

        ReusableAmmobox.roundClass "HDAurochsAmmo";
    }

    States {
        Spawn:
            420A A -1;
            stop;
        spawnempty:
            420A W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable420BoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable420Box";
    }
}
