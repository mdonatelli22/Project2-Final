//
//  ScanningView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI
import CarBode
import AVFoundation



struct ScanningView: View {

    //@EnvironmentObject var VM: ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

            VStack{

            CBScanner(
                    supportBarcode: .constant([.qr, .code128]), //Set type of barcode you want to scan
                    scanInterval: .constant(5.0), //Event will trigger every 5 seconds
                    mockBarCode: .constant(BarcodeData(value:"Mocking data", type: .qr))
                ){
                    //When the scanner found a barcode
                    print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
//                    VM.item = VM.loop(value : Int(value) ?? 0)
//                    if (VM.item != nil){
//                        self.VM.itemList.append(VM.item!)
//                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                   
                }

            }
    }
    
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningView()
    }
}
