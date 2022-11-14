//
//  EnterBarcodeView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct EnterBarcodeView: View {
    
    @State var barcode : String = ""
    @EnvironmentObject var VM : ViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Barcode Search")
                .foregroundColor(.teal)
                .bold()
                .font(.largeTitle)
            Text("")
            Text("Enter an item's barcode number to see if it is available")
            Text("")
                    TextField(
                        "Enter code here",
                        text: $barcode
                    )
                }
                .textFieldStyle(.roundedBorder)
        //loop through TryLifeLists and if list.barcode == barcode then
        //Text($barcode)
    }
    
}

//->String
//convert string state barcode to int barcode
func loop(){
    @EnvironmentObject var VM : ViewModel
    @State var barcode : Int = 0
    for item in VM.trylifelists{
        if(item.BarcodeNumber == barcode){
            print(item.ItemName)
        }else{
            print("No item found")
        }
        
    }
    
}

//struct EnterBarcodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterBarcodeView()
//    }
//}
