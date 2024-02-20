#!/usr/bin/env bash

# Each service below is actually an agent or daemon
# that provides certain functionalities within macOS.
# Disabling them can help conserve system resources if
# you aren't using the corresponding features.
services=(
	# 'com.apple.CoreLocationAgent'
	# 'com.apple.networkserviceproxy-osx'
	# 'com.apple.networkserviceproxy'
	# 'com.apple.screensharing.agent'
	# 'com.apple.screensharing.menuextra'
	# 'com.apple.screensharing.MessagesAgent'
	# 'com.apple.screensharing'
	# 'com.apple.mediaremoted'
	'com.apple.accessibility.axassetsd'
	'com.apple.accessibility.heard'
	'com.apple.accessibility.MotionTrackingAgent'
	'com.apple.AddressBook.abd'
	'com.apple.AddressBook.ContactsAccountsService'
	'com.apple.AddressBook.SourceSync'
	'com.apple.AirPlayUIAgent'
	'com.apple.AMPArtworkAgent'
	'com.apple.AMPDeviceDiscoveryAgent'
	'com.apple.AMPLibraryAgent'
	'com.apple.amsengagementd'
	'com.apple.analyticsd'
	'com.apple.AOSHeartbeat'
	'com.apple.AOSPushRelay'
	'com.apple.ap.adprivacyd'
	'com.apple.ap.adservicesd'
	'com.apple.ap.promotedcontentd'
	'com.apple.applessdstatistics'
	'com.apple.appstoreagent'
	'com.apple.apsd'
	'com.apple.aslmanager'
	'com.apple.AssetCacheLocatorService'
	'com.apple.assistant_service'
	'com.apple.assistantd'
	'com.apple.audioanalyticsd '
	'com.apple.avconferenced'
	'com.apple.awacsd'
	'com.apple.awdd'
	'com.apple.backupd-helper'
	'com.apple.backupd'
	'com.apple.BiomeAgent'
	'com.apple.biomed'
	'com.apple.biomesyncd'
	'com.apple.bird'
	'com.apple.calaccessd'
	'com.apple.CalendarAgent'
	'com.apple.CallHistoryPluginHelper'
	'com.apple.CallHistorySyncHelper'
	'com.apple.cloudd'
	'com.apple.cloudfamilyrestrictionsd-mac'
	'com.apple.cloudpaird'
	'com.apple.cloudphotod'
	'com.apple.CloudPhotosConfiguration'
	'com.apple.cloudphotosd'
	'com.apple.CloudSettingsSyncAgent'
	'com.apple.CommCenter-osx'
	'com.apple.ContactsAgent'
	'com.apple.ContextStoreAgent'
	'com.apple.contextstored'
	'com.apple.coreduetd'
	'com.apple.coreservices.appleid.authentication'
	'com.apple.coreservices.useractivityd'
	'com.apple.corespeechd'
	'com.apple.CrashReporterSupportHelper'
	'com.apple.dataaccess.dataaccessd'
	'com.apple.diagnosticd'
	'com.apple.diagnosticextensionsd'
	'com.apple.DiagnosticReportCleanup'
	'com.apple.diagnostics_agent'
	'com.apple.dprivacyd'
	'com.apple.DumpGPURestart'
	'com.apple.DumpPanic'
	'com.apple.ensemble'
	'com.apple.EscrowSecurityAlert'
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familycontrols'
	'com.apple.familynotificationd'
	'com.apple.financed'
	'com.apple.findmymac '
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
	'com.apple.homeenergyd'
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
	'com.apple.idsremoteurlconnectionagent'
	'com.apple.imagent'
	'com.apple.imautomatichistorydeletionagent'
	'com.apple.IMLoggingAgent'
	'com.apple.imtransferagent'
	'com.apple.intelligenceplatformd'
	'com.apple.itunescloudd'
	'com.apple.iTunesHelper.launcher'
	'com.apple.knowledge-agent'
	'com.apple.locationmenu'
	'com.apple.logd'
	'com.apple.macos.studentd'
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.ManagedClientAgent.enrollagent'
	'com.apple.Maps.mapspushd'
	'com.apple.Maps.pushdaemon'
	'com.apple.mediaanalysisd'
	'com.apple.mediastream.mstreamd'
	'com.apple.mobileassetd '
	'com.apple.mobiledeviceupdater'
	'com.apple.nearbyd'
	'com.apple.netbiosd'
	'com.apple.newsd'
	'com.apple.newsyslog'
	'com.apple.notificationcenterui'
	'com.apple.nsurlsessiond'
	'com.apple.osanalytics.osanalyticshelper'
	'com.apple.parentalcontrols.check'
	'com.apple.parsec-fbf'
	'com.apple.parsecd'
	'com.apple.passd'
	'com.apple.pbs'
	'com.apple.peopled'
	'com.apple.PerfPowerServices '
	'com.apple.photoanalysisd'
	'com.apple.photolibraryd'
	'com.apple.powerlogHelperd'
	'com.apple.progressd'
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	'com.apple.rapportd-user'
	'com.apple.rapportd'
	'com.apple.remindd'
	'com.apple.ReportCrash.Root'
	'com.apple.ReportCrash.Self'
	'com.apple.ReportCrash'
	'com.apple.ReportMemoryException'
	'com.apple.ReportPanic'
	'com.apple.routined'
	'com.apple.rtcreportingd'
	'com.apple.SafariCloudHistoryPushAgent'
	'com.apple.safaridavclient'
	'com.apple.SafariNotificationAgent'
	'com.apple.sandboxd'
	'com.apple.ScreenTimeAgent'
	'com.apple.security.cloudkeychainproxy'
	'com.apple.security.cloudkeychainproxy3'
	'com.apple.sharingd'
	'com.apple.sidecar-hid-relay'
	'com.apple.sidecar-relay'
	'com.apple.Siri.agent'
	'com.apple.siri.context.service'
	'com.apple.siri.morphunassetsupdaterd'
	'com.apple.siriactionsd'
	'com.apple.siriinferenced'
	'com.apple.siriknowledged'
	'com.apple.SocialPushAgent'
	'com.apple.softwareupdate_notify_agent'
	'com.apple.spindump_agent'
	'com.apple.spindump'
	'com.apple.SubmitDiagInfo'
	'com.apple.suggestd'
	'com.apple.symptomsd-diag'
	'com.apple.symptomsd'
	'com.apple.syncdefaultsd'
	'com.apple.sysdiagnose_agent'
	'com.apple.sysdiagnose'
	'com.apple.syslogd'
	'com.apple.systemstats.analysis'
	'com.apple.systemstats.daily'
	'com.apple.tailspind '
	'com.apple.telephonyutilities.callservicesd'
	'com.apple.textunderstandingd'
	'com.apple.tipsd'
	'com.apple.TMCacheDelete'
	'com.apple.TMHelperAgent.SetupOffer'
	'com.apple.TMHelperAgent'
	'com.apple.transparencyd'
	'com.apple.triald.system'
	'com.apple.triald'
	'com.apple.TrustEvaluationAgent'
	'com.apple.universalaccessd'
	'com.apple.UsageTrackingAgent'
	'com.apple.videosubscriptionsd'
	'com.apple.voicebankingd'
	'com.apple.watchdogd '
	'com.apple.weatherd'
	'com.apple.wifianalyticsd'
	'com.apple.WiFiVelocityAgent'
	'com.apple.wifivelocityd '
	'com.apple.XProtect.daemon.scan.startup'
	'com.apple.XProtect.daemon.scan'
)

# Function to disable or enable services
manageServices() {
	local action=$1
	local userID=$2
	local plistPath

	userPlistPaths=(
		"${HOME}/Library/LaunchAgents/"
		"/Library/LaunchAgents/"
		"/System/Library/LaunchAgents/"
	)
	systemPlistPaths=(
		"/Library/LaunchDaemons/"
		"/System/Library/LaunchDaemons/"
	)

	# Helper function to handle the actions for a given service and domain
	handleServiceAction() {
		local domain=$1
		local service=$2
		local plistPath=$3
		local entry="${domain}/${service}"

		echo -n "${action^}: ${entry}"
		if [[ ${action} == "disable" ]]; then
			sudo launchctl bootout "${entry}" &>/dev/null || echo " - failed bootout"
			sudo launchctl disable "${entry}" || echo " - failed disable"
		elif [[ ${action} == "enable" ]]; then
			sudo launchctl enable "${entry}" || echo " - failed enable"
			sudo launchctl bootstrap "${domain}" "${plistPath}" &>/dev/null || echo " - failed bootstrap"
		fi
		sleep 0.1
	}

	for service in "${services[@]}"; do
		# Process user services
		for userPath in "${userPlistPaths[@]}"; do
			plistPath="${userPath}${service}.plist"
			if [[ -f ${plistPath} ]]; then
				handleServiceAction "gui/${userID}" "${service}" "${plistPath}"
			fi
		done
		# Process system services
		for systemPath in "${systemPlistPaths[@]}"; do
			plistPath="${systemPath}${service}.plist"
			if [[ -f ${plistPath} ]]; then
				handleServiceAction "system" "${service}" "${plistPath}"
			fi
		done
	done
}

# Function to apply or revert system tweaks
manageTweaks() {
	local action=$1
	# Map tweak keys to their respective domains and values
	tweaks=(
		# Disables the automatic restoration of apps after logout or shutdown
		"com.apple.loginwindow TALLogoutSavesState -bool false"
		# Prevents applications from automatically reopening upon login
		"com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false"
		# Turns off window opening and closing animations
		"NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false"
		# Reduces the time it takes to resize windows
		"NSGlobalDomain NSWindowResizeTime -float 0.001"
		# Disables the animation for Quick Look panels
		"-g QLPanelAnimationDuration -float 0"
		# Sets the Dock auto-hide and show delay to zero (making it react instantly)
		"com.apple.dock autohide-time-modifier -float 0"
		# Sets the delay before Dock auto-hide begins
		"com.apple.dock autohide-delay -float 0"
		# Disables bouncing animation for Dock icons
		"com.apple.dock no-bouncing -bool true"
		# Disables the opening animation for applications from the Dock
		"com.apple.dock launchanim -bool false"
		# Turns off auto-check for software updates
		"com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false"
		# Disables automatic download of software updates
		"com.apple.SoftwareUpdate AutomaticDownload -bool false"
		# Prevents automatic installation of app updates
		"com.apple.commerce AutoUpdate -bool false"
		# Disables automatic reboot to install macOS updates
		"com.apple.commerce AutoUpdateRestartRequired -bool false"
		# Disables automatic installation of critical security updates
		"com.apple.SoftwareUpdate CriticalUpdateInstall -bool false"
		# Disable certificate checking
		"com.apple.security.revocation.plist OCSPStyle None"
		"com.apple.security.revocation.plist CRLStyle None"
		# Disable the "Are you sure you want to open this application?" dialog
		"com.apple.LaunchServices LSQuarantine -bool false"
	)

	for cmd in "${tweaks[@]}"; do
		# Read the command into the domain, subkey, and the rest
		read -r domain subkey rest <<<"${cmd}"

		echo "${action^}: ${domain} ${subkey}"
		if [[ ${action} == "disable" ]]; then
			if defaults write "${domain}" "${subkey}" "${rest}"; then
				echo "Successfully disabled: ${domain} ${subkey}"
			else
				echo "Failed to disable: ${domain} ${subkey}" >&2
			fi
		elif [[ ${action} == "enable" ]]; then
			echo "Reverting tweak: ${domain} ${subkey}"
			if defaults delete "${domain}" "${subkey}" 2>/dev/null; then
				echo "Successfully reverted: ${domain} ${subkey}"
			else
				echo "No existing setting to revert or failed to revert: ${domain} ${subkey}" >&2
			fi
		fi
		sleep 0.1
	done

	# Throttling tweak can be uncommented if needed
	# [[ ${action} == "disable" ]] && sudo sysctl -w debug.lowpri_throttle_enabled=0
	# [[ ${action} == "enable" ]] && sudo sysctl -w debug.lowpri_throttle_enabled=1
}

# Main function to process the command line action
main() {
	local action=$1
	local launchctlAction

	if [[ ${action} == "--revert" ]]; then
		manageServices "enable" "${UID}"
		manageTweaks "enable"
		launchctlAction="load"
	else
		manageServices "disable" "${UID}"
		manageTweaks "disable"
		launchctlAction="unload"
	fi

	# Load/unload dock based
	launchctl "${launchctlAction}" /System/Library/LaunchAgents/com.apple.Dock.plist
}

main "$@"
