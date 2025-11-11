class ReusableAmmobox : HDMagAmmo {
	int extractMin;property extractMin:extractMin;
	int extractMax;property extractMax:extractMax;

    string fullSprite;property fullSprite:fullSprite;
    string emptySprite;property emptySprite:emptySprite;
    string roundSprite;property roundSprite:roundSprite;
    double spriteScale;property spriteScale:spriteScale;

    sound insertSound;property insertSound:insertSound;
    sound extractSound;property extractSound:extractSound;

    name roundClass;property roundClass:roundClass;
    bool extractAll;

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

        ReusableAmmobox.roundClass "";
        ReusableAmmobox.insertSound "boxes/insert";
        ReusableAmmobox.extractSound "boxes/extract";

        // Because we're determining the round class once the box is spawned,
        // The Mag Manager needs to always show them.
        // Otherwise the boxes never show up, even if they're valid.
        HDMagAmmo.mustShowInMagmanager true;
	}

    override void BeginPlay() {
        let cls = (class<inventory>)(roundClass);
        if (cls) {
            roundType = cls;
        } else {
            console.PrintF("Unknown Round Type: "..roundClass);
            Destroy();
        }

        super.BeginPlay();
	}

	override void DoEffect() {
		super.DoEffect();

        extractAll = owner && owner.player && owner.player.cmd.buttons&BT_USE;
	}

	// Don't auto-consolidate these like mags
	override void Consolidate() { SyncAmount(); return; }

    // Return the configured box sprite, individual round sprite, and the scale at which to render them
	override string,string,name,double GetMagSprite(int thismagamt) {
		return thismagamt > 0
                ? fullSprite
                : emptySprite,
            roundSprite,
            roundType ? roundType.GetClassName() : roundClass,
            spriteScale;
	}

    void PlayExtractSound() {
        owner.A_StartSound(extractSound, CHAN_WEAPON, CHANF_OVERLAP);
    }

    void PlayInsertSound() {
        owner.A_StartSound(insertSound, CHAN_WEAPON, CHANF_OVERLAP);
    }

	// extract a "handful" of rounds at a time
	override bool Extract() {
        SyncAmount();

        // Grab the current box
        int mindex = mags.size() - 1;

        // If there's no boxes left or we have an empty box, back out early
        if(mags.size() < 1 || mags[mindex] < 1 || owner.A_JumpIfInventory(roundType, 0, "null")) return false;

        // Calculate the number of rounds to extract
        int totake = extractAll ? mags[mindex] : min(random(extractMin, extractMax), mags[mindex]);

        // Give or drop the extracted rounds
        if(totake < HDPickup.MaxGive(owner, roundType, roundbulk)) {
            HDF.Give(owner, roundType, totake);
        } else {
            HDPickup.DropItem(owner,roundType,totake);
        }

        // Play the configured sounds
        PlayExtractSound();

        // Reduce the box by the amount taken and return
        mags[mindex] -= totake;
        return true;
    }

	override bool Insert() {
		SyncAmount();

        // Grab the current box
        int mindex = mags.size() - 1;

        // If there's no boxes left or we have a full box, back out early
		if(mags.size() < 1 || mags[mindex] >= maxperunit || !owner.countinv(roundtype)) return false;

        // Take the inserted rounds
		owner.A_TakeInventory(roundtype, 1, TIF_NOTAKEINFINITE);

        // Play the configured sounds
        PlayInsertSound();

        // Increase the box by the amount taken and return
		mags[mindex]++;
		return true;
	}

    override void loadoutConfigure(string input) {
        let numEmpty = getLoadoutVar(input, 'empty', 3);
		if(numEmpty) {
            SyncAmount();
            for (let i=0; i < min(mags.size(), numEmpty); i++) mags[i] = 0;
        }
    }

    // Taken from HDWeapon, to account for how many boxes should be empty
	int getLoadoutVar(string input,string varname,int maxdigits=int.MAX){
		int varstart=input.indexof(varname);
		if(varstart<0)return -1;
		int digitstart=varstart+varname.length();
		string inp=input.mid(digitstart,maxdigits);
		if(inp=="0")return 0;
		if(inp.indexof("e")>=0)inp=inp.left(inp.indexof("e")); //"123e45"
		if(inp.indexof("x")>=0)inp=inp.left(inp.indexof("x")); //"0xffffff..."
		int inpint=inp.toint();
		if(!inpint)return 1; //var merely mentioned with no number
		return inpint;
	}
}

class ReusableAmmoboxEmpty : IdleDummy abstract {

    name boxClass;property boxClass:boxClass;

    default {
        ReusableAmmoboxEmpty.boxClass "";
    }

    override void BeginPlay() {
        let cls = (class<ReusableAmmobox>)(boxClass);
        if (cls) {
            HDMagAmmo.spawnMag(self, cls, 0);
        } else {
            console.PrintF("Unknown Box Type: "..boxClass);
        }

        Destroy();
	}
}