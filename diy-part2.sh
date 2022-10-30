#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 5.4内核
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' target/linux/armvirt/Makefile

# 删除软件包
rm -rf feeds/luci/applications/luci-app-zerotier
#rm -rf feeds/luci/applications/luci-app-easymesh
rm -rf feeds/packages/net/adguardhome
rm -rf package/lean/mentohust
rm -rf feeds/luci/applications/luci-app-socat

# autocore
sed -i 's/DEPENDS:=@(.*/DEPENDS:=@(TARGET_bcm27xx||TARGET_bcm53xx||TARGET_ipq40xx||TARGET_ipq806x||TARGET_ipq807x||TARGET_mvebu||TARGET_rockchip||TARGET_armvirt) \\/g' package/lean/autocore/Makefile

# Modify default
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile
sed -i 's#root::0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i 's/R22.10.20/R22.10.31/g' package/lean/default-settings/files/zzz-default-settings
#sed -i 's#root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::#root:$1$wEehtjxj$YBu4quNfVUjzfv8p/PBo5.:0:0:99999:7:::#g' package/lean/default-settings/files/zzz-default-settings
sed -i '34d' package/lean/default-settings/files/zzz-default-settings

# 添加额外软件包
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/apps/luci-app-openclash
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/apps/luci-app-amlogic
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/apps/luci-app-filebrowser
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns package/apps/luci-app-smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-advanced package/apps/luci-app-advanced
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/apps/luci-app-control-timewol
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-weburl package/apps/luci-app-control-weburl
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule package/apps/luci-app-rebootschedule
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat package/apps/luci-app-socat
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-koolproxyR package/apps/luci-app-koolproxyR
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome package/apps/luci-app-adguardhome
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper package/apps/luci-app-iptvhelper
svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper package/apps/iptvhelper
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dnsfilter package/apps/luci-app-dnsfilter
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-usb3disable package/apps/luci-app-usb3disable
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ledtrig-rssi package/apps/luci-app-ledtrig-rssi
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ledtrig-usbport package/apps/luci-app-ledtrig-usbport
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ledtrig-switch package/apps/luci-app-ledtrig-switch
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-gost package/apps/luci-app-gost
svn co https://github.com/kiddin9/openwrt-packages/trunk/gost package/apps/gost
svn co https://github.com/kiddin9/openwrt-packages/trunk/MentoHUST-OpenWrt-ipk package/apps/mentohust
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-eqos package/apps/luci-app-eqos
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-minieap package/apps/luci-app-minieap
svn co https://github.com/kiddin9/openwrt-packages/trunk/openwrt-minieap package/apps/openwrt-minieap
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mentohust package/apps/luci-app-mentohust
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/apps/luci-app-mosdns
svn co https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/apps/luci-app-mosdns 
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pppoe-server package/apps/luci-app-pppoe-server
svn co https://github.com/kenzok8/small-package/trunk/luci-app-ikoolproxy package/apps/luci-app-ikoolproxy
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-airwhu package/apps/luci-app-airwhu
svn co https://github.com/kiddin9/openwrt-packages/trunk/adguardhome package/apps/adguardhome
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/apps/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/apps/luci-app-argonne-config
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-argon-config package/apps/luci-app-argon-config
svn co https://github.com/kenzok8/small-package/trunk/luci-app-nginx-manager package/apps/luci-app-nginx-manager
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/passwall
git clone -b luci --single-branch https://github.com/xiaorouji/openwrt-passwall package/apps/luci-app-passwall
#git clone -b default --single-branch https://github.com/AutoCONFIG/minieap-openwrt package/apps/minieap-openwrt
#git clone https://github.com/xiaorouji/openwrt-passwall2 package/apps/luci-app-passwall2
git clone https://github.com/rufengsuixing/luci-app-zerotier package/apps/luci-app-zerotier
git clone https://github.com/kiddin9/openwrt-bypass package/apps/openwrt-bypass
#git clone https://github.com/kiddin9/luci-theme-edge package/apps/luci-theme-edge
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-wxedge package/apps/luci-app-wxedge
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-iform package/apps/luci-lib-iform
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-taskd package/apps/luci-lib-taskd
svn co https://github.com/kiddin9/openwrt-packages/trunk/taskd package/apps/taskd
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-lib-xterm package/apps/luci-lib-xterm
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-lib-ipkg package/apps/luci-lib-ipkg
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-speedtest-web package/apps/luci-app-speedtest-web
svn co https://github.com/kiddin9/openwrt-packages/trunk/speedtest-web package/apps/speedtest-web
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ttnode package/apps/luci-app-ttnode
git clone https://github.com/sirpdboy/luci-app-lucky.git package/apps/lucky-openwrt
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-ddns-go package/apps/luci-app-ddns-go

#luci-app-bypass
#sed -i 's/luci-compat +luci-lib-ipkg +unzip +lua-maxminddb/luci-compat +unzip +lua-maxminddb/g' package/apps/openwrt-bypass/luci-app-bypass/Makefile

# luci-app-easymesh
#git clone https://github.com/ntlf9t/luci-app-easymesh package/apps/luci-app-easymesh
#sed -i 's/wpad-mesh-openssl/wpad-openssl/g' package/apps/luci-app-easymesh/Makefile

# 删除docker无脑初始化教程
sed -i '31,39d' feeds/luci/applications/luci-app-docker/po/zh-cn/docker.po
rm -rf feeds/luci/applications/luci-app-docker/root/www

# 晶晨宝盒
sed -i "s|https.*/amlogic-s9xxx-openwrt|https://github.com/breakings/OpenWrt|g" package/apps/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/opt/kernel|g" package/apps/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|s9xxx_lede|ARMv8|g" package/apps/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|.img.gz|..OPENWRT_SUFFIX|g" package/apps/luci-app-amlogic/root/etc/config/amlogic

# readd cpufreq for aarch64
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
sed -i 's/services/system/g'  feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua
sed -i 's/"CPU 性能优化调节"/"CPU 调频"/g'  feeds/luci/applications/luci-app-cpufreq/po/zh-cn/cpufreq.po

./scripts/feeds update -a
./scripts/feeds install -a
