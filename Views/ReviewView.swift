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
    
    private func removeItems(at offsets: IndexSet) {
        self.VM.itemList.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        VStack{
            
            VStack{
                List{
                    ForEach(VM.itemList){item in
                        HStack{
                            Text("\(item.ItemName) : \(item.Points) points")
                                .bold()
                            
                        }
                        
                    }.onDelete(perform: self.removeItems)
                    
                }
            }
            
            
            
            NavigationLink(tag: 1, selection: $selectedSubView, destination: {
                ReceiptView()
            }, label: {
               
            })
            
            Button{
                selectedSubView = 1
            }label: {
                Text("Submit")
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
            }

        }
        .navigationTitle("Review Items")
        .padding()
                        
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .environmentObject(ViewModel())
    }
}
