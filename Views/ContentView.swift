//
//  ContentView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            ZStack{
//                Image("background")
//                    .resizable()
//                    .ignoresSafeArea()
                    
                VStack{
                    
                    Image("trylife-logo")
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    Text("'Description'")
                        .font(.custom("AmericanTypewriter", fixedSize: 20))
                   
                    
                    NavigationLink{
                        AddingItemsView()
                    }label: {
                       
                        VStack{
                           
                            Text("Start")
                                .padding()
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.882, green: 0.289, blue: 0.606)/*@END_MENU_TOKEN@*/)
                                .background(RoundedRectangle(cornerRadius: 5).stroke(Color(red: 0.004, green: 0.637, blue: 0.704)))
                                .font(.custom("AmericanTypewriter", fixedSize: 25))
                            Spacer()
                                .frame(height: 250)
                           
                        }
                        
                    }
                }
                
            }
            
           
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
