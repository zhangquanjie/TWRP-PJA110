# TWRP device tree for OnePlus Ace 2 Pro (PJA110)

Target baseline: `crDroidAndroid-17.0-20261118-xigua-v13.1`.

This is a bring-up tree for TWRP's `twrp-14.1` branch. The device has a
dedicated 100 MiB recovery partition using Android boot header v4, with the
kernel and hardware modules supplied by the matching `boot`/`vendor_boot`.
Always pair the result with `vendor_boot-20261118-recovery-fixed.img`.

Build target:

```sh
source build/envsetup.sh
lunch twrp_pja110-ap2a-eng
mka recoveryimage
```

The TWRP 14.1 codebase predates Android 17. Boot, display, touch, ADB,
fastbootd, mounting and FBE decryption must each be verified independently.
Do not format data while validating decryption.
