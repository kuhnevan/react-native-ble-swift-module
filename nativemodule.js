import { NativeModules, NativeEventEmitter } from "react-native";
const react_native-ble-swift-module_native = NativeModules.react_native-ble-swift-module;

const react_native-ble-swift-module = {
  nativeObj: react_native-ble-swift-module_native,
  a: react_native-ble-swift-module_native.a,
  b: react_native-ble-swift-module_native.b,
  startTime: react_native-ble-swift-module_native.startTime,
  addListener: cb => {
    const e = new NativeEventEmitter(react_native-ble-swift-module_native);
    const s = e.addListener("react_native-ble-swift-module", cb);
    return s;
  },
  addListenerDemo: () => {
    react_native-ble-swift-module.addListener(arr => {
      console.log("Received a react_native-ble-swift-module event", arr.message);
    });
  },
  emitMessage: async (message, delayms) => {
    if (!delayms) delayms = 0;
    return await react_native-ble-swift-module_native.delayedSend(message, delayms);
  },
  demoWithPromise: async message => {
    //Returns a promise!
    const output = await react_native-ble-swift-module_native.demo(message);
    return output;
  }
};

export default react_native-ble-swift-module;
