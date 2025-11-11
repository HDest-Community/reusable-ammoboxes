class Reusable4mmBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.insertTime 2;
        HDMagAmmo.extractTime 8;

        HDMagAmmo.maxPerUnit 2000;
        HDMagAmmo.roundBulk ENC_426_LOADED * 0.25;
        HDMagAmmo.MagBulk ENC_426MAG_EMPTY * 5;

        tag "$TAG_4MM_BOX";
        Inventory.pickupMessage "$PICKUP_4MM_BOX";
        HDPickup.refId HDLD_REUSABLE_4MM_BOX;

        ReusableAmmobox.fullSprite "4BOXA0";
        ReusableAmmobox.emptySprite "4BOXA0";
        ReusableAmmobox.roundSprite "RBRSBRN";

        ReusableAmmobox.spriteScale 0.5;
        ReusableAmmobox.extractMax 24;

        ReusableAmmobox.extractSound "boxes/extract/4mm";
        ReusableAmmobox.insertSound "boxes/insert/4mm";

        ReusableAmmobox.roundClass "FourMilAmmo";
    }

    States {
        Spawn:
            4BOX A -1;
            stop;
        spawnempty:
            4BOX A -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable4mmBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable4mmBox";
    }
}
