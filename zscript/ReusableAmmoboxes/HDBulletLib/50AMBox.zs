class Reusable50AMBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.maxPerUnit 65;
        HDMagAmmo.roundBulk ENC_50AM_LOADED;

        tag "$TAG_50AM_BOX";
        Inventory.pickupMessage "$PICKUP_50AM_BOX";
        HDPickup.refId HDLD_REUSABLE_50AM_BOX;

        ReusableAmmobox.fullSprite "50AMX0";
        ReusableAmmobox.emptySprite "50AMV0";
        ReusableAmmobox.roundSprite "G50ZA0";

        ReusableAmmobox.extractSound "boxes/extract/50AM";
        ReusableAmmobox.insertSound "boxes/insert/50AM";

        ReusableAmmobox.roundClass "HD50AM_Ammo";
    }

    States {
        Spawn:
            50AM X -1;
            stop;
        spawnempty:
            50AM V -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable50AMBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable50AMBox";
    }
}
