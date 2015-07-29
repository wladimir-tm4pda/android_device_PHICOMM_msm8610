<br>**/device/qcom/msm8610**
<br>reffers to: **platform_vendor_qcom_msm8610**
<br>https://www.codeaurora.org/cgit/quic/la/platform/vendor/qcom/msm8610/
<br>========
<br> extracted & resynced Mon Jul 27 19:54:21 EEST 2015 
<br>========
<br>-rw------- 1 wladimir_tm wladimir_tm 42625069732 Jun  2 16:49 msm8610ca4.3.mx0.dot.repo.7z
<br>7z x msm8610ca4.3.mx0.dot.repo.7z
<br>repo init -u git://codeaurora.org/platform/manifest.git -b release -m LNX.LA.3.2.1.3-12000-8x10.0.xml --repo-url=git://codeaurora.org/tools/repo.git --repo-branch=caf-stable
<br>date && date >> sync.log && /usr/bin/time -f "Total time: %E" repo sync -j8 2>&1 | tee -a sync.log && date && date >> sync.log
<br>...
<br>Total time: 7:30.89
<br>Mon Jul 27 19:56:31 EEST 2015
<br>=========
<br> .repo archive created upon:
<br>repo init -u git://codeaurora.org/platform/manifest.git -b release -m LNX.LA.3.2.1.3-12000-8x10.0.xml --repo-url=git://codeaurora.org/tools/repo.git --repo-branch=caf-stable
<br>date && date >> sync.log && /usr/bin/time -f Total time: %E repo sync -j8 | tee -a sync.log 2>&1 >> sync.log && date >> sync.log
<br>RX bytes:43155299434 (43.1 GB)  TX bytes:1266793784 (1.2 GB)
<br>du -sh 50G.
<br>sync made: Tue Jun  2 09:28:54 EEST 2015


============

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
mount sdcard troubles))
there is the same!!! /device/qcom/common/rootdir/etc$ init.qcom.rc

