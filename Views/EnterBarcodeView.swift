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
        VStack(){
            Text("Barcode Search")
                .foregroundColor(.teal)
                .bold()
                .font(.largeTitle)
            Text("")
            Text("Enter an item's barcode number")
            Text("to see if it is available in the catelogue")
            Text("Press enter or return to search")
            Text("")
                    TextField(
                        "Enter barcode here",
                        text: $barcode
                    ).onSubmit {
    
                       
                        VM.item = VM.loop(barcode : Int(barcode) ?? 0)
                        if (VM.item != nil){
                            VM.foundItem = true
                        }
                    }
                }
                .textFieldStyle(.roundedBorder)
                
                .sheet(isPresented: $VM.foundItem) {
                    DetailItemView()
                }
        //on submit loop through TryLifeLists and if list.barcode == barcode
        //if so then show item and number of points it costs as well as add to list button
    }
    
}


struct DetailItemView: View {
    
    @EnvironmentObject var VM : ViewModel
    @State private var goesToList: Bool = false
    
    var body: some View {
        VStack(){
            Text("\(VM.item?.ItemName ?? "none")")
                .bold()
                .font(.largeTitle)
                
//            NavigationLink(destination: ListView()){
//
//                Button(action: {
//                    //add item to shopping list
//                    VM.foundItem = false
//                }){
//                    Text(" Add to cart ")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
//
//                }.padding()
//            }
            
            
           

            NavigationLink(
                destination: ListView(),
               		 isActive: $goesToList) {
                Button(action: {
                    VM.foundItem = false
                    goesToList = true }
                    ) {
                    Text("Add to cart")
                }
                
            }
            
            //NavigationLink(){
                
                Button(action: {
                    //add item to shopping list
                    VM.foundItem = false
                }){
                    Text(" Cancel ")
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                    
                }.padding()
           // }
            
        }
    }
}
            
//struct EnterBarcodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterBarcodeView()
//    }
//}
