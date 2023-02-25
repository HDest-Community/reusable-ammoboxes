class ReusableAmmobox : HDMagAmmo {
	int extractMin;property extractMin:extractMin;
	int extractMax;property extractMax:extractMax;

    string fullSprite;property fullSprite:fullSprite;
    string emptySprite;property emptySprite:emptySprite;
    string roundSprite;property roundSprite:roundSprite;
    double spriteScale;property spriteScale:spriteScale;

	default {
		HDMagAmmo.insertTime 4;
		HDMagAmmo.extractTime 8;
		HDMagAmmo.MagBulk 2;

		ReusableAmmobox.extractMin 1;
		ReusableAmmobox.extractMax 10;
		ReusableAmmobox.fullSprite "";
		ReusableAmmobox.emptySprite "";
		ReusableAmmobox.roundSprite "";
		ReusableAmmobox.spriteScale 0.6;
	}

	// Don't auto-consolidate these like mags
	override void Consolidate() { SyncAmount(); return; }

    // Return the configured box sprite, individual round sprite, and the scale at which to render them
	override string,string,name,double getmagsprite(int thismagamt) {
		return thismagamt > 0
                ? fullSprite
                : emptySprite,
            roundSprite,
            roundType.GetClassName(),
            spriteScale;
	}

	// extract a "handful" of rounds at a time
	override bool Extract() {
        SyncAmount();

        // Grab the current box
        int mindex = mags.size() - 1;

        // If there's no mags left or we have an empty mag, back out early
        if(mags.size() < 1 || mags[mindex] < 1 || owner.A_JumpIfInventory(roundType, 0, "null")) {
            return false;
        }

        // Calculate the number of rounds to extract
        int totake = min(random(extractMin, extractMax), mags[mindex]);

        // Give or drop the extracted rounds
        if(totake<HDPickup.MaxGive(owner, roundType, roundbulk)) {
            HDF.Give(owner, roundType, totake);
        } else {
            HDPickup.DropItem(owner,roundType,totake);
        }

        // Play the proper sounds
        // TODO: register new sounds, default to these
        owner.A_StartSound("weapons/rifleclick2",CHAN_WEAPON);
        owner.A_StartSound("weapons/rockreload",CHAN_WEAPON,CHANF_OVERLAP,0.4);

        // Reduce the magazine by the amount taken and return
        mags[mindex] -= totake;
        return true;
    }
}