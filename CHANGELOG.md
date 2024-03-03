# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v1.4.0] - 2024-03-03

### Added

-   Added Freedoom Shellbox sprites (#25).

### Changed

-   Update Build Scripts (#27, #28, #29, #30).
-   Fix spawn replacer CVAR initialization checks (#26).
-   Fix `ReusableRocketBox` Spawn slots for latest HDest Main (#33).
-   Update `handleDroppedAmmobox` logic to fallback to simply replacing the box if the item being replaced isn't able to be bundled/boxed (#33).

## [v1.3.2] - 2023-10-25

### Changed

-   Fixed Radtech Snubnose Classname.

## [v1.3.1] - 2023-08-14

### Changed

-   Refactored RemovedClasses CVAR.

## [v1.3.0] - 2023-07-18

### Added

-   Added ability to configure an ammobox to be empty in a loadout.

## [v1.2.1] - 2023-07-05

### Changed

-   Fixed Backpack spawn pool removal logic.

## [v1.2.0] - 2023-07-04

### Added

-   Added new Radtech Ammoboxes.
-   Added WAN Industry's weapons to ammo usages.
-   Added Right's Weapons to ammo usages.

### Changed

-   Fixed ammobox sprites.
-   Updated Spawn Handler.

## [v1.1.2] - 2023-06-06

### Changed

-   Fixed 7mm Ammobox class name.

## [v1.1.1] - 2023-06-06

### Changed

-   Fixed a "nullpointer" VM Abort.
-   Added Nora 4ga Shotgun to weapons that use 4ga 00 Buckshot boxes.

## [v1.1.0] - 2023-06-03

### Added

-   Added 4ga 00 Buckshot shellbox.

### Changed

-   Enhanced spawning logic.
-   Updated .420 Frei & .069 Bore ammobox sprites.
-   Removed 12ga Shellbox translation.

## [v1.0.2] - 2023-03-18

### Changed

-   Fix empty box sprite offsets.

## [v1.0.1] - 2023-02-25

### Added

-   Added `SNDINFO` lump to PK3.

### Changed

-   Use string comparison for classname checks to remove hard dependencies.
-   Fix Armour Menus relying on AmmoCounters to be enabled.
-   Use WAN Sneaking Suit's own durability stat.
-   Update Armour/Helmet Overrides for latest HUDCore.
-   Refine Preset defaults, console commands, refactor CVARs, etc.

## [v1.0.0] - 2023-02-25

### Changed

-   Refactored sound entries.
-   Cleaned up some code.

## [v0.0.4] - 2023-02-01

### Changed

-   Allow multiple rounds to be removed from a box at once.
-   Updated pickup toss logic to use `-1` instead of `int.max` to prevent dropping a box pickup.
-   Rebalanced timings & amount of inserted/extracted rounds.

## [v0.0.3] - 2023-01-17

### Changed

-   Update empty 4ga slug box sprite.
-   Generified classname references.

## [v0.0.2] - 2023-01-15

### Changed

-   Fixed LANGUAGE entries.

## [v0.0.1] - 2023-01-15

### Added

-   Initial Release.  Originally made by Testament-Holmes, now maintained by the community.
-   Added all boxable rounds provided by HDBulletLib

[Unreleased]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.4.0...HEAD

[v1.4.0]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.3.2...v1.4.0

[v1.3.2]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.3.1..v1.3.2

[v1.3.1]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.3.0..v1.3.1

[v1.3.0]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.2.1..v1.3.0

[v1.2.1]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.2.0..v1.2.1

[v1.2.0]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.1.2..v1.2.0

[v1.1.2]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.1.1..v1.1.2

[v1.1.1]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.1.0..v1.1.1

[v1.1.0]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.0.2..v1.1.0

[v1.0.2]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.0.1..v1.0.2

[v1.0.1]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v1.0.0..v1.0.1

[v1.0.0]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v0.0.4..v1.0.0

[v0.0.4]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v0.0.3..v0.0.4

[v0.0.3]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v0.0.2..v0.0.3

[v0.0.2]: https://github.com/HDest-Community/reusable-ammoboxes/compare/v0.0.1..v0.0.2

[v0.0.1]: https://github.com/HDest-Community/reusable-ammoboxes/releases/tag/v0.0.1
