//
//  ViewModel.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import Foundation

import SwiftUI

class ViewModel : ObservableObject{
    
    @Published var trylifelists = [TryLifeList]()
    @Published var foundItem: Bool = false
    @Published var item: TryLifeList?
    
    init(){

        readJSONFile()
    }
    
    func loop(barcode : Int) -> TryLifeList? {
//        @EnvironmentObject var VM : ViewModel
        //@State var barcode : Int = 0
        for item in trylifelists{
            if(item.BarcodeNumber == barcode){
                print(item.ItemName)
                return item
            }else{
                print("No item found")
                
            }
            
        }
        return nil
    }
    
    func readJSONFile(){
        
        let pathString = Bundle.main.path(forResource: "Trylife-list", ofType: "json")
        
        if let path = pathString{
            
            let url = URL(fileURLWithPath: path)
         
            do{
                let data = try Data(contentsOf: url)

                let jsonDecoder = JSONDecoder()

                trylifelists = try jsonDecoder.decode(TryLifeLists.self, from: data)
                
                
              
            } catch {
                print("Unexpected error:Loading list \(error).")
                
            }
        } else{
            
        }

    }
    
   
}
