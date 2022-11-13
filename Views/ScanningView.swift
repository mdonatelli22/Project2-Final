//
//  ScanningView.swift
//  Project2-Final
//
//  Created by Maura Donatelli on 11/11/22.
//

import SwiftUI

struct ScanningView: View {
    
    @EnvironmentObject var VM: ViewModel
    
    var body: some View {
        
        ScrollView{
            ForEach(VM.trylifelists){trylifelist in
                Text(trylifelist.ItemName)
            }
        }
        
    }
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningView()
    }
}
