//
//  ReceiptView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ReceiptView: View {
    var body: some View {
        
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
      
                
        }
        
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}
