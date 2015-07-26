android_device_PHICOMM_msm8610 <br>
<br> device tree created for PHICOMM C230w msm8610 android phone<br>
<br>
<br>designed for custom recoveries only for now (CWM/TWRP)
<br>checkout appropriate branch for look into<br>
<br>cm-* branches for CWM (on CyanogenMod sources)
<br>android-* branches for TWRP (on omni sources)
<br>'kernel' & 'dt.img'- used from stock ROM T30
<br> 
<br>#==================
<b>how to build</b><br>
<b>example:</b><br>
<br>cd
<br>mkdir -p ~/bin
<br>curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
<br>chmod a+x ~/bin/repo
<br>echo "export PATH=~/bin:$PATH" >> ~/.bashrc
<br>echo "export USE_CCACHE=1" >> ~/.bashrc
<br>git config --global user.email {your.user.mail@github.com}
<br>git config --global user.name {your user.name@gitgub.com}
<br>git config --global color.ui true
<br>#check:
<br>git config --global -l
<br>mkdir -p {desired-sources} #in this exmpl: cm-11.0
<br>cd cm-11.0
<br>repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0 2>&1 | tee -a sync.log
<br>#repo init -u git://github.com/CyanogenMod/android.git -b cm-10.2 2>&1 | tee -a sync.log
<br>#repo init -u https://github.com/omnirom/android.git -b android-4.4 2>&1 | tee -a sync.log
<br>#sync repo
<br>date && date >> sync.log && /usr/bin/time -f "Total time: %E" repo sync -j8 2>&1 | tee -a sync.log && date >> sync.log && date
<br>##wait for about 1,5 hour on 100MB internet connection
<br>#OPTIONAL:
<br>##backup .repo (for maybe experiments on working sources;); for restore - remove all but .repo & archive && unpack && repo sync -l 
<br>##
<br>#clone device tree
<br>mkdir -p /device/PHICOMM/msm8610
<br>cd /device/PHICOMM/msm8610
<br>git init .
<br>git remote add origin https://github.com/wladimir-tm4pda/android_device_PHICOMM_msm8610.git
<br>git fetch origin
<br>git checkout {desired-branch} #in this exmpl: cm-11.0
<br>git checkout cm-11.0
<br>ls -la #ckeck
<br>cd
<br>cd cm-11.0
<br>source build/envsetup.sh
<br>lunch cm_C230w-eng
<br>#or lunch -- and select desired type of build
<br>#lunch omni_C230w-eng
<br>#run compiling
<br>date && date >> make.log && /usr/bin/time -f "Total time: %E" make -j4 recoveryimage 2>&1 | tee -a make.log && date >> make.log && date
<br>##wait for about 0.5 hour on intel core i5 (cm sources); on omni - more quickly ;)
<br>#resulting recovery.img:
<br>cd $OUT
<br>#to load recovery.img into phone:
<br>adb reboot bootloader
<br>fastboot devices
<br>fastboot boot recovery.img
<br>#for flash: fastboot flash recovery recovery.img
<br>#
<br>#==================
<br>
<br>additional info:
<br>@xdadevelopers Post: [ROM] CWM11 recovery and Philz Touch port for Phicomm c230w (working)
<br>http://forum.xda-developers.com/android/general/rom-cwm11-recovery-port-phicomm-c230w-t2871370
<br>
<br>@xdadevelopers Post: [DEV]How to compile TWRP touch recovery
<br>http://forum.xda-developers.com/showthread.php?t=1943625
<br>

