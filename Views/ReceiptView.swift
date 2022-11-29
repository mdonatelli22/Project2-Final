//
//  ReceiptView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ReceiptView: View {
    
    @EnvironmentObject var VM : ViewModel
  
    
    var body: some View {
        
        let totalPoints = self.VM.itemList.compactMap { $0.Points }.reduce(0) { $0 + $1 }
        
        VStack{
            Image("trylife-image")
                .resizable()
                .frame(width: 90, height: 90)
                .position(x: 70, y: 0)
            
            
            Text("Receipt")
                .bold()
                .font(.largeTitle)
                .position(x: 160, y: 5)
                .foregroundColor(.teal)
                
            Spacer()
                .padding()
            
          
            ScrollView{
                
                ForEach(VM.itemList){item in
                    Text("\(item.ItemName) : \(item.Points) points")
                }
            }
            
            Spacer()
                .padding()
            
            HStack{
                Text("Total : \(totalPoints) points")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(red: 0.8, green: 0.0, blue: 0.5))
                
                
                                
                Button{
                   
                }label:{
                    Text("Back")
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                }
                
            }
            
            
                
        }
        
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}
