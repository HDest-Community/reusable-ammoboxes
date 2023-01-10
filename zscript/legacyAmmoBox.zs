class Legacy_AmmoBox : HDMagAmmo {
	default {
		HDMagAmmo.extracttime 1;
		HDMagAmmo.inserttime 2;
		HDMagAmmo.MagBulk 2;
	}

	// Don't auto-consolidate these like mags
	override void Consolidate() { SyncAmount(); return; }
}

class Legacy_Ammoboxes_Spawner : EventHandler {
	
	void AmmoBoxSpawns(worldevent e) {
		//9mm boxes
		if (e.Thing is "HD9mBoxPickup") {
			HDPistolAmmo p = HDPistolAmmo(actor.spawn("HDPistolAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(10,int.max,"HD9mBoxPickup","TEN9A0","PRNDA0");
			e.thing.destroy();
			return;
		}

		//12g shell boxes
		if (e.Thing is "ShellBoxPickup") {
			HDShellAmmo p = HDShellAmmo(actor.spawn("HDShellAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(4,int.max,"ShellBoxPickup","SHELA0","SHL1A0");
			e.thing.destroy();
			return;
		}

		//7mm boxes
		if (e.Thing is "HD7mBoxPickup") {
			SevenMilAmmo p = SevenMilAmmo(actor.spawn("SevenMilAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(10,int.max,"HD7mBoxPickup","TEN7A0","&RNDA0");
			e.thing.destroy();
			return;
		}

		//.355 boxes
		if (e.Thing is "HD355BoxPickup") {
			HDRevolverAmmo p = HDRevolverAmmo(actor.spawn("HDRevolverAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(10,int.max,"HD355BoxPickup","TEN9A0","3RNDA0");
			e.thing.destroy();
			return;
		}
	}

	override void CheckReplacement(ReplaceEvent e) {
		if (e.Replacee is "HD9mBoxPickup") { e.Replacement = "Legacy_9mmBox"; return; }
		if (e.Replacee is "ShellBoxPickup") { e.Replacement = "Legacy_ShellBox"; return; }
		if (e.Replacee is "HD7mBoxPickup") { e.Replacement = "Legacy_7mmBox"; return; }
		if (e.Replacee is "HD355BoxPickup") { e.Replacement = "Legacy_355Box"; return; }
		if (e.Replacee is "RocketBigPickup") { e.Replacement = "Legacy_RocketBox"; return; }
	}
	
	override void WorldThingSpawned(WorldEvent e) {
		if(!e.Thing) { return; }

		AmmoBoxSpawns(e);

	}
}