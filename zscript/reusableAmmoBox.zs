class ReusableAmmobox : HDMagAmmo {
	int extractMin;property extractMin:extractMin;
	int extractMax;property extractMax:extractMax;

	default {
		HDMagAmmo.inserttime 4;
		HDMagAmmo.extracttime 8;
		HDMagAmmo.MagBulk 2;

		ReusableAmmobox.extractMin 1;
		ReusableAmmobox.extractMax 10;
	}

	// Don't auto-consolidate these like mags
	override void Consolidate() { SyncAmount(); return; }

	// extract a "handful" of rounds at a time
	override bool Extract() {
        SyncAmount();

        // Grab the current box
        int mindex=mags.size()-1;

        // If there's no mags left or we have an empty mag, back out early
        if(mags.size() < 1 || mags[mindex] < 1 || owner.A_JumpIfInventory(roundtype,0,"null")) {
            return false;
        }

        // Calculate the number of rounds to extract
        int totake=min(random(extractMin,extractMax),mags[mindex]);

        // Give or drop the extracted rounds
        if(totake<HDPickup.MaxGive(owner,roundtype,roundbulk)) {
            HDF.Give(owner,roundtype,totake);
        } else {
            HDPickup.DropItem(owner,roundtype,totake);
        }

        // Play the proper sounds
        // TODO: register new sounds, default to these
        owner.A_StartSound("weapons/rifleclick2",CHAN_WEAPON);
        owner.A_StartSound("weapons/rockreload",CHAN_WEAPON,CHANF_OVERLAP,0.4);

        // Reduce the magazine by the amount taken and return
        mags[mindex]-=totake;
        return true;
    }
}