//
//  ScanningView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI
import AVFoundation


class Scanner : NSObject{
    private var viewController : UIViewController
    private var captureSession : AVCaptureSession?
    private var codeOutputHandler : (_ code: String) -> Void
    
    
    
    init(withViewCotroller viewController: UIViewController, view: UIView, codeOutputHandler: @escaping (String) -> Void){
        self.viewController = viewController
        self.codeOutputHandler = codeOutputHandler
        
        super.init()
        
        if let captureSession = self.createCaptureSession()
        {
            self.captureSession = captureSession
            let previewLayer = self.createPreviewLayer(withCaptureSession: captureSession, view: view)
            view.layer.addSublayer(previewLayer)
        }
    }
    
    
    func requestCaptureSessionStartRunning(){
        guard let captureSession = self.captureSession else {
            return
        }
        
        if !captureSession.isRunning{
            captureSession.startRunning()
        }

    }
    
    func requestCaptureSessionStopRunning(){
        guard let captureSession = self.captureSession else {
            return
        }
        
        if captureSession.isRunning{
            captureSession.stopRunning()
        }

    }
    
    
    
    
    private func createCaptureSession() -> AVCaptureSession?{
        let captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else{
            return nil
        }
        
        do{
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            let metaDataOutput = AVCaptureMetadataOutput()
            
            if captureSession.canAddInput(deviceInput){
                captureSession.addInput(deviceInput)
            }
            else{
                return nil
            }
            
            if captureSession.canAddOutput(metaDataOutput){
                captureSession.addOutput(metaDataOutput)
                
                if let viewController = self.viewController as? AVCaptureMetadataOutputObjectsDelegate{
                    metaDataOutput.setMetadataObjectsDelegate(viewController, queue: DispatchQueue.main)
                    
                    metaDataOutput.metadataObjectTypes = self.metadataObjectTypes()
                }
            }
            else{
                return nil
            }
            
        }
        catch{
            return nil
        }
        return captureSession
    }
    
    private func metadataObjectTypes() -> [AVMetadataObject.ObjectType]{
        return [.qr,
                .code128,
                .code39,
                .code39Mod43,
                .code93,
                .ean13,
                .ean8,
                .interleaved2of5,
                .itf14,
                .pdf417,
                .upce
        ]
    }
    
    private func createPreviewLayer(withCaptureSession captureSession: AVCaptureSession, view: UIView) -> AVCaptureVideoPreviewLayer{
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        
        return previewLayer
    }
    
    func scannerDelegate(_ output: AVCaptureMetadataOutput, didOutput metaadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        self.requestCaptureSessionStopRunning()
        //handle this by navigating to new view
        
        if let metadataObject = metaadataObjects.first{
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else {
                return
            }
            
            guard let stringValue = readableObject.stringValue else{
                return
            }
            
            self.codeOutputHandler(stringValue)
        }
    }
}

class ViewController : UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    var scanner : Scanner?
    
    required init?(coder decoder: NSCoder){
        super.init(coder: decoder)!
        self.scanner = Scanner(withViewCotroller: self, view: self.view, codeOutputHandler: self.handleCode)

        if let scanner = self.scanner{
            scanner.requestCaptureSessionStartRunning()
        }
        
    }
    
    func handleCode(code: String){
        print(code)
    }
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        self.scanner?.scannerDelegate(output, didOutput: metadataObjects, from: connection)
    }
}

struct ScanningView: View {

    @EnvironmentObject var VM: ViewModel

    var body: some View {

        ScrollView{
            ForEach(VM.trylifelists){trylifelist in
                Text(trylifelist.ItemName)
            }
        }

    }
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningView()
    }
}
