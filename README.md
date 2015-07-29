README.md

**device tree for PHICOMM C230w**
based on CAF: https://www.codeaurora.org/cgit/quic/la/platform/vendor/qcom/msm8610/

some files - extracted from stock ROM T30

##### -- comments by wladimir_tm 

-----------

modified /vendor/qcom/build/tasks$ generate_extra_images.mk

#####commented by wladimir_tm
##### for ability to use prebuit dt.img (&& copy to dest via 'device.mk'-file)
#####$(INSTALLED_DTIMAGE_TARGET): $(DTBTOOL) $(INSTALLED_KERNEL_TARGET)
#####   $(build-dtimage-target)
#####


------------example run:
source build/envsetup.sh
lunch msm8610-eng
RUN=`date +%m%d%H%M%S` && date && date >> make.$RUN.log && /usr/bin/time -f "Total time: %E" make recoveryimage -j4 2>&1 | tee -a make.$RUN.log && date >> make.$RUN.log && date
-----

-----
changed to stock T30 version (as module)
init.qcom.rc
//moun sdcard troubles))
// there is the same!!! /device/qcom/common/rootdir/etc$ init.qcom.rc
-----