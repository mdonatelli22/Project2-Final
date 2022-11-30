//
//  ReceiptView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ReceiptView: View {
    
    @EnvironmentObject var VM : ViewModel
  

    
    static func popToRootView() {
            findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
                .popToRootViewController(animated: true)
        }
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
            guard let viewController = viewController else {
                return nil
            }
    if let navigationController = viewController as? UINavigationController {
                return navigationController
            }
    for childViewController in viewController.children {
                return findNavigationController(viewController: childViewController)
            }
    return nil
        }
    
    
    var body: some View {
        
        let totalPoints = self.VM.itemList.compactMap { $0.Points }.reduce(0) { $0 + $1 }
        
        VStack{

            
          
            ScrollView{
                
                ForEach(VM.itemList){item in
                    Text("\(item.ItemName) : \(item.Points) points")
                }
            }
            

            
            HStack{
                Text("Total : \(totalPoints) points")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(red: 0.8, green: 0.0, blue: 0.5))
                

                
                Button{
                    self.VM.itemList.removeAll()
                    ReceiptView.popToRootView()
                }label:{
                    Text("Start Over")
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.8, green: 0.0, blue: 0.5)))
                }
            
                
                
                
            }
            
            
                
        }
        .navigationTitle("Receipt")
        . navigationBarBackButtonHidden(true)
        
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
            .environmentObject(ViewModel())
    }
}
