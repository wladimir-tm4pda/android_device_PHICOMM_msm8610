android_device_PHICOMM_msm861<br>
Credits to crazytiti @xdadevelopers<br>
Post: [ROM] CWM11 recovery and Philz Touch port for Phicomm c230w (working)<br>
http://forum.xda-developers.com/android/general/rom-cwm11-recovery-port-phicomm-c230w-t2871370

<br>#extracted device tree from crazytiti@xda file "reco-cm.zip" for CMW
<br>========
<br>How to build :
<br>See below what tutorial i have been following.
<br>When your system is able to build a recovery use the files that I provide to get a usable recovery on the msm8610
(mainly aded definition in the boarconfig.mk and some code rewrite about the sdcard0 and 1 of this device)
<br>
<br>Known bug:
<br>The date of backup and folder name will be "1970-01..."
<br>it's because of the qualcomm hardware and kernel having writing on the RTC disabled (to prevent some issue on modem) => no fix so far
<br>People say that using rom manager to make backup solve the problem (to be validated)
<br>
<br>#######
<br>#additionally:
<br>file "reco-twrp.zip" -- device tree from crazytiti@xda for Philz Touch
<br>