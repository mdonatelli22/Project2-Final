//
//  TryLifeList.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import Foundation

typealias TryLifeLists = [TryLifeList]

struct TryLifeList : Identifiable, Decodable{
    
    var id = UUID()
    var ItemName : String
    var Points : Int
    var BarcodeNumber : Int
   
    
    enum CodingKeys: String, CodingKey {
        case ItemName, Points, BarcodeNumber
       
    }
}
