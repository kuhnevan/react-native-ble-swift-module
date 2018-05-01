//
//  beacon_tracker.swift
//  iBeacon Distance Tracker
//
//  Created by Evan Kuhn on 4/24/18.
//  Copyright © 2018 Evan Kuhn. All rights reserved.
//

import Foundation
import CoreLocation

@objc(BeaconTracker)
class BeaconTracker : NSObject, CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!
    
    // Give the beacons a default value
    var beacon1Rssi : Int = -1 // minor = 8000
    var beacon2Rssi : Int = -1 // minor = 8001
    var beacon3Rssi : Int = -1 // minor = 1035
    
    @objc
    func getBeaconRssis(success: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> void {
        initializeManager()
        perform(#selector(stopManager), with: null, afterDelay: 5)
        success(["8000": beacon1Rssi, "8001": beacon2Rssi, "1035": beacon3Rssi])
    }
    
    func initializeManager() {
        locationManager = CLLocationManager.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        startScanningForBeaconRegion(beaconRegion: getBeaconRegion1())
        startScanningForBeaconRegion(beaconRegion: getBeaconRegion2())
    }
    
    func stopManager() {
        stopScanningForBeaconRegion(beaconRegion: getBeaconRegion1())
        stopScanningForBeaconRegion(beaconRegion: getBeaconRegion2())
    }
    
    func getBeaconRegion1() -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
                                               identifier: "8a802f6d9231dfaedfb6ccf43d2ce325")
        return beaconRegion
    }
    
    func getBeaconRegion2() -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
                                               identifier: "8bbbc1e8d4beb611dc7c0aa0e3a05829")
        return beaconRegion
    }
    
    func startScanningForBeaconRegion(beaconRegion: CLBeaconRegion) {
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func stopScanningForBeaconRegion(beaconRegion: CLBeaconRegion) {
        locationManager.stopRangingBeacons(in: beaconRegion)
        locationManager.stopMonitoring(for: beaconRegion)
    }
    
    // Delegate Methods
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            for beacon in beacons {
                let minor = beacon.minor
                if minor == 8000 {
                    beacon1Rssi = beacon.rssi
                } else if minor == 8001 {
                    beacon2Rssi = beacon.rssi
                } else if minor == 1035 {
                    beacon3Rssi = beacon.rssi
                }
            }
            // stopScanningForBeaconRegion(beaconRegion: getBeaconRegion())
        }
        print("Ranging")
    }
}
