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

        foreach (weaponName : weaponNames) weapons = weapons..", "..weaponName;

        weapons = weapons.."]";

        return String.format("{ ammoName=%s, weaponNames=%s }", ammoName, weapons);
    }
}



// One handler to rule them all.
class ReusableAmmoboxesSpawner : EventHandler {

    // List of persistent classes to completely ignore.
    // This -should- mean this mod has no performance impact.
    static const string blacklist[] = {
        'HDSmoke',
        'BloodTrail',
        'CheckPuff',
        'WallChunk',
        'HDBulletPuff',
        'HDFireballTail',
        'ReverseImpBallTail',
        'HDSmokeChunk',
        'ShieldSpark',
        'HDFlameRed',
        'HDMasterBlood',
        'PlantBit',
        'HDBulletActor',
        'HDLadderSection'
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
    
    // appends an entry to itemSpawnList;
    void addItem(string name, string boxName, string ammoName, int bundleSize, string bundleSprite, string roundSprite) {

        if (hd_debug) console.printf("Adding Replacement Entry for "..name..": "..boxName);
        
        // Creates a new struct;
        AmmoboxSpawnItem spawnee = AmmoboxSpawnItem(new('AmmoboxSpawnItem'));

        // Populates the struct with relevant information,
        spawnee.spawnName = name;
        spawnee.replaceName = boxName;
        spawnee.ammoName = ammoName;
        spawnee.bundleSize = bundleSize;
        spawnee.bundleSprite = bundleSprite;
        spawnee.roundSprite = roundSprite;

        // Pushes the finished struct to the array.
        itemSpawnList.push(spawnee);
    }

    void addAmmo(string name, Array<string> weapons) {

        if (hd_debug) {
            let msg = "Adding Ammo Association Entry for "..name..": [";

            foreach (weapon : weapons) msg = msg..", "..weapon;

            console.printf(msg.."]");
        }

        // Creates a new struct;
        AmmoboxSpawnAmmo spawnee = AmmoboxSpawnAmmo(new('AmmoboxSpawnAmmo'));
        spawnee.ammoName = name;
        spawnee.weaponNames.copy(weapons);

        // Pushes the finished struct to the array.
        ammoSpawnList.push(spawnee);
    }

    void initCVars() {
        for (let i = 0; i < 1 + HDBulletLibHandler.removedClasses.Size() / 32; ++i) {    
            if (!ammoSpawns[i]) {
                ammoSpawns[i] = CVar.GetCVar("hdblib_enableammo_"..(i + 1));
            }
        }
    }

    // Populates the replacement and association arrays.
    void init() {

        // Init enabled ammo CVARs
        initCVars();

        // --------------------
        // Vanilla Ammoboxes
        // --------------------

        addItem('HD9mBoxPickup',   'Reusable9mmBox',    'HDPistolAmmo',   10, 'TEN9A0', 'PRNDA0');
        addItem('ShellBoxPickup',  'ReusableShellBox',  'HDShellAmmo',    4,  'SHELA0', 'SHL1A0');
        addItem('HD7mBoxPickup',   'Reusable7mmBox',    'SevenMilAmmo',   10, 'TEN7A0', '7RNDA0');
        addItem('HD355BoxPickup',  'Reusable355Box',    'HDRevolverAmmo', 10, 'TEN9A0', 'PRNDA0');
        addItem('RocketBigPickup', 'ReusableRocketBox', 'HDRocketAmmo',   1,  'ROQPA0', 'ROQPA0');
        addItem('RocketBoxPickup', 'ReusableRocketBox', 'HDRocketAmmo',   1,  'ROQPA0', 'ROQPA0');

        // --------------------
        // HDBulletLib Ammoboxes
        // --------------------

        addItem('HD4GBBox',                'Reusable4gaShellBox',       'HD4GBAmmo',            4,  '4GPAA0', '4GSIA0');
        addItem('PB_5mmBoxPickup',         'Reusable5mmBox',            'HD5mm_Ammo',           16, '5MMYA0', '5MMZA0');
        addItem('HD6mmFlechetteBoxPickup', 'Reusable6mmBox',            'HD6mmFlechetteAmmo',   12, 'ACR9I0', 'ACRPI0');
        addItem('HD10mBoxPickup',          'Reusable10mmBox',           'HD10mAmmo',            10, 'T10MA0', 'PR10A0');
        addItem('WAN_20mmGrenadeBox',      'Reusable20mmGrenadeBox',    'WAN_20mmGrenadeAmmo',  1,  'MAG7B0', 'MAG7B0');
        addItem('HD45ACPBoxPickup',        'Reusable45ACPBox',          'HD45ACPAmmo',          10, '45TNA0', '45RNA0');
        addItem('HD45LCBoxPickup',         'Reusable45LCBox',           'HD45LCAmmo',           10, 'TN45A0', 'RN45A0');
        addItem('HDNDMBoxPickup',          'ReusableNDMBox',            'HDNDMLoose',           10, 'TNNDA0', 'NRNDA0');
        addItem('PB_50AMBoxPickup',        'Reusable50AMBox',           'HD50AM_Ammo',          10, 'G50YA0', 'G50ZA0');
        addItem('HD50OMGBoxPickup',        'Reusable50OMGBox',          'HD50OMGAmmo',          10, 'OG10A0', 'OGBLA0');
        addItem('HD069BoreBox',            'Reusable069Box',            'HD069BoreAmmo',        10, '42BTA0', '42BRA0');
        addItem('HDSavage300BoxPickup',    'Reusable300SavageBox',      'Savage300Ammo',        6,  'SVG6A0', '7RNDA0');
        addItem('HD420BoxPickup',          'Reusable420Box',            'HDAurochsAmmo',        10, '42TEA0', '420BA0');
        addItem('HD500SWHeavyBoxPickup',   'Reusable500HeavyBox',       'HD500SWHeavyAmmo',     10, 'TNSWB0', 'SWRNB0');
        addItem('HD500SWLightBoxPickup',   'Reusable500LightBox',       'HD500SWLightAmmo',     10, 'TNSWA0', 'SWRNA0');
        addItem('HD762TokarevBoxPickup',   'Reusable762TokarevBox',     'HD762TokarevAmmo',     10, 'T710A0', 'T762A0');
        addItem('HD3006BoxPickup',         'Reusable3006Box',           'ThirtyAughtSixAmmo',   10, 'TEN7A0', '7RNDA0');
        addItem('BirdshotShellBoxPickup',  'ReusableBirdshotShellBox',  'HDBirdshotShellAmmo',  4,  'BSH4A0', 'BSHLA0');
        addItem('ExplosiveShellBoxPickup', 'ReusableExplosiveShellBox', 'HDExplosiveShellAmmo', 4,  'XLS4A0', 'XLS1A0');
        addItem('FlareShellBoxPickup',     'ReusableFlareBox',          'HDFlareAmmo',          4,  'FLA4A0', 'FLARA0');
        addItem('LLShellBoxPickup',        'ReusableLessLethalBox',     'HDLLShellAmmo',        4,  'LLS4A0', 'LLS1A0');
        addItem('SlugBoxPickup',           'ReusableSlugBox',           'HDSlugAmmo',           4,  'SLUGA0', 'SLG1A0');
    }

    // override void OnRegister() {
    //     SetOrder(HDCONST_HDBLEVENT + 1);
    // }

    override void worldLoaded(WorldEvent e) {
        
        // Populates the main arrays.
        if (!e.IsReOpen) init();
        else initCVars(); // WorldLoaded could be called again when revisiting a map?

        // for (let i = 0; i < HDBulletLibHandler.removedClasses.size(); i++) {
        //     if (!(ammoSpawns[i / 32].GetInt() & (1 << (i % 32)))) {
        //         foreach (itemSpawn : itemSpawnList) {
        //             string ammoName = HDBulletLibHandler.removedClasses[i].getClassName();

        //             if (itemSpawn.ammoName ~== ammoName) {
        //                 if (hd_debug) console.printf("Removing "..itemSpawn.replaceName.." from Backpack Spawn Pool");
                        
        //                 BPSpawnPool.removeItem(itemSpawn.replaceName);
        //             }
        //         }
        //     }
        // }
    }

    override void worldThingSpawned(WorldEvent e) {

        // Populates the main arrays if they haven't been already.
        if (!ammoSpawns[0]) initCVars();

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
        
            // If the thing spawned is an ammobox, add any and all items that can use this.
            let ammobox = ReusableAmmobox(e.thing);
            if (ammobox) handleAmmoUses(ammobox, candidateName);
            
            // If thing spawned is not an instance of HDUPK, quit
            let item = HDUPK(e.thing);
            if (!item) return;

            // If the map just initialized, replace with reusable boxes.
            // Otherwise handle dropping split pickups.
            if (HDCore.isPreSpawn()) {
                handleMapSpawns(item, candidateName);
            } else {
                handleDroppedAmmoboxes(item, candidateName);
            }
        }
    }

    private void handleAmmoBoxLootTable() {
        if (!ammoBoxList) {
            ammoBoxList = HDAmBoxList.Get();

            let handler = HDBulletLibHandler(EventHandler.find('HDBulletLibHandler'));

            // Loop through all the names in the removed classes list.
            for (let i = 0; i < handler.removedClasses.Size(); ++i) {

                // If we find the removed class in the ammoBoxList, remove it
                if (!(ammoSpawns[i / 32].GetInt() & (1 << (i % 32)))) {
                    string ammoName = handler.removedClasses[i].getClassName();

                    foreach (itemSpawn : itemSpawnList) {
                        if (itemSpawn.ammoName ~== ammoName) {

                            // Manually Find class name because case sensitivity...
                            int index = ammoBoxList.invClasses.Size();
                            foreach (invCls : ammoBoxList.invClasses) {
                                if (invCls ~== itemSpawn.replaceName) {
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
        foreach (ammoSpawn : ammoSpawnList) if (candidateName ~== ammoSpawn.ammoName) {
            if (hd_debug) {
                console.printf("Adding the following to the list of items that use "..ammobox.getClassName().."");
                foreach (weapon : ammoSpawn.weaponNames) console.printf("* "..weapon);
            }

            ammobox.itemsThatUseThis.append(ammoSpawn.weaponNames);
        }
    }

    private void handleMapSpawns(HDUPK item, string candidateName) {
        // Iterate through the list of ammo candidates for spawned item.
        foreach (itemSpawn : itemSpawnList) {
            if (itemSpawn.spawnName ~== candidateName) {

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
            if (itemSpawn.spawnName ~== candidateName) {
                let r = Actor.spawn(itemSpawn.ammoName, item.pos);
                let p = HDRoundAmmo(r);

                if (p) {
                    // If we can split the rounds, do so
                    p.amount = item.amount;
                    p.vel = item.vel;

                    p.splitPickupBoxableRound(itemSpawn.bundleSize, -1, candidateName, itemSpawn.bundleSprite, itemSpawn.roundSprite);

                    item.destroy();
                } else {
                    // Otherwise, just replace the box
                    handleMapSpawns(item, candidateName);

                    r.destroy();
                }

                return;
            }
        }
    }
}
