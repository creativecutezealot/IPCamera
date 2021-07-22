//
//  StreamViewController.swift
//  IPCamera
//
//  Created by Admin on 3/11/21.
//

import UIKit
import AVKit

class StreamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let player = AVPlayer(url: URL(string: "http://192.168.0.101:8080/hello/playlist.m3u8")!)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }

}
