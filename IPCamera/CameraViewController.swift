//
//  CameraViewController.swift
//  IPCamera
//
//  Created by Admin on 3/11/21.
//

import UIKit
import HaishinKit
import AVFoundation

class CameraViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblipaddress: UILabel!
    @IBOutlet weak var btnSwitchCam: UIButton!
    var ipAddress:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let httpStream = HTTPStream()
        httpStream.attachCamera(DeviceUtil.device(withPosition: .back))
//        httpStream.attachAudio(AVCaptureDevice.default(for: .audio))
        httpStream.publish("hello")
        let hkView = HKView(frame: view.bounds)
        hkView.attachStream(httpStream)
        let httpService = HLSService(domain: ipAddress, type: "_http._tcp", name: "HaishinKit", port: 8080)
        httpService.startRunning()
        httpService.addHTTPStream(httpStream)
        // add ViewController#view
        mainView.addSubview(hkView)
        hkView.addSubview(lblipaddress)
//        hkView.addSubview(btnSwitchCam)
        lblipaddress.text = "http://" + ipAddress + ":8080/hello/playlist.m3u8"
    }
    @IBAction func onSwitchCam(_ sender: Any) {
        let httpStream = HTTPStream()
        httpStream.attachCamera(DeviceUtil.device(withPosition: .front))
    }
}
