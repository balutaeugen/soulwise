//
//  Resizer.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 19.03.2021.
//

import Foundation
import UIKit
import DeviceKit

protocol Resizer {}

extension Resizer {
    var resizeWidth: CGFloat {
        let value = CGFloat(exactly: (self as? NSNumber) ?? NSNumber(0)) ?? 0
        
        if Device.current.realDevice.isPhone {
            switch Device.current.realDevice {
            case .iPhone4, .iPhone4s: return value * 0.853
            case .iPhone5, .iPhone5s, .iPhone5c, .iPhoneSE: return value * 0.853
            case .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2: return value
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus: return value * 1.104
            case .iPhoneX, .iPhoneXS, .iPhone11Pro: return value
            case .iPhone11, .iPhoneXR, .iPhoneXSMax, .iPhone11ProMax: return value * 1.104
            case .iPhone12Pro, .iPhone12: return value * 1.04
            case .iPhone12Mini: return value * 0.96
            case .iPhone12ProMax: return value * 1.1413
            default: return value
            }
        }
        
        return CGFloat(exactly: (self as? NSNumber) ?? NSNumber(0)) ?? 0
    }
    
    var resizeHeight: CGFloat {
        let value = CGFloat(exactly: (self as? NSNumber) ?? NSNumber(0)) ?? 0
        
        if Device.current.realDevice.isPhone {
            switch Device.current.realDevice {
            case .iPhone4, .iPhone4s: return value * 0.5911330049
            case .iPhone5, .iPhone5s, .iPhone5c, .iPhoneSE: return value * 0.6995073892
            case .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2: return value * 0.8214285714
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus: return value * 0.9064039409
            case .iPhoneX, .iPhoneXS, .iPhone11Pro: return value
            case .iPhone11, .iPhoneXR, .iPhoneXSMax, .iPhone11ProMax: return value * 1.1034482759
            case .iPhone12Pro, .iPhone12: return value * 1.039408867
            case .iPhone12Mini: return value * 0.960591133
            case .iPhone12ProMax: return value * 1.1403940887
            default: return value
            }
        }
        
        return value
    }
}

extension Int: Resizer {}
extension Float: Resizer {}
extension Double: Resizer {}
