class Reusable45ACPBox : ReusableAmmobox {
    default {
        XScale 0.40;
        YScale 0.40;

        HDMagAmmo.maxPerUnit 50;
        HDMagAmmo.roundBulk 0.55;

        tag "$TAG_45ACP_BOX";
        Inventory.pickupMessage "$PICKUP_45ACP_BOX";
        HDPickup.refId HDLD_REUSABLE_45ACP_BOX;

        ReusableAmmobox.fullSprite "45BXA0";
        ReusableAmmobox.emptySprite "45BXW0";
        ReusableAmmobox.roundSprite "45RNA0";

        ReusableAmmobox.extractSound "boxes/extract/45ACP";
        ReusableAmmobox.insertSound "boxes/insert/45ACP";

        ReusableAmmobox.roundClass "HD45ACPAmmo";
    }

    States {
        Spawn:
            45BX A -1;
            stop;
        spawnempty:
            45BX W -1 { brollsprite = true; brollcenter = true; roll = 180; }
            stop;
    }
}

class Reusable45ACPBoxEmpty : ReusableAmmoboxEmpty {
    default {
        ReusableAmmoboxEmpty.boxClass "Reusable45ACPBox";
    }
}
