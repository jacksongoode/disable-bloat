#!/bin/bash

# Each service below is actually an agent or daemon
# that provides certain functionalities within macOS.
# Disabling them can help conserve system resources if
# you aren't using the corresponding features.
services=(
	'com.apple.accessibility.MotionTrackingAgent'
	'com.apple.AddressBook.abd'
	'com.apple.AddressBook.ContactsAccountsService'
	'com.apple.AMPArtworkAgent'
	'com.apple.AMPDeviceDiscoveryAgent'
	'com.apple.AMPLibraryAgent'
	'com.apple.ap.adprivacyd'
	'com.apple.ap.adservicesd'
	'com.apple.ap.promotedcontentd'
	'com.apple.appstoreagent'
	'com.apple.assistant_service'
	'com.apple.assistantd'
	'com.apple.avconferenced'
	'com.apple.backupd-helper'
	'com.apple.backupd'
	'com.apple.BiomeAgent'
	'com.apple.biomesyncd'
	'com.apple.calaccessd'
	'com.apple.CalendarAgent'
	'com.apple.CallHistoryPluginHelper'
	'com.apple.cloudd'
	'com.apple.cloudpaird'
	'com.apple.cloudphotod'
	'com.apple.CloudPhotosConfiguration'
	'com.apple.CloudSettingsSyncAgent'
	'com.apple.CommCenter-osx'
	'com.apple.ContactsAgent'
	'com.apple.coreduetd'
	'com.apple.CoreLocationAgent'
	'com.apple.dataaccess.dataaccessd'
	'com.apple.DiagnosticReportCleanup.plist'
	'com.apple.ensemble'
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familycontrols'
	'com.apple.familynotificationd'
	'com.apple.financed'
	'com.apple.findmymacmessenger'
	'com.apple.followupd'
	'com.apple.FollowUpUI'
	'com.apple.ftp-proxy'
	'com.apple.ftpd'
	'com.apple.GameController.gamecontrollerd'
	'com.apple.gamed'
	'com.apple.geod'
	'com.apple.geodMachServiceBridge'
	'com.apple.helpd'
	'com.apple.homed'
	'com.apple.icloud.findmydeviced.aps-demo'
	'com.apple.icloud.findmydeviced.aps-development'
	'com.apple.icloud.findmydeviced.aps-production'
	'com.apple.icloud.findmydeviced.findmydevice-user-agent'
	'com.apple.icloud.findmydeviced.ua-services'
	'com.apple.icloud.findmydeviced'
	'com.apple.icloud.fmfd'
	'com.apple.icloud.searchpartyd.accessorydiscoverymanager'
	'com.apple.icloud.searchpartyd.advertisementcache'
	'com.apple.icloud.searchpartyd.beaconmanager.agentdaemoninternal'
	'com.apple.icloud.searchpartyd.beaconmanager'
	'com.apple.icloud.searchpartyd.finderstatemanager'
	'com.apple.icloud.searchpartyd.pairingmanager'
	'com.apple.icloud.searchpartyd.scheduler'
	'com.apple.icloud.searchpartyd'
	'com.apple.icloud.searchpartyuseragent'
	'com.apple.iCloudNotificationAgent'
	'com.apple.iCloudUserNotifications'
	'com.apple.imagent'
	'com.apple.imautomatichistorydeletionagent'
	'com.apple.imtransferagent'
	'com.apple.intelligenceplatformd'
	'com.apple.itunescloudd'
	'com.apple.iTunesHelper.launcher'
	'com.apple.knowledge-agent'
	'com.apple.macos.studentd'
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.ManagedClientAgent.enrollagent'
	'com.apple.Maps.mapspushd'
	'com.apple.Maps.pushdaemon'
	'com.apple.mediaanalysisd'
	'com.apple.mediastream.mstreamd'
	'com.apple.mobiledeviceupdater'
	'com.apple.netbiosd'
	'com.apple.networkserviceproxy-osx'
	'com.apple.networkserviceproxy'
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
	'com.apple.rapportd'
	'com.apple.remindd'
	'com.apple.ReportCrash.Self'
	'com.apple.ReportCrash'
	'com.apple.ReportPanic'
	'com.apple.routined'
	'com.apple.SafariCloudHistoryPushAgent'
	'com.apple.screensharing.agent'
	'com.apple.screensharing.menuextra'
	'com.apple.screensharing.MessagesAgent'
	'com.apple.screensharing'
	'com.apple.ScreenTimeAgent'
	'com.apple.security.cloudkeychainproxy3'
	'com.apple.sharingd'
	'com.apple.sidecar-hid-relay'
	'com.apple.sidecar-relay'
	'com.apple.Siri.agent'
	'com.apple.siri.context.service'
	'com.apple.siri.morphunassetsupdaterd'
	'com.apple.siriinferenced'
	'com.apple.siriknowledged'
	'com.apple.softwareupdate_notify_agent'
	'com.apple.suggestd'
	'com.apple.telephonyutilities.callservicesd'
	'com.apple.tipsd'
	'com.apple.TMHelperAgent.SetupOffer'
	'com.apple.TMHelperAgent'
	'com.apple.triald.system'
	'com.apple.triald'
	'com.apple.TrustEvaluationAgent'
	'com.apple.universalaccessd'
	'com.apple.UsageTrackingAgent'
	'com.apple.videosubscriptionsd'
	'com.apple.weatherd'
	'com.apple.wifianalyticsd'
	'com.apple.WiFiVelocityAgent'
	# 'com.apple.quicklook.ThumbnailsAgent'
	# 'com.apple.quicklook.ui.helper'
	# 'com.apple.quicklook'
)

# Function to manage launchctl services by checking the existence of .plist files
manageServices() {
	local action=$1
	local userID=$2 # Pass the user ID for user services
	local services=("${@:3}")
	local base_cmd="sudo launchctl"

	userPlistPaths=(
		"${HOME}/Library/LaunchAgents/"
		"/Library/LaunchAgents/"
		"/System/Library/LaunchAgents/"
	)
	systemPlistPaths=(
		"/Library/LaunchDaemons/"
		"/System/Library/LaunchDaemons/"
	)

	for service in "${services[@]}"; do
		found=0
		target=""
		sleepTime=0

		# Check user plist paths
		if [[ ${action} == "disable" ]]; then
			for path in "${userPlistPaths[@]}"; do
				if [[ -f "${path}${service}.plist" ]]; then
					target="user/${userID}/${service}"
					found=1
					break
				fi
			done
		fi

		if [[ ${action} == "enable" || ${found} -eq 0 ]]; then
			# Check system plist paths if enabling or not found in user paths
			for path in "${systemPlistPaths[@]}"; do
				if [[ -f "${path}${service}.plist" ]]; then
					target="system/${service}"
					found=1
					break
				fi
			done
		fi

		sleepTime=0.5
		if [[ ${found} -eq 1 ]]; then
			if [[ ${action} == "disable" ]]; then
				echo "Disabling service: ${service}"
				${base_cmd} bootout "${target}" && sleep "${sleepTime}"
				${base_cmd} disable "${target}"
			elif [[ ${action} == "enable" ]]; then
				echo "Enabling service: ${service}"
				${base_cmd} enable "${target}"
				${base_cmd} bootstrap "${target}" && sleep "${sleepTime}"
			fi
		else
			echo "Service not found: ${service}"
		fi
	done
}

# Function to apply/revert tweaks
manageTweaks() {
	local action=$1

	if [[ ${action} == "disable" ]]; then
		# Disables the automatic restoration of apps after logging out or shutting down.
		# This means applications that were open before logout or shutdown won't automatically reopen.
		defaults write com.apple.loginwindow TALLogoutSavesState -bool false
		defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

		# Turns off window opening and closing animations to improve system responsiveness.
		defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
		# Reduces the time it takes to resize windows to near-instant (0.001 seconds).
		defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
		# Disables the animation for Quick Look panels, making them appear instantly.
		defaults write -g QLPanelAnimationDuration -float 0

		# Sets the Dock auto-hide and show delay to zero, making it react instantly.
		defaults write com.apple.dock autohide-time-modifier -float 0
		defaults write com.apple.dock autohide-delay -float 60
		# Disables the Dock bouncing.
		defaults write com.apple.dock no-bouncing -bool true
		# Disables the Dock launching animation when opening applications.
		defaults write com.apple.dock launchanim -bool false

		# Disables the low-priority CPU throttle, giving processes full CPU priority.
		# Use with caution as it can affect the system's thermal and power characteristics.
		# sudo sysctl -w debug.lowpri_throttle_enabled=0

		# Auto check for updates
		defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
		# Auto download updates in background
		defaults write com.apple.SoftwareUpdate AutomaticDownload -bool false
		# Don't install App updates automatically
		defaults write com.apple.commerce AutoUpdate -bool false
		# Don't install MacOS updates automatically
		defaults write com.apple.commerce AutoUpdateRestartRequired -bool false
		# Don't install Security updates automatically
		defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -bool false
	else
		defaults delete com.apple.loginwindow TALLogoutSavesState
		defaults delete com.apple.loginwindow LoginwindowLaunchesRelaunchApps

		defaults delete NSGlobalDomain NSAutomaticWindowAnimationsEnabled
		defaults delete NSGlobalDomain NSWindowResizeTime
		defaults delete -g QLPanelAnimationDuration

		defaults delete com.apple.dock autohide-time-modifier
		defaults delete com.apple.dock autohide-delay
		defaults delete com.apple.dock no-bouncing
		defaults delete com.apple.dock launchanim

		# sudo sysctl -w debug.lowpri_throttle_enabled=1

		defaults delete com.apple.SoftwareUpdate AutomaticCheckEnabled
		defaults delete com.apple.SoftwareUpdate AutomaticDownload
		defaults delete com.apple.commerce AutoUpdate
		defaults delete com.apple.commerce AutoUpdateRestartRequired
		defaults delete com.apple.SoftwareUpdate CriticalUpdateInstall
	fi
}

# Check if service is user/system
checkDomain() {
	userPlistPaths=(
		"${HOME}/Library/LaunchAgents/" # User agents
		"/Library/LaunchAgents/"        # User agents installed by third-party applications
		"/System/Library/LaunchAgents/" # Protected Apple-provided user agents
	)

	systemPlistPaths=(
		"/Library/LaunchDaemons/"        # Third-party system daemons
		"/System/Library/LaunchDaemons/" # Apple system daemons
	)

	# Check for presence of service plist files
	for service in "${services[@]}"; do
		userFound=0
		systemFound=0

		# Check user plist paths
		for path in "${userPlistPaths[@]}"; do
			if [[ -f "${path}${service}.plist" ]]; then
				userFound=1
				break
			fi
		done

		# Check system plist paths
		for path in "${systemPlistPaths[@]}"; do
			if [[ -f "${path}${service}.plist" ]]; then
				systemFound=1
				break
			fi
		done

		# Report results
		if [[ ${userFound} -eq 1 ]] && [[ ${systemFound} -eq 1 ]]; then
			echo "Both:      ${service}"
		elif [[ ${userFound} -eq 1 ]]; then
			echo "User:      ${service}"
		elif [[ ${systemFound} -eq 1 ]]; then
			echo "System:    ${service}"
		else
			echo "Not found: ${service}"
		fi
	done
}

# Main function
main() {

	if [[ ${action} == "--revert" ]]; then
		manageServices "enable" "${UID}" "${services[@]}"
		manageTweaks "enable"
		launchctl load -w /System/Library/LaunchAgents/com.apple.cloudpaird.plist
		launchctl load -w /System/Library/LaunchAgents/com.apple.dock.plist
	else
		manageServices "disable" "${UID}" "${services[@]}"
		manageTweaks "disable"
		# Unload cloud services & dock
		launchctl unload -w /System/Library/LaunchAgents/com.apple.cloudpaird.plist
		launchctl unload -w /System/Library/LaunchAgents/com.apple.dock.plist
	fi
}

main "$@"
