import {
  NativeModules,
  NativeEventEmitter
} from 'react-native';
export default class SwiftBleManager {
  getRssiValues() {
    console.log("Hello");
    return NativeModules.BeaconTracker.getRssis()
  }
}
