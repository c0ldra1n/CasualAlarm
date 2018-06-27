include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CasualAlarm
CasualAlarm_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileTimer && killall -9 Preferences"
SUBPROJECTS += casualalarm_uihook
SUBPROJECTS += casualalarm_prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
