//
//  LiveViewController.swift
//  demoAs3_1
//
//  Created by Vaibhav patel on 11/6/20.
//  Copyright © 2020 Vaibhav patel. All rights reserved.
//

import UIKit
import Vision
import AVFoundation
import CoreMedia
import VideoToolbox

class LiveViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
  
    @IBOutlet weak var belowView: UIView!
    
    @IBOutlet weak var objectName: UILabel!
    
    @IBOutlet weak var Accuracylbl: UILabel!
    
   var model = Resnet50FP16().model
//   var model = MobileNet().model
//    var model = SqueezeNet().model
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view, typically from a nib.
           
           //camera
           let captureSession = AVCaptureSession()
           
           guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
           guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
           captureSession.addInput(input)
           
           captureSession.startRunning()
           
           let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
           view.layer.addSublayer(previewLayer)
           previewLayer.frame = view.frame
           // The camera is now created!
            view.addSubview(belowView)
//            view.addSubview(self.belowView)
           
           belowView.clipsToBounds = true
           belowView.layer.cornerRadius = 15.0
           belowView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
           
           
           let  dataOutput = AVCaptureVideoDataOutput()
           dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
           captureSession.addOutput(dataOutput)
           
           
       }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else {return}
            guard let firstObservation = results.first else {return}
            
            var name: String = firstObservation.identifier
            var acc: Int = Int(firstObservation.confidence * 100)
            
            DispatchQueue.main.async {
                self.objectName.text = name
                self.Accuracylbl.text = "Accuracy: \(acc)%"
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }
}
