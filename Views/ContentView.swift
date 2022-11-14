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
                        .frame(width: 300, height: 320)
                    
                    
                    Text("Rewards System")
                        .font(.custom("Open Sans", fixedSize: 25))
                        .bold()
                    Text("")
                    Text("Welcome to TryLife's rewards system!")
                    Text("Here you can reedem your points")
                    Text("earned through our program for free")
                    Text("items such as diapers, formula")
                    Text("wipes, pillows and more! ")
                       // .font(.custom("Open Sans"))
                   
                    
                    NavigationLink{
                        AddingItemsView()
                    }label: {
                   
                        VStack{
                                Spacer()
                                Text("")
                                Text("Begin")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                                    .font(.custom("Open Sans", fixedSize: 25))
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
