//
//  react_native-ble-swift-module.m
//  react_native-ble-swift-module
//
//  Created by Evan Kuhn on 5/1/18.
//  Copyright © 2018 Ray Deck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
@interface RCT_EXTERN_MODULE(BeaconTracker, NSObject)
RCT_EXTERN_METHOD(getBeaconRssis:(success:(RCTPromiseResolveBlock)success reject:(RCTPromiseRejectBlock)reject);
@end
