//
//  AddingItemsView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct AddingItemsView: View {
    
    @State private var isShowingScanView = false
    
    @State private var isShowingEnterView = false
    
    @State var barcode : String = ""
    
    @EnvironmentObject var VM : ViewModel
    
    @State var selectedSubView: Int? = nil
    
    var body: some View {
       
        ZStack(alignment: .top){
            VStack {
                
               
//               Image("trylife-image")
//                   .resizable()
//                   .frame(width: 90, height: 90)
//                   .position(x: 70, y: 0)
                
                

                
                NavigationLink(destination: ScanningView(), isActive: $isShowingScanView){ EmptyView() }

//                Text("Begin Scanning Items")
//                    .foregroundColor(.black)
//                    .bold()
//
//                Text("")
//
//                Text("Choose a method of scanning")
//                Text("the customer's items:")

                
                HStack{
                    TextField(
                        "Enter barcode here",
                        text: $barcode
                    )
                    .padding()
                    Button(action: {
    
                        VM.item = VM.loop(barcode : Int(barcode) ?? 0)
                        if (VM.item != nil){
                            self.VM.itemList.append(VM.item!)
                        }

                    }){
                        Text(" Add to cart ")
                            .padding()
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                        
                    }.padding()
                    

                    
                }//.frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                
                Text("or")
                
                Button(){
                     isShowingScanView = true
                }label:{
                    Text(" Scan Items   ")
                        .padding()
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                }.padding()
                
               
                Text("Shopping Cart")
                    .bold()
                    //.padding()
                    .foregroundColor(.teal)
                    //.font(.title)
                
                ScrollView(.vertical){
                    
                    VStack(alignment: .leading){
                        
                        
                        ForEach(VM.itemList){item in
                            Text("\(item.ItemName) : \(item.Points) points")
                                .bold()
                        }
                    }.frame(maxWidth: .infinity)
                    
                }
                
                
                NavigationLink(tag: 1, selection: $selectedSubView, destination: {
                    ReviewView()
                }, label: {
                    Button {
                        
                        selectedSubView = 1
                    } label: {
                        Text("Checkout")
                            .padding()
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                    }
                })
                
                
             
            }.frame(maxHeight: .infinity, alignment: .bottom)
        }.navigationTitle("Scan Items")
        
        
    }
}

struct AddingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AddingItemsView()
            .environmentObject(ViewModel())
    }
}

