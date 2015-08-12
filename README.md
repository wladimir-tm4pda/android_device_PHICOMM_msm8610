android_device_PHICOMM_msm8610 <br>
cm-11.0 working version of device tree for CWM 6.0.5.1
<br>
<br>version by wladimir_tm
<br>
<br>main differs from crazytiti version:
<br>    using FLAGS:
<br>    LOCAL_PATH := device/PHICOMM/msm8610
<br>    TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include<br>
<br>-------20150812
<br> ready for compiling CWM with kernel sources (device/PHICOMM/msm8610-kernel)
<br> and additional mkbootimg.mk - for generating dt.img

