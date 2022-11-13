//
//  EnterBarcodeView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct EnterBarcodeView: View {
    
    @State var barcode : String
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("Enter the barcode number", text: $barcode)
            Text("The barcode number is:\(barcode)")
        }
    }
}

//struct EnterBarcodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterBarcodeView()
//    }
//}
