import {
  NativeModules,
  NativeEventEmitter
} from 'react-native';
export default class SwiftBleManager {
  getRssiValues() {
    console.log("Hello");
    console.log(
      "Constants available immediately: ",
      NativeModules.stest.a,
      NativeModules.stest.b
    );
    const e = new NativeEventEmitter(NativeModules.stest);
    const s = e.addListener("Hello", (arr) => {
      console.log("Received a hello event", arr.message);
    })
    console.log(
      return NativeModules.BeaconTracker.getRssis()
    );
  }
}
