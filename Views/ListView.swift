//
//  ListView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ListView: View {
    
    //@Binding var itemList : [TryLifeList]
    //@State private var goBackToAdd: Bool = false
    @State var selectedSubView: Int? = nil
    @EnvironmentObject var VM : ViewModel
    
    var body: some View {
        //NavigationView{
            VStack(){
                
                Image("trylife-image")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .position(x: 70, y: 0)
                
                Text("Shopping Cart")
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.teal)
                    
                
                Spacer()
                    .position(x: 50, y: 50)
                    .padding()
                
                
                ScrollView{
                    
                    ForEach(VM.itemList){ item in
                        Text("\(item.ItemName) : \(item.Points) points")
                            .bold()

                    }
                    
                }
                
                Spacer()
                    .position(x: 30, y: 30)
                
                //HStack(spacing:10){
                    NavigationLink(tag: 1, selection: $selectedSubView, destination: {
                        AddingItemsView()
                    }, label: {
                       
                    })
                    
                    Button {
                        
                        VM.ifList = false
                        selectedSubView = 1
                    } label: {
                        Text("Add another item")
                            .padding()
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                    }
                    
                    Spacer()
                        
                   
                    NavigationLink(tag: 2, selection: $selectedSubView, destination: {
                        ReviewView()
                    }, label: {
                       
                    })

                    
                    
                    Button{
                        selectedSubView = 2
                    } label: {
                        Text("Finish")
                            .padding()
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                    }
                    //Spacer()
                
                   
                    
                }//.padding(.horizontal, 10)
                
           
            //}
            
        //}
        
        
        
        
        
        
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(itemList: $itemList)
//    }
//}
