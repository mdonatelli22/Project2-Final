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
                        NavigationLink(destination: ScanningView(), isActive: $isShowingScanView) { EmptyView() }

                        Button("Scan items") {
                            isShowingScanView = true
                        }
                        
                        NavigationLink(destination: EnterBarcodeView(barcode: "Enter Barcode here"), isActive: $isShowingEnterView) { EmptyView() }

                        Button("Enter Barcode") {
                            isShowingEnterView = true
                        }
                    
                    }
                    .navigationTitle("Add items")
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.882, green: 0.289, blue: 0.606)/*@END_MENU_TOKEN@*/)

                    

                //}
    }
}

struct AddingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AddingItemsView()
    }
}

