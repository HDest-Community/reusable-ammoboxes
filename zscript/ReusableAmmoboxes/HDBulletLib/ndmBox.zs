class ReusableNDMBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.maxPerUnit 60;
        HDMagAmmo.roundBulk ENC_9_LOADED; // NDM has the exact same bulk constant as 9mm

        tag "$TAG_9MM_BOX";
        Inventory.pickupMessage "$PICKUP_NDM_BOX";
        HDPickup.refId HDLD_REUSABLE_NDM_BOX;

        ReusableAmmobox.fullSprite "NDMBA0";
        ReusableAmmobox.emptySprite "NDMBW0";
        ReusableAmmobox.roundSprite "NRNDA0";

        ReusableAmmobox.extractSound "boxes/extract/ndm";
        ReusableAmmobox.insertSound "boxes/insert/ndm";

        ReusableAmmobox.roundClass "HDNDMLoose";
    }

    States {
        Spawn:
            NDMB A -1;
            stop;
        spawnempty:
            NDMB W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class ReusableNDMBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "ReusableNDMBox";
    }
}
