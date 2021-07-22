//
//  AppDelegate.swift
//  IPCamera
//
//  Created by Admin on 3/11/21.
//

import UIKit
import HaishinKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let session = AVAudioSession.sharedInstance()
                do {
                    // https://stackoverflow.com/questions/51010390/avaudiosession-setcategory-swift-4-2-ios-12-play-sound-on-silent
                    if #available(iOS 10.0, *) {
                        try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
                    } else {
                        session.perform(NSSelectorFromString("setCategory:withOptions:error:"), with: AVAudioSession.Category.playAndRecord, with: [
                            AVAudioSession.CategoryOptions.allowBluetooth,
                            AVAudioSession.CategoryOptions.defaultToSpeaker
                        ])
                        try session.setMode(.default)
                    }
                    try session.setActive(true)
                } catch {
                    print(error)
                }
                return true
    }


}

