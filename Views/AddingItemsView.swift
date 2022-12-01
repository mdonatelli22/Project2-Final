//
//  AddingItemsView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddingItemsView: View {
    
    @State private var isShowingScanView = false
    
    @State private var isShowingEnterView = false
    
    @State var barcode : String = ""
    
    @EnvironmentObject var VM : ViewModel
    
    @State var selectedSubView: Int? = nil
    
    private func removeItems(at offsets: IndexSet) {
        self.VM.itemList.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        
        let totalPoints = self.VM.itemList.compactMap { $0.Points }.reduce(0) { $0 + $1 }
       
        ZStack(alignment: .top){
            VStack {
                
                
                NavigationLink(destination: ScanningView(), isActive: $isShowingScanView){ EmptyView() }


                
                HStack{
                    TextField(
                        "Enter barcode here",
                        text: $barcode
                    ).onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    
                    
                    Button(action: {
    
                        VM.item = VM.loop(barcode : Int(barcode) ?? 0)
                        if (VM.item != nil){
                            self.VM.itemList.append(VM.item!)
                            self.barcode = ""
                        }
                        

                    }){
                        Text("Add to Cart")
                            .padding(8)
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                            //.font(.custom("Open Sans", fixedSize: 15))
                        
                    }//.padding()
                    

                    
                }//.frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                
                Text("or")
                
                Button(){
                     isShowingScanView = true
                }label:{
                    Text("Scan Items")
                        .padding(8)
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                        //.font(.custom("Open Sans", fixedSize: 15))
                }.padding()
                
               
                
                
                //ScrollView(.vertical){
                    
                    VStack(alignment: .leading){
                        
                        List{
                            ForEach(VM.itemList){item in
                                HStack{
                                    
                                    Image(systemName: "cart")
                                        .foregroundColor(.teal)
                                    
                                    Text("\(item.ItemName) : \(item.Points) points")
                                        .bold()
                                }
                            }.onDelete(perform: self.removeItems)
                        }
                    
                    }.frame(maxWidth: .infinity)
                    
                //}
                
                
                if VM.itemList.isEmpty {
                    
                }else{
                    
                    Text("Total :  \(totalPoints) points")
                        .bold()
                        .foregroundColor((Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                    
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
                                //.font(.custom("Open Sans", fixedSize: 15))
                        }
                    })
                }
                
                
                
                
             
            }.frame(maxHeight: .infinity, alignment: .bottom)
        }
        .navigationTitle("Shopping Cart")
        //. navigationBarBackButtonHidden(true)
        .padding()
        
    }
}

struct AddingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AddingItemsView()
            .environmentObject(ViewModel())
    }
}

