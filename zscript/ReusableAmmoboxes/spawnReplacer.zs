// Struct for itemspawn information.
class AmmoboxSpawnItem play {
    // Name of ammobox to be replaced
    string spawnName;

    // Name of reusable ammobox to replace with
    string replaceName;

    // Name of individual ammunition inside box
    string ammoName;

    // Amount of rounds that get bundled
    int bundleSize;

    // Name of sprite used for "bundled" rounds
    string bundleSprite;

    // Name of sprite used for individual rounds
    string roundSprite;

    string toString() {
        return String.format("{ spawnName=%s, replaceName=%s, ammoName=%s, bundleSize=%i, bundleSprite=%s, roundSprite=%s }", spawnName, replaceName, ammoName, bundleSize, bundleSprite, roundSprite);
    }
}

// Struct for passing useinformation to ammunition.
class AmmoboxSpawnAmmo play {
    // Name of ammo.
    string ammoName;
    
    // List of weapons using that ammo.
    Array<string> weaponNames;

    string toString() {

        let weapons = "[";
        if (weaponNames.size()) {
            weapons = weapons..weaponNames[0];

            foreach (weaponName : weaponNames) weapons = weapons..", "..weaponName;
        }
        weapons = weapons.."]";

        return String.format("{ ammoName=%s, weaponNames=%s }", ammoName, weapons);
    }
}



// One handler to rule them all.
class ReusableAmmoboxesSpawner : EventHandler {

    // List of persistent classes to completely ignore.
    // This -should- mean this mod has no performance impact.
    static const string blacklist[] = {
        "HDSmoke",
        "BloodTrail",
        "CheckPuff",
        "WallChunk",
        "HDBulletPuff",
        "HDFireballTail",
        "ReverseImpBallTail",
        "HDSmokeChunk",
        "ShieldSpark",
        "HDFlameRed",
        "HDMasterBlood",
        "PlantBit",
        "HDBulletActor",
        "HDLadderSection"
    };

    // HDBulletLib Backpack/AmmoBox Enable/Disable Flags
    private transient CVar ammoSpawns[3];

    // Cache of Ammo Box Loot Table
    private HDAmBoxList ammoBoxList;

    // List of weapon-ammo associations.
    // Used for ammo-use association on ammo spawn (happens very often).
    array<AmmoboxSpawnAmmo> ammoSpawnList;

    // List of item-spawn associations.
    // used for item-replacement on mapload.
    array<AmmoboxSpawnItem> itemSpawnList;
    
    bool cvarsAvailable;

    // appends an entry to itemSpawnList;
    void addItem(string name, string boxName, string ammoName, int bundleSize, string bundleSprite, string roundSprite) {

        if (hd_debug) console.printf("Adding Replacement Entry for "..name..": "..boxName);
        
        // Creates a new struct;
        AmmoboxSpawnItem spawnee = AmmoboxSpawnItem(new('AmmoboxSpawnItem'));

        // Populates the struct with relevant information,
        spawnee.spawnName = name.makeLower();
        spawnee.replaceName = boxName.makeLower();
        spawnee.ammoName = ammoName.makeLower();
        spawnee.bundleSize = bundleSize;
        spawnee.bundleSprite = bundleSprite;
        spawnee.roundSprite = roundSprite;

        // Pushes the finished struct to the array.
        itemSpawnList.push(spawnee);
    }

    void addAmmo(string name, Array<string> weapons) {

        // Creates a new struct;
        AmmoboxSpawnAmmo spawnee = AmmoboxSpawnAmmo(new('AmmoboxSpawnAmmo'));
        spawnee.ammoName = name.makeLower();

        // Populates the struct with relevant information,
        foreach (weapon : weapons) spawnee.weaponNames.push(weapon.makeLower());

        // Pushes the finished struct to the array.
        ammoSpawnList.push(spawnee);
    }


    // Populates the replacement and association arrays.
    void init() {

        cvarsAvailable = true;

        // --------------------
        // Ammunition
        // --------------------

        Array<string> wep_9mm;
        wep_9mm.push("BossRifleButIts9mm");
        wep_9mm.push("DERPDEAD");
        wep_9mm.push("DERPUsable");
        wep_9mm.push("HDBoxCannon");
        wep_9mm.push("HDBPX");
        wep_9mm.push("HDBreakerP90");
        wep_9mm.push("HDHLAR");
        wep_9mm.push("HDHorseshoePistol");
        wep_9mm.push("HDPistol");
        wep_9mm.push("HDRevolver");
        wep_9mm.push("HDSMG");
        wep_9mm.push("HDSnubNoseRevolver");
        wep_9mm.push("HDStenMk2");
        wep_9mm.push("HushPuppyPistol");
        wep_9mm.push("MinervaChaingun");
        wep_9mm.push("RIThompson");
        wep_9mm.push("TenMilAutoReloadingThingy");
        addAmmo("Reusable9mmBox", wep_9mm);

        Array<string> wep_355;
        wep_355.push("HDColt355");
        wep_355.push("HDHelzing");
        wep_355.push("HDNyx");
        wep_355.push("HDRevolver");
        wep_355.push("HDScopedRevolver");
        wep_355.push("HDSnubNoseReolver");
        addAmmo("Reusable355Box", wep_355);

        Array<string> wep_shell;
        wep_shell.push("Bossmerg");
        wep_shell.push("DoomHunter");
        wep_shell.push("FireBlooper");
        wep_shell.push("HDAltis");
        wep_shell.push("HDBarracuda");
        wep_shell.push("HDCombatShotgun");
        wep_shell.push("HDGreely");
        wep_shell.push("HDSix12");
        wep_shell.push("HDStreetSweeper");
        wep_shell.push("HDTerminatorSG");
        wep_shell.push("HDUragan5");
        wep_shell.push("Hunter");
        wep_shell.push("MetalFireBlooper");
        wep_shell.push("SawedSlayer");
        wep_shell.push("RIReaper");
        wep_shell.push("RIReaperGL");
        wep_shell.push("RIReaperZM");
        wep_shell.push("ScopedSlayer");
        wep_shell.push("Slayer");
        wep_shell.push("Wan_WSTEM5");
        addAmmo("ReusableShellBox", wep_shell);

        Array<string> wep_7mm;
        wep_7mm.push("AutoReloader");
        wep_7mm.push("BossRifle");
        wep_7mm.push("BossRifleButItsTheWorst");
        wep_7mm.push("HDFrontier");
        wep_7mm.push("HDLotus");
        wep_7mm.push("HD_FNFAL");
        wep_7mm.push("HD_PSG1");
        wep_7mm.push("HDMicrogun");
        wep_7mm.push("IronsLiberatorRifle");
        wep_7mm.push("LiberatorRifle");
        wep_7mm.push("NoScopeBoss");
        wep_7mm.push("ObrozzPistol");
        wep_7mm.push("WAN_MA75B");
        wep_7mm.push("WAN_MA76C");
        addAmmo("Reusable7mmBox", wep_7mm);

        Array<string> wep_rocket;
        wep_rocket.push("Blooper");
        wep_rocket.push("HackedZM66AssaultRifle");
        wep_rocket.push("HDBitch");
        wep_rocket.push("HDChinaLake");
        wep_rocket.push("HDHLAR");
        wep_rocket.push("HDIEDKit");
        wep_rocket.push("HDRL");
        wep_rocket.push("HDTROGRifle");
        wep_rocket.push("IronsLiberatorRifle");
        wep_rocket.push("RIReaperGL");
        addAmmo("ReusableRocketBox", wep_rocket);

        Array<string> wep_4GaShell;
        wep_4GaShell.push("HD4GBBlaster");
        addAmmo("Reusable4GaShellBox", wep_4GaShell);

        Array<string> wep_5mm;
        wep_5mm.push("BossRifleButItsFuckingPink");
        wep_5mm.push("HD_M5165");
        wep_5mm.push("HD_Ruger1022");
        addAmmo("Reusable5mmBox", wep_5mm);

        Array<string> wep_6mm;
        wep_6mm.push("HD_SteyrACR");
        addAmmo("Reusable6mmBox", wep_6mm);

        Array<string> wep_10mm;
        wep_10mm.push("HD10mmPistol");
        wep_10mm.push("HDSigCow");
        wep_10mm.push("TenMilAutoReloadingThingy");
        addAmmo("Reusable10mmBox", wep_10mm);

        Array<string> wep_45ACP;
        wep_45ACP.push("HDMAC10");
        wep_45ACP.push("HDMK23SOCOM");
        wep_45ACP.push("HDUMP");
        wep_45ACP.push("HDUSP");
        wep_45ACP.push("HDColt1911");
        addAmmo("Reusable45ACPBox", wep_45ACP);

        Array<string> wep_45LC;
        wep_45LC.push("HDSingleActionRevolver");
        addAmmo("Reusable45LCBox", wep_45LC);

        Array<string> wep_50AE;
        wep_50AE.push("HDViper");
        addAmmo("Reusable50AEBox", wep_50AE);

        Array<string> wep_50AM;
        wep_50AM.push("HDLeverGun");
        wep_50AM.push("HD_AutoMag");
        addAmmo("Reusable50AMBox", wep_50AM);

        Array<string> wep_50OMG;
        wep_50OMG.push("BogRifle");
        wep_50OMG.push("HDM2HB");
        wep_50OMG.push("HDWyvern");
        wep_50OMG.push("ZM94Rifle");
        addAmmo("Reusable50OMGBox", wep_50OMG);

        Array<string> wep_069;
        wep_069.push("HDAurochs");
        addAmmo("Reusable069Box", wep_069);

        Array<string> wep_420;
        wep_420.push("HDAurochs");
        addAmmo("Reusable420Box", wep_420);

        Array<string> wep_300Savage;
        wep_300Savage.push("");
        addAmmo("Reusable300SavageBox", wep_300Savage);

        Array<string> wep_500Heavy;
        wep_500Heavy.push("HDOtisGun");
        addAmmo("Reusable500HeavyBox", wep_500Heavy);

        Array<string> wep_500Light;
        wep_500Light.push("HDOtisGun");
        addAmmo("Reusable500LightBox", wep_500Light);

        Array<string> wep_762Tokarev;
        wep_762Tokarev.push("");
        addAmmo("Reusable762TokarevBox", wep_762Tokarev);

        Array<string> wep_3006;
        wep_3006.push("M1Garand");
        addAmmo("Reusable3006Box", wep_3006);

        Array<string> wep_birdshotShell;
        wep_birdshotShell.push("");
        addAmmo("ReusableBirdshotShellBox", wep_birdshotShell);

        Array<string> wep_explosiveShell;
        wep_explosiveShell.push("ExplosiveHunter");
        wep_explosiveShell.push("MetalFireBlooper");
        addAmmo("ReusableExplosiveShellBox", wep_explosiveShell);

        Array<string> wep_flare;
        wep_flare.push("FireBlooper");
        wep_flare.push("MetalFireBlooper");
        addAmmo("ReusableFlareBox", wep_flare);

        Array<string> wep_lessLethal;
        wep_lessLethal.push("LLHunter");
        addAmmo("ReusableLessLethalBox", wep_lessLethal);

        Array<string> wep_slug;
        wep_slug.push("HDAltis");
        wep_slug.push("HDAuto5");
        wep_slug.push("HDBarracuda");
        wep_slug.push("HDGreely");
        wep_slug.push("HDPDFour");
        wep_slug.push("HDSix12");
        addAmmo("ReusableSlugBox", wep_slug);

        // --------------------
        // Vanilla Ammoboxes
        // --------------------

        addItem("HD9mBoxPickup",   "Reusable9mmBox",    "HDPistolAmmo",   10, "TEN9A0", "PRNDA0");
        addItem("ShellBoxPickup",  "ReusableShellBox",  "HDShellAmmo",    4,  "SHELA0", "SHL1A0");
        addItem("HD7mBoxPickup",   "Reusable7mmBox",    "SevenMilAmmo",   10, "TEN7A0", "7RNDA0");
        addItem("HD355BoxPickup",  "Reusable355Box",    "HDRevolverAmmo", 10, "TEN9A0", "PRNDA0");
        addItem("RocketBigPickup", "ReusableRocketBox", "HDRocketAmmo",   1,  "ROQPA0", "ROQPA0");

        // --------------------
        // HDBulletLib Ammoboxes
        // --------------------

        addItem("HD4GBBox",                "Reusable4gaShellBox",       "HD4GBAmmo",            4,  "4GPAA0", "4GSIA0");
        addItem("PB_5mmBoxPickup",         "Reusable5mmBox",            "HD5mm_Ammo",           16, "5MMYA0", "5MMZA0");
        addItem("HD6mmFlechetteBoxPickup", "Reusable6mmBox",            "HD6mmFlechetteAmmo",   12, "ACR9I0", "ACRPI0");
        addItem("HD10mBoxPickup",          "Reusable10mmBox",           "HD10mAmmo",            10, "T10MA0", "PR10A0");
        addItem("HD45ACPBoxPickup",        "Reusable45ACPBox",          "HD45ACPAmmo",          10, "45TNA0", "45RNA0");
        addItem("HD45LCBoxPickup",         "Reusable45LCBox",           "HD45LCAmmo",           10, "TN45A0", "RN45A0");
        addItem("HD50AEBoxPickup",         "Reusable50AEBox",           "HD50AEAmmo",           10, "TEN9A0", "PRNDA0");
        addItem("PB_50AMBoxPickup",        "Reusable50AMBox",           "HD50AM_Ammo",          10, "G50YA0", "G50ZA0");
        addItem("HD50OMGBoxPickup",        "Reusable50OMGBox",          "HD50OMGAmmo",          10, "OG10A0", "OGBLA0");
        addItem("HD069BoreBox",            "Reusable069Box",            "HD069BoreAmmo",        10, "42BTA0", "42BRA0");
        addItem("HDSavage300BoxPickup",    "Reusable300SavageBox",      "Savage300Ammo",        6,  "SVG6A0", "7RNDA0");
        addItem("HD420BoxPickup",          "Reusable420Box",            "HDAurochsAmmo",        10, "42TEA0", "420BA0");
        addItem("HD500SWHeavyBoxPickup",   "Reusable500HeavyBox",       "HD500SWHeavyAmmo",     10, "TNSWB0", "SWRNB0");
        addItem("HD500SWLightBoxPickup",   "Reusable500LightBox",       "HD500SWLightAmmo",     10, "TNSWA0", "SWRNA0");
        addItem("HD762TokarevBoxPickup",   "Reusable762TokarevBox",     "HD762TokarevAmmo",     10, "T710A0", "T762A0");
        addItem("HD3006BoxPickup",         "Reusable3006Box",           "ThirtyAughtSixAmmo",   10, "TEN7A0", "7RNDA0");
        addItem("BirdshotShellBoxPickup",  "ReusableBirdshotShellBox",  "HDBirdshotShellAmmo",  4,  "BSH4A0", "BSHLA0");
        addItem("ExplosiveShellBoxPickup", "ReusableExplosiveShellBox", "HDExplosiveShellAmmo", 4,  "XLS4A0", "XLS1A0");
        addItem("FlareShellBoxPickup",     "ReusableFlareBox",          "HDFlareAmmo",          4,  "FLA4A0", "FLARA0");
        addItem("LLShellBoxPickup",        "ReusableLessLethalBox",     "HDLLShellAmmo",        4,  "LLS4A0", "LLS1A0");
        addItem("SlugBoxPickup",           "ReusableSlugBox",           "HDSlugAmmo",           4,  "SLUGA0", "SLG1A0");
    }

    override void OnRegister() {
        SetOrder(HDCONST_HDBLEVENT + 1);
    }

    override void worldLoaded(WorldEvent e) {
        
        // Populates the main arrays if they haven't been already.
        if (!cvarsAvailable) init();

        let handler = HDBulletLibHandler(EventHandler.find("HDBulletLibHandler"));

        for (let i = 0; i < 1 + handler.removedClasses.Size() / 32; ++i) {    
            if (!ammoSpawns[i]) {
                ammoSpawns[i] = CVar.GetCVar("hdblib_enableammo_"..(i + 1));
            }
        }

        for (let i = 0; i < handler.removedClasses.size(); i++) {
            if (!(ammoSpawns[i / 32].GetInt() & (1 << (i % 32)))) {
                foreach (itemSpawn : itemSpawnList) {
                    string ammoName = handler.removedClasses[i].getClassName();
                    ammoName = ammoName.makeLower();

                    if (itemSpawn.ammoName == ammoName) {
                        if (hd_debug) console.printf("Removing "..itemSpawn.replaceName.." from Backpack Spawn Pool");
                        
                        BPSpawnPool.removeItem(itemSpawn.replaceName);
                    }
                }
            }
        }
    }

    override void worldThingSpawned(WorldEvent e) {

        // If thing spawned doesn't exist, quit
        if (!e.thing) return;

        // If thing spawned is blacklisted, quit
        foreach (bl : blacklist) if (e.thing is bl) return;

        // Handle Ammo Box Loot Table
        if (e.thing is 'HDAmBox') {
            // TODO: Determine if this process should just assume to remove all reusable ammoboxes,
            // or just those that are disabled in HDBulletLib
            handleAmmoBoxLootTable();
        } else {
            string candidateName = e.thing.getClassName();
            candidateName = candidateName.makeLower();
        
            // If the thing spawned is an ammobox, add any and all items that can use this.
            let ammobox = ReusableAmmobox(e.thing);
            if (ammobox) handleAmmoUses(ammobox, candidateName);
            
            // If thing spawned is not an instance of HDUPK, quit
            let item = HDUPK(e.thing);
            if (!item) return;

            // If the map just initialized, replace with reusable boxes.
            // Otherwise handle dropping split pickups.
            if (level.mapTime <= 1) {
                handleMapSpawns(item, candidateName);
            } else {
                handleDroppedAmmoboxes(item, candidateName);
            }
        }
    }

    private void handleAmmoBoxLootTable() {
        if (!ammoBoxList) {
            ammoBoxList = HDAmBoxList.Get();

            let handler = HDBulletLibHandler(EventHandler.find("HDBulletLibHandler"));

            // Loop through all the names in the removed classes list.
            for (let i = 0; i < handler.removedClasses.Size(); ++i) {

                // If we find the removed class in the ammoBoxList, remove it
                if (!(ammoSpawns[i / 32].GetInt() & (1 << (i % 32)))) {
                    string ammoName = handler.removedClasses[i].getClassName();
                    ammoName = ammoName.makeLower();

                    foreach (itemSpawn : itemSpawnList) {
                        if (itemSpawn.ammoName == ammoName) {

                            // Manually Find class name because case sensitivity...
                            int index = ammoBoxList.invClasses.Size();
                            foreach (invCls : ammoBoxList.invClasses) {
                                if (invCls.makeLower() == itemSpawn.replaceName) {
                                    index = ammoBoxList.invClasses.find(invCls);
                                    break;
                                }
                            }

                            if (index != ammoBoxList.invClasses.Size()) {
                                if (hd_debug) console.printf("Removing "..itemSpawn.replaceName.." from Ammo Box Loot Table");

                                ammoBoxList.invClasses.Delete(index);
                            }
                        }
                    }
                }
            }
        }
    }

    private void handleAmmoUses(ReusableAmmobox ammobox, string candidateName) {
        foreach (ammoSpawn : ammoSpawnList) if (candidateName == ammoSpawn.ammoName) ammobox.itemsThatUseThis.copy(ammoSpawn.weaponNames);
    }

    private void handleMapSpawns(HDUPK item, string candidateName) {
        // Iterate through the list of ammo candidates for spawned item.
        foreach (itemSpawn : itemSpawnList) {
            if (itemSpawn.spawnName == candidateName) {

                if (Actor.spawn(itemSpawn.replaceName, item.pos)) {
                
                    if (hd_debug) console.printf(item.getClassName().." -> "..itemSpawn.replaceName);

                    item.destroy();

                    return;
                }
            }
        }
    }

    private void handleDroppedAmmoboxes(HDUPK item, string candidateName) {

        // Iterate through the list of ammo candidates for spawned item.
        foreach (itemSpawn : itemSpawnList) {
            if (itemSpawn.spawnName == candidateName) {
                let p = HDRoundAmmo(Actor.spawn(itemSpawn.ammoName, item.pos));

                p.amount = item.amount;
                p.vel = item.vel;

                p.splitPickupBoxableRound(itemSpawn.bundleSize, -1, candidateName, itemSpawn.bundleSprite, itemSpawn.roundSprite);

                item.destroy();

                return;
            }
        }
    }
}
