include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CasualAlarm
CasualAlarm_FILES = CARootListController.m
CasualAlarm_INSTALL_PATH = /Library/PreferenceBundles
CasualAlarm_FRAMEWORKS = UIKit
CasualAlarm_PRIVATE_FRAMEWORKS = Preferences
CasualAlarm_LDFLAGS = -F/opt/theos/sdks/iPhoneOS9.3.sdk/System/Library/PrivateFrameworks/

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CasualAlarm.plist$(ECHO_END)
