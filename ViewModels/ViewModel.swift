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
    
    init(){

        readJSONFile()
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
