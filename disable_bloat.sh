#!/bin/bash

# Each service below is actually an agent or daemon
# that provides certain functionalities within macOS.
# Disabling them can help conserve system resources if
# you aren't using the corresponding features.
userServices=(
	# Motion tracking for accessibility features
	'com.apple.accessibility.MotionTrackingAgent'
	# Contacts and accounts integration
	'com.apple.AddressBook.ContactsAccountsService'
	# Related to Apple Music artwork
	'com.apple.AMPArtworkAgent'
	# Detects and configures devices for Apple Music
	'com.apple.AMPDeviceDiscoveryAgent'
	# Library agent for Apple Music
	'com.apple.AMPLibraryAgent'
	# User Privacy and Ad-related services
	'com.apple.ap.adprivacyd'
	'com.apple.ap.adservicesd'
	'com.apple.ap.promotedcontentd'
	# Siri and voice recognition services
	'com.apple.assistant_service'
	'com.apple.assistantd'
	# Video conferencing service
	'com.apple.avconferenced'
	# Biome and privacy-related agents
	'com.apple.BiomeAgent'
	'com.apple.biomesyncd'
	# Calendar agents and notifications
	'com.apple.CalendarAgent'
	'com.apple.calaccessd'
	# Call history management
	'com.apple.CallHistoryPluginHelper'
	# iCloud Drive sync service
	'com.apple.cloudd'
	# Pairing service for Apple devices
	'com.apple.cloudpaird'
	# iCloud photo syncing services
	'com.apple.cloudphotod'
	'com.apple.CloudPhotosConfiguration'
	# Cloud settings synchronization agent
	'com.apple.CloudSettingsSyncAgent'
	# Cellular communication management on macOS
	'com.apple.CommCenter-osx'
	# Contact management services
	'com.apple.ContactsAgent'
	# Location services
	'com.apple.CoreLocationAgent'
	# Data access and sync for calendar and contacts
	'com.apple.dataaccess.dataaccessd'
	# Dictation and language processing
	'com.apple.ensemble'
	# Family sharing and parental control services
	'com.apple.familycircled'
	'com.apple.familycontrols.useragent'
	'com.apple.familynotificationd'
	# Financial data management for Apple services
	'com.apple.financed'
	# Service that manages app follow-ups
	'com.apple.followupd'
	# Game Center service
	'com.apple.gamed'
	# Geographic information service for location-based apps
	'com.apple.geod'
	'com.apple.geodMachServiceBridge'
	# HomeKit service management
	'com.apple.homed'
	# iCloud services
	'com.apple.iCloudUserNotifications'
	'com.apple.icloud.findmydeviced.aps-demo'
	'com.apple.icloud.findmydeviced.aps-development'
	'com.apple.icloud.findmydeviced.aps-production'
	'com.apple.icloud.findmydeviced.findmydevice-user-agent'
	'com.apple.icloud.findmydeviced.ua-services'
	'com.apple.icloud.findmydeviced'
	'com.apple.icloud.fmfd'
	# Search party user agent for finding devices
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
	# Instant messaging service
	'com.apple.imagent'
	# Automatic history deletion for iMessage
	'com.apple.imautomatichistorydeletionagent'
	# Agent for file transfers via iMessage
	'com.apple.imtransferagent'
	# Siri intelligence and personalized suggestions
	'com.apple.intelligenceplatformd'
	# iTunes in the Cloud service
	'com.apple.itunescloudd'
	# Knowledge base for machine learning on device
	'com.apple.knowledge-agent'
	# Managed client and cloud configuration services
	'com.apple.ManagedClient.cloudconfigurationd'
	'com.apple.ManagedClientAgent.enrollagent'
	# Maps services for notification and real-time updates
	'com.apple.Maps.mapspushd'
	'com.apple.Maps.pushdaemon'
	# Service for analyzing media and photos
	'com.apple.mediaanalysisd'
	# Proxy service for network services
	'com.apple.networkserviceproxy'
	'com.apple.networkserviceproxy-osx'
	# Media streaming daemon for iCloud services
	'com.apple.mediastream.mstreamd'
	# News app services
	'com.apple.newsd'
	# URL session service
	'com.apple.nsurlsessiond'
	# Parsec services related to Spotlight suggestions
	'com.apple.parsec-fbf'
	'com.apple.parsecd'
	# Wallet and Apple Pay services
	'com.apple.passd'
	# Photo analysis for the Photos app
	'com.apple.photoanalysisd'
	# Photo library service
	'com.apple.photolibraryd'
	# App progress and status management
	'com.apple.progressd'
	# iCloud key syncing for protected data
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	# Rapport for proximity-based interactions with devices
	'com.apple.rapportd-user'
	# Reminders app service
	'com.apple.remindd'
	# Route tracking for location history and habits
	'com.apple.routined'
	# Safari and iCloud history synchronization
	'com.apple.SafariCloudHistoryPushAgent'
	# Screensharing services for remote access/control
	'com.apple.screensharing.agent'
	'com.apple.screensharing.menuextra'
	'com.apple.screensharing.MessagesAgent'
	# ScreenTime tracking and control services
	'com.apple.ScreenTimeAgent'
	# iCloud keychain syncing agent
	'com.apple.security.cloudkeychainproxy3'
	# Sharing services for AirDrop, Handoff, etc.
	'com.apple.sharingd'
	# Sidecar services for using iPad as a secondary display
	'com.apple.sidecar-hid-relay'
	'com.apple.sidecar-relay'
	# Siri's background agent
	'com.apple.Siri.agent'
	# Management of Siri usage context
	'com.apple.siri.context.service'
	'com.apple.siriknowledged'
	'com.apple.suggestd'
	# Student management services for education
	'com.apple.macos.studentd'
	# Knowledge management for Siri
	'com.apple.siriknowledged'
	# Suggestion service based on usage and search patterns
	'com.apple.suggestd'
	# Tips app service
	'com.apple.tipsd'
	# Telephony services for managing calls on macOS
	'com.apple.telephonyutilities.callservicesd'
	# Time Machine helper agents
	'com.apple.TMHelperAgent'
	'com.apple.TMHelperAgent.SetupOffer'
	# Trial software and demo functionality
	'com.apple.triald'
	# Accessibility services agent
	'com.apple.universalaccessd'
	# Usage tracking agent for reporting app usage
	'com.apple.UsageTrackingAgent'
	# Video subscriptions and streaming service
	'com.apple.videosubscriptionsd'
	# Measures and improves Wi-Fi performance
	'com.apple.WiFiVelocityAgent'
	# Weather service for providing weather updates
	'com.apple.weatherd'
)

# QuickLook related services
# 'com.apple.quicklook'
# 'com.apple.quicklook.ui.helper'
# 'com.apple.quicklook.ThumbnailsAgent'

# System services to enable/disable
systemServices=(
	# Backup daemon for Time Machine
	'com.apple.backupd'
	# Time Machine helper process for managing backups
	'com.apple.backupd-helper'
	# iCloud Drive syncing and storage management
	'com.apple.cloudd'
	# Service for pairing with iCloud and Apple devices
	'com.apple.cloudpaird'
	# iCloud Photo Library service for syncing photos
	'com.apple.cloudphotod'
	# Configuration for iCloud Photos services
	'com.apple.CloudPhotosConfiguration'
	# Location services to manage location-related requests
	'com.apple.CoreLocationAgent'
	# Data fusion and pattern-learning service
	'com.apple.coreduetd'
	# Parental controls to manage user access and restrictions
	'com.apple.familycontrols'
	# Messaging service to support Find My Mac
	'com.apple.findmymacmessenger'
	# Service that manages follow-up activities for apps
	'com.apple.followupd'
	# FollowUp UI for managing follow-up reminders
	'com.apple.FollowUpUI'
	# FTP proxy service for sharing files over networks
	'com.apple.ftp-proxy'
	# FTP daemon to support FTP server functionality
	'com.apple.ftpd'
	# Game controller daemon for managing game controller events
	'com.apple.GameController.gamecontrollerd'
	# Service dealing with iCloud Keychain syncing
	'com.apple.icloud.fmfd'
	# Service to manage and locate lost devices with iCloud integration
	'com.apple.icloud.searchpartyd'
	# Service managing iTunes content in the Cloud
	'com.apple.itunescloudd'
	# Manages enterprise and configuration profiles
	'com.apple.ManagedClient.cloudconfigurationd'
	# NetBIOS daemon for legacy Windows networking support
	'com.apple.netbiosd'
	# Handles URLSession tasks in the background
	'com.apple.nsurlsessiond'
	# Syncs iCloud Keychain and protected data
	'com.apple.protectedcloudstorage.protectedcloudkeysyncing'
	# Service for connectivity between Apple devices using wireless
	'com.apple.rapportd'
	# Provides functionality for Screen Sharing features
	'com.apple.screensharing'
	# iCloud Keychain proxy service for syncing keychains
	'com.apple.security.cloudkeychainproxy3'
	# Service that updates assets for Siri such as voices and data
	'com.apple.siri.morphunassetsupdaterd'
	# Siri inference daemon to improve suggestions and functionality
	'com.apple.siriinferenced'
	# System trial daemon for managing trials and demos
	'com.apple.triald.system'
	# WiFi analytics service for collecting WiFi network performance
	'com.apple.wifianalyticsd'
)

# Function to manage launchctl services using bootstrap/bootout and enable/disable
manageServices() {
	local action=$1
	local domain=$2 # Pass "user" or "system" as domain
	local userID=$3 # Pass the user ID for user services, ignored for system services
	local services=("${@:4}")
	local base_cmd="sudo launchctl"

	for service in "${services[@]}"; do
		if [[ ${action} == "disable" ]]; then
			echo "Disabling service in domain ${domain}: ${service}"
			# ${base_cmd} bootout "${domain}/${userID}/${service}" &>/dev/null || true
			${base_cmd} disable "${domain}/${userID}/${service}"
		else
			echo "Enabling service in domain ${domain}: ${service}"
			${base_cmd} enable "${domain}/${userID}/${service}"
			# ${base_cmd} bootstrap "${domain}/${userID}/${service}" &>/dev/null || true
		fi
	done
}

# Function to apply/revert tweaks
manageTweaks() {
	local action=$1

	if [[ ${action} == "disable" ]]; then
		# Disables the automatic restoration of apps after logging out or shutting down.
		# This means applications that were open before logout or shutdown won't automatically reopen.
		defaults write "com.apple.loginwindow TALLogoutSavesState" -bool false
		defaults write "com.apple.loginwindow LoginwindowLaunchesRelaunchApps" -bool false
		# Turns off window opening and closing animations to improve system responsiveness.
		defaults write "NSGlobalDomain NSAutomaticWindowAnimationsEnabled" -bool false
		# Reduces the time it takes to resize windows to near-instant (0.001 seconds).
		defaults write "NSGlobalDomain NSWindowResizeTime" -float 0.001
		# Disables the animation for Quick Look panels, making them appear instantly.
		defaults write "-g QLPanelAnimationDuration" -float 0
		# Sets the Dock auto-hide and show delay to zero, making it react instantly.
		defaults write "com.apple.dock autohide-time-modifier" -float 0
		# Disables the Dock launching animation when opening applications.
		defaults write "com.apple.dock launchanim" -bool false
		# Disables the low-priority CPU throttle, giving processes full CPU priority.
		# Use with caution as it can affect the system's thermal and power characteristics.
		sudo sysctl -w debug.lowpri_throttle_enabled=0
	else
		defaults delete "com.apple.loginwindow TALLogoutSavesState"
		defaults delete "com.apple.loginwindow LoginwindowLaunchesRelaunchApps"
		defaults delete "NSGlobalDomain NSAutomaticWindowAnimationsEnabled"
		defaults delete "NSGlobalDomain NSWindowResizeTime"
		defaults delete "-g QLPanelAnimationDuration"
		defaults delete "com.apple.dock autohide-time-modifier"
		defaults delete "com.apple.dock launchanim"
		sudo sysctl -w debug.lowpri_throttle_enabled=1
	fi
}

# Main function
main() {
	if [[ ${action} == "--revert" ]]; then
		manageServices "enable" "gui" "${UID}" "${userServices[@]}"
		manageServices "enable" "system" "" "${systemServices[@]}"
        manageTweaks "enable"
		# Unload cloud services
		launchctl unload -w /System/Library/LaunchAgents/com.apple.cloudpaird.plist
		# Unload dock
		launchctl unload -w /System/Library/LaunchAgents/com.apple.dock.plist
	else
		manageServices "disable" "gui" "${UID}" "${userServices[@]}"
		manageServices "disable" "system" "" "${systemServices[@]}"
		manageTweaks "disable"
		launchctl load -w /System/Library/LaunchAgents/com.apple.cloudpaird.plist
		launchctl load -w /System/Library/LaunchAgents/com.apple.dock.plist
	fi
}

main "$@"
