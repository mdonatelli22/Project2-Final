//
//  ContentView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //open sans sans serif
        
        NavigationView{
            ZStack{
                    
                VStack{
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 175, height: 120)
                    
                    
                    Text("Shopping Center")
                        //.font(.custom("Arial", fixedSize: 25))
                        .font(.largeTitle)
                        .bold()
                    Text("")
                    Text("Welcome to the TryLife Center's shopping")
                        //.font(.custom("Arial", fixedSize: 15))
                    Text("application! Please press the button")
                        //.font(.custom("Arial", fixedSize: 15))
                    Text("below to begin scanning items.")
                        //.font(.custom("Arial", fixedSize: 15))

                   
                    
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
                                    .font(.custom("", fixedSize: 25))
                                    Spacer()
                                    .frame(height: 250)
                        }
                    }
                    
                }
                
               // ZStack(alignment: .bottom){
               //     Rectangle().frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/8, alignment: .bottom)
                //}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
