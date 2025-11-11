class Reusable355Box : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.maxPerUnit 72;
        HDMagAmmo.roundBulk ENC_355_LOADED;

        tag "$TAG_355_BOX";
        Inventory.pickupMessage "$PICKUP_355_BOX";
        HDPickup.refId HDLD_REUSABLE_355_BOX;

        ReusableAmmobox.fullSprite "3BOXA0";
        ReusableAmmobox.emptySprite "3BOXW0";
        ReusableAmmobox.roundSprite "3RNDA0";

        ReusableAmmobox.extractSound "boxes/extract/355";
        ReusableAmmobox.insertSound "boxes/insert/355";

        ReusableAmmobox.roundClass "HDRevolverAmmo";
    }

    States {
        Spawn:
            3BOX A -1;
            stop;
        spawnempty:
            3BOX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable355BoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable355Box";
    }
}
