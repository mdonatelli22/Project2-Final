//
//  ContentView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI



struct TextView: UIViewRepresentable {
    @Binding var text: String
 
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        

        textView.isScrollEnabled = false
        textView.font = UIFont(name: "HelveticaNeue", size: 16)

        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        
        
    }

}

struct ContentView: View {
    @State var message = "             Welcome to the TryLife Center's shopping \n           application! Please press the button below \n                            to begin scanning items."
    var body: some View {
        
        NavigationView{
            ZStack{
                    
                VStack{
                    
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 175, height: 120)
                        .padding()
                    
                    Text("Shopping Center")
                        //.font(.custom("Open Sans", fixedSize: 25))
                        .font(.largeTitle)
                        .bold()
                        //.position(x: 200, y:100)
                    
                    
                        
                    TextView(text: $message)
                        //.padding(.horizontal)
                        //.padding(.vertical)
                        .position(x: 170, y:100)
                        
                    
                    
                    NavigationLink{
                        AddingItemsView()
                            
                    }label: {
                   
                        VStack{
                                //Spacer()
                                Text("")
                                Text("Begin")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                                    .font(.custom("", fixedSize: 25))
                                    //.font(.custom("Open Sans", fixedSize: 25))
                                    //Spacer()
                                    .frame(height: 250)
                        }
                    }
                    .position(x: 186, y: -20)
                    
                 
                    
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
