# Use all private binaries
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/private/bin/$(MK_CPU_ABI),system/bin)

# Use all private libraries
ifeq ($(TARGET_CPU_ABI),arm64-v8a)
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/lib/arm64-v8a && \
    find vendor/mk/prebuilt/private/lib/arm64-v8a -name '*.so' \
    -printf '%p:system/lib64/%f ')
else ifeq ($(TARGET_CPU_ABI),armeabi-v7a)
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/lib/armeabi-v7a && \
    find vendor/mk/prebuilt/private/lib/armeabi-v7a -name '*.so' \
    -printf '%p:system/lib/%f ')
else
PRODUCT_COPY_FILES += $(shell test -d vendor/mk/prebuilt/private/lib/armeabi && \
    find vendor/mk/prebuilt/private/lib/armeabi -name '*.so' \
    -printf '%p:system/lib/%f ')
endif

# Use all third-party files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/third/app,system/third-app)

# Use all developers-party files
ifneq ($(DEVELOPER_MAINTAINER),)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.apk,vendor/mk/prebuilt/$(DEVELOPER_MAINTAINER)/app,system/third-app)
endif

# Use all common apps
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/common/app,system/app)

# Google apps
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk/prebuilt/google/app,system/app)
