export TARGET = iphone:clang:10.3:10.3
export ARCHS = armv7
export DEBUG = 0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Antigravity5C

Antigravity5C_FILES = main.m AppDelegate.m ViewController.m
Antigravity5C_FRAMEWORKS = UIKit CoreGraphics
Antigravity5C_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk
