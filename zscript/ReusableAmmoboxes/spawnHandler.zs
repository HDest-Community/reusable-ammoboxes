// Struct for itemspawn information.
class AmmoboxSpawnItem play {

    // Name of ammobox to be replaced
    name spawnName;

    // Name of reusable ammobox to replace with
    name replaceName;

    // Name of individual ammunition inside box
    name ammoName;

    // Amount of rounds that get bundled
    int bundleSize;

    // Name of sprite used for "bundled" rounds
    string bundleSprite;

    // Name of sprite used for individual rounds
    string roundSprite;

    static AmmoboxSpawnItem create(name name, name boxName, name ammoName, int bundleSize, string bundleSprite, string roundSprite) {

        let spawnee = AmmoboxSpawnItem(new('AmmoboxSpawnItem'));

        // Populates the struct with relevant information,
        if (spawnee) {
            spawnee.spawnName    = name;
            spawnee.replaceName  = boxName;
            spawnee.ammoName     = ammoName;
            spawnee.bundleSize   = bundleSize;
            spawnee.bundleSprite = bundleSprite;
            spawnee.roundSprite  = roundSprite;
        }

        return spawnee;
    }

    string toString() {
        return String.format("{ spawnName=%s, replaceName=%s, ammoName=%s, bundleSize=%i, bundleSprite=%s, roundSprite=%s }",
                                spawnName,    replaceName,    ammoName,    bundleSize,    bundleSprite,    roundSprite);
    }
}

// One handler to rule them all.
class ReusableAmmoboxesSpawnHandler : EventHandler {

    // List of persistent classes to completely ignore.
    Array<name> thingBlacklist;

    // List of item-spawn associations.
    // used for item-replacement on mapload.
    Array<AmmoboxSpawnItem> itemSpawnList;

    // appends an entry to itemSpawnList;
    void addItem(name name, name boxName, name ammoName, int bundleSize, string bundleSprite, string roundSprite) {
        
        // Creates a new struct;
        let spawnee = AmmoboxSpawnItem.create(name, boxName, ammoName, bundleSize, bundleSprite, roundSprite);

        // Pushes the finished struct to the array.
        if (spawnee) {
            HDCore.log('ReusableAmmoboxes.SpawnHandler', LOGGING_DEBUG, "Adding Replacement Entry for "..name..": "..spawnee.toString());

            itemSpawnList.push(spawnee);
        }
    }

    // Populates the replacement and association arrays.
    void init() {

        // Pull in the HDCoreLib Spawn Handler Thing Blacklist
        thingBlacklist.copy(HDCoreSpawnHandler(StaticEventHandler.find('HDCoreSpawnHandler')).thingBlacklist);

        // --------------------
        // Vanilla Ammoboxes
        // --------------------

        addItem('HD9mBoxPickup',           'Reusable9mmBox',            'HDPistolAmmo',         10, "TEN9A0", "PRNDA0");
        addItem('ShellBoxPickup',          'ReusableShellBox',          'HDShellAmmo',           4, "SHELA0", "SHL1A0");
        addItem('HD7mBoxPickup',           'Reusable7mmBox',            'SevenMilAmmo',         10, "TEN7A0", "7RNDA0");
        addItem('HD355BoxPickup',          'Reusable355Box',            'HDRevolverAmmo',       10, "TEN9A0", "PRNDA0");
        addItem('RocketBigPickup',         'ReusableRocketBox',         'HDRocketAmmo',          1, "ROQPA0", "ROQPA0");
        addItem('RocketBoxPickup',         'ReusableRocketBox',         'HDRocketAmmo',          1, "ROQPA0", "ROQPA0");

        // --------------------
        // HDBulletLib Ammoboxes
        // --------------------

        addItem('HD4GBBox',                'Reusable4gaShellBox',       'HD4GBAmmo',             4, "4GPAA0", "4GSIA0");
        addItem('PB_5mmBoxPickup',         'Reusable5mmBox',            'HD5mm_Ammo',           16, "5MMYA0", "5MMZA0");
        addItem('HD6mmFlechetteBoxPickup', 'Reusable6mmBox',            'HD6mmFlechetteAmmo',   12, "ACR9I0", "ACRPI0");
        addItem('HD10mBoxPickup',          'Reusable10mmBox',           'HD10mAmmo',            10, "T10MA0", "PR10A0");
        addItem('WAN_20mmGrenadeBox',      'Reusable20mmGrenadeBox',    'WAN_20mmGrenadeAmmo',   1, "MAG7B0", "MAG7B0");
        addItem('HD45ACPBoxPickup',        'Reusable45ACPBox',          'HD45ACPAmmo',          10, "45TNA0", "45RNA0");
        addItem('HD45LCBoxPickup',         'Reusable45LCBox',           'HD45LCAmmo',           10, "TN45A0", "RN45A0");
        addItem('HDNDMBoxPickup',          'ReusableNDMBox',            'HDNDMLoose',           10, "TNNDA0", "NRNDA0");
        addItem('PB_50AMBoxPickup',        'Reusable50AMBox',           'HD50AM_Ammo',          10, "G50YA0", "G50ZA0");
        addItem('HD50OMGBoxPickup',        'Reusable50OMGBox',          'HD50OMGAmmo',          10, "OG10A0", "OGBLA0");
        addItem('HD069BoreBox',            'Reusable069Box',            'HD069BoreAmmo',        10, "42BTA0", "42BRA0");
        addItem('HDSavage300BoxPickup',    'Reusable300SavageBox',      'Savage300Ammo',         6, "SVG6A0", "7RNDA0");
        addItem('HD420BoxPickup',          'Reusable420Box',            'HDAurochsAmmo',        10, "42TEA0", "420BA0");
        addItem('HD500SWHeavyBoxPickup',   'Reusable500HeavyBox',       'HD500SWHeavyAmmo',     10, "TNSWB0", "SWRNB0");
        addItem('HD500SWLightBoxPickup',   'Reusable500LightBox',       'HD500SWLightAmmo',     10, "TNSWA0", "SWRNA0");
        addItem('HD762TokarevBoxPickup',   'Reusable762TokarevBox',     'HD762TokarevAmmo',     10, "T710A0", "T762A0");
        addItem('HD3006BoxPickup',         'Reusable3006Box',           'ThirtyAughtSixAmmo',   10, "TEN7A0", "7RNDA0");
        addItem('BirdshotShellBoxPickup',  'ReusableBirdshotShellBox',  'HDBirdshotShellAmmo',   4, "BSH4A0", "BSHLA0");
        addItem('ExplosiveShellBoxPickup', 'ReusableExplosiveShellBox', 'HDExplosiveShellAmmo',  4, "XLS4A0", "XLS1A0");
        addItem('FlareShellBoxPickup',     'ReusableFlareBox',          'HDFlareAmmo',           4, "FLA4A0", "FLARA0");
        addItem('LLShellBoxPickup',        'ReusableLessLethalBox',     'HDLLShellAmmo',         4, "LLS4A0", "LLS1A0");
        addItem('SlugBoxPickup',           'ReusableSlugBox',           'HDSlugAmmo',            4, "SLUGA0", "SLG1A0");
    }


    override void worldLoaded(WorldEvent e) {

        // Populates the main arrays.
        if (!e.IsReOpen) init();
    }

    override void worldThingSpawned(WorldEvent e) {

        // If thing spawned doesn't exist, quit
        if (!e.thing) return;

        // If thing spawned is blacklisted, quit
        foreach (bl : thingBlacklist) if (e.thing is bl) return;

        name candidateName = e.thing.getClassName();

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

    private void handleMapSpawns(HDUPK item, name candidateName) {
        // Iterate through the list of ammo candidates for spawned item.
        foreach (itemSpawn : itemSpawnList) {
            if (itemSpawn.spawnName == candidateName) {

                if (Actor.spawn(itemSpawn.replaceName, item.pos)) {
                
                    HDCore.log('ReusableAmmoboxes.SpawnHandler', LOGGING_DEBUG, item.getClassName().." -> "..itemSpawn.replaceName);

                    item.destroy();

                    return;
                }
            }
        }
    }

    private void handleDroppedAmmoboxes(HDUPK item, name candidateName) {

        // Iterate through the list of ammo candidates for spawned item.
        foreach (itemSpawn : itemSpawnList) {
            if (itemSpawn.spawnName == candidateName) {
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
