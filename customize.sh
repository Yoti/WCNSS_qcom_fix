#!/sbin/sh

# xiaomi
brand="$(getprop ro.product.system.brand)"
if [[ "$brand" != "xiaomi" ]]; then
	abort "Unsupported brand: $brand"
else
	ui_print "Your brand is: $brand"
fi

# ginkgo/willow
device="$(getprop ro.product.system.device)"
if [[ "$device" != "ginkgo" && "$device" != "willow" ]]; then
	abort "Unsupported device: $device"
else
	ui_print "Your device is: $device"
fi

# 28=9/29=10/30=11
sdk="$(getprop ro.build.version.sdk)"
if [[ "$sdk" == "28" ]]; then
	ui_print "Your SDK is: $sdk (Android 9)"
	mv "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A9M10M11.ini" "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
	rm -f "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A10M12.ini"
	rm -f "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A11M12.ini"
elif [[ "$sdk" == "29" ]]; then
	ui_print "Your SDK is: $sdk (Android 10)"
	mv "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A10M12.ini" "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
	rm -f "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A9M10M11.ini"
	rm -f "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A11M12.ini"
elif [[ "$sdk" == "30" ]]; then
	ui_print "Your SDK is: $sdk (Android 11)"
	mv "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A11M12.ini" "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
	rm -f "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A9M10M11.ini"
	rm -f "$MODPATH/system/vendor/etc/wifi/WCNSS_qcom_cfg_A10M12.ini"
else
	abort "Unsupported SDK: $sdk"
fi
