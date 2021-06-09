#!/bin/bash
#put script in Lighthouse source folder, make executable (chmod +x createjson.sh) and run it (./createjson.sh)

#modify values below
#leave blank if not used
maintainer="Name (nickname)" #ex: Lup Gabriel (gwolfu)
github_username="Github Username" #ex: Stealth1226
oem="OEM" #ex: OnePlus
device="device codename" #ex: guacamole
devicename="name of device" #ex: OnePlus 7 Pro
zip="lighthouse zip name" #Name of the build you want to release , ex: LighthouseOS-Raft-OFFICIAL-raphael-20210604-0633-GAPPS.zip
forum="" #https link (leave empty if unused)
firmware="" #https link (leave empty if unused)
modem="" #https link (leave empty if unused)
bootloader="" #https link (leave empty if unused)
recovery="" #https link (leave empty if unused)
paypal="" #https link (leave empty if unused)
telegram="" #https link (leave empty if unused)
version="" # Ex: Raft 


#don't modify from here
script_path="`dirname \"$0\"`"
zip_name=$script_path/out/target/product/$device/$zip
buildprop=$script_path/out/target/product/$device/system/build.prop
download="https://sourceforge.net/p/project-lighthouse/files/$device/$zip/download"

if [ -f $script_path/$device.json ]; then
  rm $script_path/$device.json
fi

linenr=`grep -n "ro.system.build.date.utc" $buildprop | cut -d':' -f1`
timestamp=`sed -n $linenr'p' < $buildprop | cut -d'=' -f2`
md5=`md5sum "$zip_name" | cut -d' ' -f1`
size=`stat -c "%s" "$zip_name"`

echo '{
  "response": [
    {
        "error": false,
        "maintainer": "'$maintainer'",
        "github_username": "'$github_username'",
        "oem": "'$oem'",
        "device": "'$devicename'",
        "filename": "'$zip'",
        "url": "'$download'",
        "datetime": "'$timestamp'",
        "hash": "'$md5'",
        "size": '$size',
        "version": "'$version'",
        "forum_url": "'$forum'",
        "firmware": "'$firmware'",
        "modem": "'$modem'",
        "bootloader": "'$bootloader'",
        "paypal": "'$paypal'",
        "telegram": "'$telegram'"
    }
  ]
}' > "${device}.json"


echo 'Changelog:
==============================

------------------------------
' > "changelog_${device}.txt" 


echo 'Done! , json and device changelog template generated'
