class Reusable45LCBox : ReusableAmmobox {
    default {
        scale 0.4;

        HDMagAmmo.maxPerUnit 50;
        HDMagAmmo.roundBulk ENC_355_LOADED * 2;

        tag "$TAG_45LC_BOX";
        Inventory.pickupMessage "$PICKUP_45LC_BOX";
        HDPickup.refId HDLD_REUSABLE_45LC_BOX;

        ReusableAmmobox.fullSprite "45LBA0";
        ReusableAmmobox.emptySprite "45LBW0";
        ReusableAmmobox.roundSprite "PR10A0";

        ReusableAmmobox.extractSound "boxes/extract/45LC";
        ReusableAmmobox.insertSound "boxes/insert/45LC";

        ReusableAmmobox.roundClass "HD45LCAmmo";
    }

    States {
        Spawn:
            45LB A -1;
            stop;
        spawnempty:
            45LB W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable45LCBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable45LCBox";
    }
}
