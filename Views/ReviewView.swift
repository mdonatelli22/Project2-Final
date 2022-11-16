//
//  ReviewView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ReviewView: View {
    
    @EnvironmentObject var VM : ViewModel
    @State var selectedSubView: Int? = nil
    
    var body: some View {
        
        VStack{
            
            Image("trylife-image")
                .resizable()
                .frame(width: 90, height: 90)
                .position(x: 70, y: 0)
            
            Text("Review Items")
                .bold()
                .font(.largeTitle)
                .position(x: 160, y: 5)
                .foregroundColor(.teal)
            
            Spacer()
                .padding()
            
            ScrollView{
                ForEach(VM.itemList){item in
                    HStack{
                        Text("\(item.ItemName) : \(item.Points) points")
                            .bold()
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        
                    }
                    
                }
                
            }
            
            Button{
                
            }label:{
                Image(systemName: "plus")
                    .foregroundColor(.green)
                    
            }.position(x: 30, y: 90)
            
            
            
            Spacer()
                .padding()
            
            
            NavigationLink(tag: 1, selection: $selectedSubView, destination: {
                ReceiptView()
            }, label: {
               
            })
            
            Button{
                selectedSubView = 1
            }label: {
                Text("Checkout")
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
            }
            Spacer()
                .padding()
        }
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .environmentObject(ViewModel())
    }
}
