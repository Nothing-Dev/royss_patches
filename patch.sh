echo "==============================================="
echo "    Preparing source for royss compilation"
echo "==============================================="
echo ""

echo "Patching build"

echo "==============================================="
echo "Build"
echo "==============================================="
cd build 
git fetch https://github.com/CyanogenMod-S6310/android_build.git cm-11.0 > /dev/null
echo "qcom_utils: add kitkat sdk versions"
git cherry-pick f3c7d18acfbdb0fe0f84391250f4e6ef2d853fc1 > /dev/null
cd ../

echo "Patching frameworks"

echo "==============================================="
echo "Base"
echo "==============================================="
cd frameworks/base
git fetch https://github.com/CyanogenMod-S6310/android_frameworks_base.git cm-11.0 > /dev/null
echo "Allow using Classic WebView"
git cherry-pick d3152967aacedce9921ffb44e1066a0a66e9229e > /dev/null
cd ../

echo "==============================================="
echo "AV"
echo "==============================================="
cd av
git fetch https://github.com/CyanogenMod-S6310/android_frameworks_av.git cm-11.0 > /dev/null
echo "Dont use tunnel recording"
git cherry-pick 8534bcafc7f8c0d371524c2b59a69f5a3d000b6c > /dev/null
cd ../

echo "==============================================="
echo "Native"
echo "==============================================="
cd native
git fetch https://github.com/CyanogenMod-S6310/android_frameworks_native.git cm-11.0 > /dev/null
echo "Merge Dazzozo's work"
git cherry-pick 39f59f39a5c35afcc38783dc443b0cb312bd48fd > /dev/null
echo "Revert sf: Set view frame of each display using binder"
git cherry-pick 8c3bf2f76d536d6011569aa371196aee4440063b > /dev/null
echo "DisplayDevice: Backwards compatibility with old EGL"
git cherry-pick cf314d0de6eaad55697364ea4d531c8dc43f294c > /dev/null
cd ../

echo "==============================================="
echo "Webview"
echo "==============================================="
cd webview
git fetch https://github.com/CyanogenMod-S6310/android_frameworks_webview.git cm-11.0 > /dev/null
echo "Revert: Remove the classic WebView from the build."
git cherry-pick c79c9df7b4381370027265badaac14bed634dc8dn > /dev/null
cd ../../

echo "Patching recovery"

echo "==============================================="
echo "Recovery"
echo "==============================================="
cd bootable/recovery
git fetch https://github.com/CyanogenMod-S6310/android_bootable_recovery.git cm-11.0 > /dev/null
echo "Updater: Fix installing on older devices"
git cherry-pick 5a8bfb68c7fdf93d357281cca46b3df9e5c8735e > /dev/null
echo "minui: display-legacy says NO"
git cherry-pick c1ecc75d3db095c0b1b2e24b497eddaf31f10a0c > /dev/null
cd ../../

echo "Patching external"

echo "==============================================="
echo "Skia"
echo "==============================================="
cd external/skia
git fetch https://github.com/CyanogenMod-S6310/android_external_skia.git cm-11.0 > /dev/null
echo "SkCanvas: Make setDevice public again"
git cherry-pick f9912d90954c707cac8cc474c1ca61f8458efdf7 > /dev/null
cd ../

echo "==============================================="
echo "Chromium"
echo "==============================================="
cd chromium
git fetch https://github.com/CyanogenMod-S6310/android_external_chromium.git cm-11.0 > /dev/null
echo "reduce cookie tracking (5/6): count cookies"
git cherry-pick 76760a6d2b92ac149ae902b5844835138a7c0618 > /dev/null
cd ../../

echo "Patching hardware"

echo "==============================================="
echo "libhardware"
echo "==============================================="
cd hardware/libhardware 
git fetch https://github.com/CyanogenMod-S6310/android_hardware_libhardware.git cm-11.0 > /dev/null
echo "hwcomposer: Add sourceTransform to hwc_layer_t"
git cherry-pick f812fe86db6f3eadcffd10eae9036ffe61eaefa2 > /dev/null
cd ../

echo "==============================================="
echo "libhardware_legacy"
echo "==============================================="
cd libhardware_legacy
git fetch https://github.com/CyanogenMod-S6310/android_hardware_libhardware_legacy.git cm-11.0 > /dev/null
echo "audio: add missing audio formats for msm7x27a"
git cherry-pick 364d01ef9705277e053dc3bcd6e4523d2f5ce2f3 > /dev/null
cd ../../

echo "Patching apps"

echo "==============================================="
echo "Browser"
echo "==============================================="
cd packages/apps/Browser
git fetch https://github.com/CyanogenMod-S6310/android_packages_apps_Browser.git cm-11.0 > /dev/null
echo "Revert: Replace removed NARROW_COLUMNS layout mode with TEXT_AUTOSIZING"
git cherry-pick 29a31f3342473c5e047ba51c84e9793acbf3e086 > /dev/null
cd ../../../


echo "==============================================="
echo "      Source ready for compile for royss"
echo "==============================================="

echo "Run this script whenever you make repo sync"
