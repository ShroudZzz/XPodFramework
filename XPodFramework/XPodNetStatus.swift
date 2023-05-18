import Alamofire

public struct XPodNetWorkStatusManager {
    public static func StartListen() {
        NetworkReachabilityManager()?.startListening(onUpdatePerforming: { status in
            switch status {
            case .unknown:
                print("XPodNetworkStatus-unknow")
            case .notReachable:
                print("XPodNetworkStatus-offline")
            case .reachable(let type):
                if type == .cellular {
                    print("XPodNetworkStatus-cellular")
                }
                
                if type == .ethernetOrWiFi {
                    print("XPodNetworkStatus-ethernetOrWiFi")
                }
            @unknown default:
                print("XPodNetworkStatus-unknown default")
            }
        })
    }
}
