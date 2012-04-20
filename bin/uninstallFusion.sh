#!/bin/bash
## see http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1014529
## and
## http://kb.vmware.com/selfservice/microsites/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=1017838
rm -ri /Library/Application\ Support/VMware\ Fusion
rm -ri /Users/*/Library/Preferences/VMware\ Fusion
rm -ri /Library/Preferences/VMware\ Fusion
rm -ri /Users/*/Library/Caches/com.vmware.fusion
rm -ri /Users/*/Library/Application\ Support/VMware\ Fusion
rm -ri /Users/*/Library/Preferences/com.vmware.fusion*
echo "reboot now";
