IOS_TARGET := $(IOS_PREFIX)Mobile.framework
ANDROID_TARGET := android.lib/mobile.aar

.PHONY: bind

bind: bind_ios 

bind_ios: $(IOS_TARGET)

$(IOS_TARGET): mobile/*
	gomobile bind -target ios -o $(IOS_TARGET) github.com/dictav/example-gomobile/mobile

bind_android: $(ANDROID_TARGET)

$(ANDROID_TARGET): mobile/*
	gomobile bind -target android -o $(ANDROID_TARGET) github.com/dictav/example-gomobile/mobile
