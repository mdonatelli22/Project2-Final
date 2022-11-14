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
    
    var body: some View {
        //NavigationView {
        
                    VStack {
                        
                        //how to put in top corner?
                       Image("trylife-image")
                           .resizable()
                           .frame(width: 90, height: 90)

                        
                        NavigationLink(destination: ScanningView(), isActive: $isShowingScanView) { EmptyView() }

                        Text("Redeem Rewards")
                            .foregroundColor(.black)
                            .bold()
                        
                        Text("")
                        
                        Text("Choose a method of searching")
                        Text("the catelogue for items:")
                        
                        
                        Button(){
                             isShowingScanView = true
                        }label:{
                            Text(" Scan Items   ")
                                .padding()
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                        }.padding()
                        
                        
                        NavigationLink(destination: EnterBarcodeView(barcode: ""), isActive: $isShowingEnterView) { EmptyView() }
                        Button(){
                            isShowingEnterView = true
                        }label:{
                            Text("Enter Barcode")
                                .padding()
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                        }
                    }
                    .navigationTitle("Add items")
//                    .foregroundColor()
    }
}

struct AddingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AddingItemsView()
    }
}

