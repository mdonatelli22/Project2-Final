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
                
                Text("List")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.teal)
                ScrollView{
                    
                    ForEach(VM.itemList){ item in
                        Text("\(item.ItemName) : \(item.Points) points")
                        //Text("Number of points: \(item.Points)")
                    }
                    
                }
                
                Spacer()
                    .padding()
                
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
                    .position(x: 5, y: 5)
                
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
                
                Spacer()
                    .padding()
           
            }
        //}
        
        
        
        
        
        
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(itemList: $itemList)
//    }
//}
