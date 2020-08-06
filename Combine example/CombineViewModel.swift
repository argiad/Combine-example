//
//  CombineViewModel.swift
//  Combine example
//
//  Created by Artem Mkrtchyan on 8/5/20.
//

import Foundation
import Combine

class CombineViewModel: ObservableObject {
    
    public static var instance : CombineViewModel = {
        var instance = CombineViewModel()
        return instance
    } ()
    
    private init(){
        
    }
    
    @Published var text = ""
    
}
