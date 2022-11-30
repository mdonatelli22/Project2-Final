//
//  EnterBarcodeView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
// This view is not used***

import SwiftUI

struct EnterBarcodeView: View {
    
    @State var barcode : String = ""
    @EnvironmentObject var VM : ViewModel
  
    
    var body: some View {
        
        
        
        if VM.ifList == false {
        
        VStack(){
            
            Image("trylife-image")
                .resizable()
                .frame(width: 90, height: 90)
                .position(x: 70, y: 0)
            
            Spacer()
                .padding()
            
            Text("Barcode Search")
                .foregroundColor(.teal)
                .bold()
                .font(.largeTitle)
            
           
            Text("")
            Text("Enter an item's barcode number")
            Text("to see if it is available in the catalogue")
            Text("Press enter or return to search")
            Text("")
                    TextField(
                        "Enter barcode here",
                        text: $barcode
                    )
                    .padding()
                    .onSubmit {
    
                       
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
            Spacer()
                .position(x: 2, y: 2)
        }else{
            
            ListView()
            
        }
        
        
    }
  
    
}


struct DetailItemView: View {
    
    @EnvironmentObject var VM : ViewModel
    @State private var goesToList: Bool = false
//    @State var itemList = [TryLifeList]()
    @State var selectedSubView: Int? = nil
    
    
    var body: some View {
        
        NavigationView {
        VStack(){
            Text("\(VM.item?.ItemName ?? "none")")
                .bold()
                .font(.largeTitle)

            Text("Cost:\(VM.item?.Points ?? 0) points")
            
//            NavigationLink(tag: 1, selection: $selectedSubView, destination: {
//                ListView(itemList: $itemList)
//            }, label: {
//
//            })
            
            Button {
                //selectedSubView = 1
                self.VM.itemList.append(VM.item!)
                VM.foundItem = false
                VM.ifList =  true
            } label: {
                Text("Add to cart")
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
            }
            
//            NavigationLink {
//                // self.itemList.append(VM.item!)
//                ListView(itemList: $itemList)
//            } label: {
//                Text("Add to cart")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
//            }

//            Button {
//
//            } label: {
//                Text("Add to cart")
//            }

//            Button("Add to cart"){
//
//
//            }
            
//            .sheet(isPresented: $goesToList, content: {
//
//                ListView(itemList: $itemList)
//            })
            
            
                
                Button(action: {
                    //add item to shopping list
                    VM.foundItem = false
                }){
                    Text(" Cancel ")
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                    
                }.padding()
            
        }
        }
    }
}
            
//struct EnterBarcodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterBarcodeView()
//    }
//}
