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
	
	void VanillaAmmoBoxSpawns(worldevent e) {
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
	
	void HDBulletLibAmmoBoxSpawns(worldevent e) {
		//4g shell boxes
		if (e.Thing is "HD4GBBox") {
			HD4GSAmmo p = HD4GSAmmo(actor.spawn("HD4GSAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(4,int.max,"HD4GBAmmo","4GPAA0","4GSIA0");
			e.thing.destroy();
			return;
		}

		//5mm boxes
		if (e.Thing is "PB_5mmBoxPickup") {
			HD5mm_Ammo p = HD5mm_Ammo(actor.spawn("HD5mm_Ammo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(16,int.max,"PB_5mmBoxPickup","5MMYA0","5MMZA0");
			e.thing.destroy();
			return;
		}

		//6mm boxes
		if (e.Thing is "HD6mmFlechetteBoxPickup") {
			HD6mmFlechetteAmmo p = HD6mmFlechetteAmmo(actor.spawn("HD6mmFlechetteAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(12,int.max,"HD6mmFlechetteBoxPickup","ACR9I0","ACRPI0");
			e.thing.destroy();
			return;
		}

		//10mm boxes
		if (e.Thing is "HD10mBoxPickup") {
			HD10mAmmo p = HD10mAmmo(actor.spawn("HD10mAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(10,int.max,"HD10mBoxPickup","T10MA0","PR10A0");
			e.thing.destroy();
			return;
		}

		//.45 ACP boxes
		if (e.Thing is "HD45ACPBoxPickup") {
			HD45ACPAmmo p = HD45ACPAmmo(actor.spawn("HD45ACPAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(10,int.max,"HD45ACPBoxPickup","45TN","45RN");
			e.thing.destroy();
			return;
		}

		//.45 LC boxes
		if (e.Thing is "HD45LCBoxPickup") {
			HD45LCAmmo p = HD45LCAmmo(actor.spawn("HD45LCAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(10,int.max,"HD45LCBoxPickup","T10MA0","PR10A0");
			e.thing.destroy();
			return;
		}

		//.50 AE boxes
		if (e.Thing is "HD50AEBoxPickup") {
			HD50AEAmmo p = HD50AEAmmo(actor.spawn("HD50AEAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(10,int.max,"HD50AEBoxPickup","TEN9A0","PRNDA0");
			e.thing.destroy();
			return;
		}

		//.50 AM boxes
		if (e.Thing is "PB_50AMBoxPickup") {
			HD50AM_Ammo p = HD50AM_Ammo(actor.spawn("HD50AM_Ammo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(10,int.max,"PB_50AMBoxPickup","G50YA0","G50ZA0");
			e.thing.destroy();
			return;
		}

		//.50 OMG boxes
		if (e.Thing is "HD50OMGBoxPickup") {
			HD50OMGAmmo p = HD50OMGAmmo(actor.spawn("HD50OMGAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
		    p.SplitPickupBoxableRound(10,int.max,"HD50OMGBoxPickup","OG10A0","OGBLA0");
			e.thing.destroy();
			return;
		}

		//12g explosive shell boxes
		if (e.Thing is "ExplosiveShellBoxPickup") {
			HDExplosiveShellAmmo p = HDExplosiveShellAmmo(actor.spawn("HDExplosiveShellAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(4,int.max,"ExplosiveShellBoxPickup","XLS4A0","XLS1A0");
			e.thing.destroy();
			return;
		}
		//12g slug boxes
		if (e.Thing is "SlugBoxPickup") {
			HDSlugAmmo p = HDSlugAmmo(actor.spawn("HDSlugAmmo",e.thing.pos));
			p.amount = HDUPK(e.Thing).amount;
			p.vel = e.thing.vel;
			p.SplitPickupBoxableRound(4,int.max,"SlugBoxPickup","SHELA0","SHL1A0");
			e.thing.destroy();
			return;
		}
	}

	override void CheckReplacement(ReplaceEvent e) {
		// Vanilla Replacements
		if (e.Replacee is "HD9mBoxPickup") { e.Replacement = "Legacy_9mmBox"; return; }
		if (e.Replacee is "ShellBoxPickup") { e.Replacement = "Legacy_ShellBox"; return; }
		if (e.Replacee is "HD7mBoxPickup") { e.Replacement = "Legacy_7mmBox"; return; }
		if (e.Replacee is "HD355BoxPickup") { e.Replacement = "Legacy_355Box"; return; }
		if (e.Replacee is "RocketBigPickup") { e.Replacement = "Legacy_RocketBox"; return; }
		
		// HDBulletLibReplacements
		if (e.Replacee is "HD4GBBox") { e.Replacement = "Legacy_4GaSlugBox"; return; }
		if (e.Replacee is "PB_5mmBoxPickup") { e.Replacement = "Legacy_5mmBox"; return; }
		if (e.Replacee is "HD6mmFlechetteBoxPickup") { e.Replacement = "Legacy_6mmBox"; return; }
		if (e.Replacee is "HD10mBoxPickup") { e.Replacement = "Legacy_10mmBox"; return; }
		if (e.Replacee is "HD45ACPBoxPickup") { e.Replacement = "Legacy_45ACPBox"; return; }
		if (e.Replacee is "HD45LCBoxPickup") { e.Replacement = "Legacy_45LCBox"; return; }
		if (e.Replacee is "HD50AEBoxPickup") { e.Replacement = "Legacy_50AEBox"; return; }
		if (e.Replacee is "PB_50AMBoxPickup") { e.Replacement = "Legacy_50AMBox"; return; }
		if (e.Replacee is "HD50OMGBoxPickup") { e.Replacement = "Legacy_50OMGBox"; return; }
		if (e.Replacee is "ExplosiveShellBoxPickup") { e.Replacement = "Legacy_ExplosiveShellBox"; return; }
		if (e.Replacee is "SlugBoxPickup") { e.Replacement = "Legacy_SlugBox"; return; }
	}
	
	override void WorldThingSpawned(WorldEvent e) {
		if(!e.Thing) { return; }

		VanillaAmmoBoxSpawns(e);
        
		if (!e.Thing) { return; }
        
		HDBulletLibAmmoBoxSpawns(e);
	}
}