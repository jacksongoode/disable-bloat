#!/bin/bash

# User services to enable/disable
userServices=(
	'com.apple.accessibility.MotionTrackingAgent'
	'com.apple.AddressBook.ContactsAccountsService'
	'com.apple.AMPArtworkAgent'
	'com.apple.AMPDeviceDiscoveryAgent'
	'com.apple.AMPLibraryAgent'
	'com.apple.ap.adprivacyd'
	'com.apple.ap.adservicesd'
	'com.apple.ap.promotedcontentd'
	'com.apple.assistant_service'
	'com.apple.assistantd'
	'com.apple.avconferenced'
	'com.apple.BiomeAgent'
	'com.apple.biomesyncd'
	'com.apple.CalendarAgent'
	'com.apple.calaccessd'
	'com.apple.CallHistoryPluginHelper'
	'com.apple.cloudd'
	'com.apple.cloudpaird'
	'com.apple.cloudphotod'
	'com.apple.CloudPhotosConfiguration'
	'com.apple.CloudSettingsSyncAgent'
	'com.apple.CommCenter-osx'
	'com.apple.ContactsAgent'
	'com.apple.CoreLocationAgent'
	'com.apple.dataaccess.dataaccessd'
	'com.apple.ensemble'
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familynotificationd'
	'com.apple.financed'
	'com.apple.followupd'
	'com.apple.gamed'
	'com.apple.geod'
	'com.apple.geodMachServiceBridge'
	'com.apple.homed'
	'com.apple.icloud.fmfd'
	'com.apple.iCloudNotificationAgent'
	'com.apple.iCloudUserNotifications'
	'com.apple.icloud.searchpartyuseragent'
	'com.apple.imagent'
	'com.apple.imautomatichistorydeletionagent'
	'com.apple.imtransferagent'
	'com.apple.intelligenceplatformd'
	'com.apple.itunescloudd'
	'com.apple.knowledge-agent'
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.ManagedClientAgent.enrollagent'
	'com.apple.Maps.mapspushd'
	'com.apple.Maps.pushdaemon'
	'com.apple.mediaanalysisd'
	'com.apple.networkserviceproxy'
	'com.apple.networkserviceproxy-osx'
	'com.apple.mediastream.mstreamd'
	'com.apple.newsd'
	'com.apple.nsurlsessiond'
	'com.apple.parsec-fbf'
	'com.apple.parsecd'
	'com.apple.passd'
	'com.apple.photoanalysisd'
	'com.apple.photolibraryd'
	'com.apple.progressd'
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	'com.apple.rapportd-user'
	'com.apple.remindd'
	'com.apple.routined'
	'com.apple.SafariCloudHistoryPushAgent'
	'com.apple.screensharing.agent'
	'com.apple.screensharing.menuextra'
	'com.apple.screensharing.MessagesAgent'
	'com.apple.ScreenTimeAgent'
	'com.apple.security.cloudkeychainproxy3'
	'com.apple.sharingd'
	'com.apple.sidecar-hid-relay'
	'com.apple.sidecar-relay'
	'com.apple.Siri.agent'
	'com.apple.siri.context.service'
	'com.apple.macos.studentd'
	'com.apple.siriknowledged'
	'com.apple.suggestd'
	'com.apple.tipsd'
	'com.apple.telephonyutilities.callservicesd'
	'com.apple.TMHelperAgent'
	'com.apple.TMHelperAgent.SetupOffer'
	'com.apple.triald'
	'com.apple.universalaccessd'
	'com.apple.UsageTrackingAgent'
	'com.apple.videosubscriptionsd'
	'com.apple.WiFiVelocityAgent'
	'com.apple.weatherd'
)
# 'com.apple.quicklook'
# 'com.apple.quicklook.ui.helper'
# 'com.apple.quicklook.ThumbnailsAgent'

# System services to enable/disable
systemServices=(
	'com.apple.bootpd'
	'com.apple.backupd'
	'com.apple.backupd-helper'
	'com.apple.cloudd'
	'com.apple.cloudpaird'
	'com.apple.cloudphotod'
	'com.apple.CloudPhotosConfiguration'
	'com.apple.CoreLocationAgent'
	'com.apple.coreduetd'
	'com.apple.familycontrols'
	'com.apple.findmymacmessenger'
	'com.apple.followupd'
	'com.apple.FollowUpUI'
	'com.apple.ftp-proxy'
	'com.apple.ftpd'
	'com.apple.GameController.gamecontrollerd'
	'com.apple.icloud.fmfd'
	'com.apple.icloud.searchpartyd'
	'com.apple.itunescloudd'
	'com.apple.locationd'
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.networkserviceproxy'
	'com.apple.netbiosd'
	'com.apple.nsurlsessiond'
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	'com.apple.rapportd'
	'com.apple.screensharing'
	'com.apple.security.cloudkeychainproxy3'
	'com.apple.siri.morphunassetsupdaterd'
	'com.apple.siriinferenced'
	'com.apple.triald.system'
	'com.apple.wifianalyticsd'
)
# 'com.apple.dhcp6d'

# Function to enable/disable services
configServices() {
	local action=$1
	local path=$2
	local services=$3

	if [[ ${action} == "disable" ]]; then
		cmd="bootout"
	else
		cmd="bootstrap"
	fi

	for service in "${services[@]}"; do
		sudo launchctl "${cmd}" "${path}"/"${service}"
		sudo launchctl "${action}" "${path}"/"${service}"
	done
}

# Function to apply/revert tweaks
configTweaks() {
	local action=$1

	if [[ ${action} == "default" ]]; then
		defaults delete "NSGlobalDomain NSAutomaticWindowAnimationsEnabled"
		defaults delete "NSGlobalDomain NSWindowResizeTime"
		defaults delete "-g QLPanelAnimationDuration"
		defaults delete "com.apple.dock autohide-time-modifier"
		defaults delete "com.apple.dock launchanim"
		sudo sysctl -w debug.lowpri_throttle_enabled=1
	else
		defaults write "NSGlobalDomain NSAutomaticWindowAnimationsEnabled" -bool false
		defaults write "NSGlobalDomain NSWindowResizeTime" -float 0.001
		defaults write "-g QLPanelAnimationDuration" -float 0
		defaults write "com.apple.dock autohide-time-modifier" -float 0
		defaults write "com.apple.dock launchanim" -bool false
		sudo sysctl -w debug.lowpri_throttle_enabled=0
	fi
}

# Main function
main() {
	if [[ $1 == "--revert" ]]; then
		action="default"
	else
		action="disable"
	fi

	configTweaks "${action}"
	configServices "${action}" "gui/501" userServices
	configServices "${action}" "system" systemServices

	if [[ $1 != "--revert" ]]; then
		launchctl unload -w /System/Library/LaunchAgents/com.apple.cloudpaird.plist
	else
		launchctl load -w /System/Library/LaunchAgents/com.apple.cloudpaird.plist
	fi
}

main "$@"
