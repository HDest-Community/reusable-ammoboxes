version "4.10.0"

// Vanilla Loadout Codes
const HDLD_REUSABLE_355_BOX            = "3bx";
const HDLD_REUSABLE_4MM_BOX            = "zbx";
const HDLD_REUSABLE_7MM_BOX            = "abx";
const HDLD_REUSABLE_9MM_BOX            = "9bx";
const HDLD_REUSABLE_RKT_BOX            = "rbx";
const HDLD_REUSABLE_SHELL_BOX          = "sbx";

// HDBulletLib Loadout Codes
const HDLD_REUSABLE_4GSHELL_BOX        = "4bx";
// const HDLD_REUSABLE_4GSLUG_BOX         = "gbx";
const HDLD_REUSABLE_500H_BOX           = "hbx";
const HDLD_REUSABLE_500L_BOX           = "lbx";
const HDLD_REUSABLE_5MM_BOX            = "bbx";
const HDLD_REUSABLE_069_BOX            = "ybx";
const HDLD_REUSABLE_300SAVAGE_BOX      = "vbx";
const HDLD_REUSABLE_420_BOX            = "ibx";
const HDLD_REUSABLE_45ACP_BOX          = "pbx";
const HDLD_REUSABLE_45LC_BOX           = "cbx";
const HDLD_REUSABLE_50AE_BOX           = "ebx";
const HDLD_REUSABLE_50AM_BOX           = "mbx";
const HDLD_REUSABLE_6MMFLECHETTE_BOX   = "6bx";
const HDLD_REUSABLE_10MM_BOX           = "0bx";
const HDLD_REUSABLE_FLARE_BOX          = "fbx";
const HDLD_REUSABLE_LESSLETHAL_BOX     = "gbx";
const HDLD_REUSABLE_762TOKAREV_BOX     = "tbx";
const HDLD_REUSABLE_3006_BOX           = "zbx";
const HDLD_REUSABLE_BIRDSHOT_BOX       = "dbx";
const HDLD_REUSABLE_50OMG_BOX          = "obx";
const HDLD_REUSABLE_SLUG_BOX           = "ubx";
const HDLD_REUSABLE_EXPLOSIVESHELL_BOX = "xbx";

// Base Classes
#include "zscript/reusableammoboxes/reusableAmmoBox.zs"
#include "zscript/reusableammoboxes/spawnReplacer.zs"

// Vanilla Ammoboxes
#include "zscript/reusableammoboxes/Vanilla/9mmBox.zs"
#include "zscript/reusableammoboxes/Vanilla/shellBox.zs"
#include "zscript/reusableammoboxes/Vanilla/7mmBox.zs"
#include "zscript/reusableammoboxes/Vanilla/355Box.zs"
#include "zscript/reusableammoboxes/Vanilla/rocketBox.zs"

// HDBulletLib Ammoboxes
#include "zscript/reusableammoboxes/HDBulletLib/4GaShellBox.zs"
// [UZ] 4ga Slugs don't currently have boxes, only the 4ga 00 Buckshot does
//#include "zscript/reusableammoboxes/HDBulletLib/4GaSlugBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/500HeavyBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/500LightBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/5mmBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/069Box.zs"
#include "zscript/reusableammoboxes/HDBulletLib/300SavageBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/420Box.zs"
#include "zscript/reusableammoboxes/HDBulletLib/45ACPBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/45LCBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/50AEBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/50AMBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/6mmBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/10mmBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/flareBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/lessLethalBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/762TokarevBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/3006Box.zs"
#include "zscript/reusableammoboxes/HDBulletLib/50OMGBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/birdshotShellBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/slugBox.zs"
#include "zscript/reusableammoboxes/HDBulletLib/explosiveShellBox.zs"