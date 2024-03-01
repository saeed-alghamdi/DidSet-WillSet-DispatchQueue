//
//  Observer.swift
//  DidSet
//
//  Created by RMP on 07/01/1445 AH.
//

import Foundation


// Using Didset to observer the changes on proprties

class Observer<HG> {
    
    var value: HG {
        
        // this is detect the old value --> observer for old value
        didSet {
            
            print("the old value is: \(oldValue)")
            //self.completionHandler!(value)
            
        }
        
        // this is detect the new value --> observer for new value
        willSet {
            
            print("the new value is: \(newValue)")
            
            
        }
        
    }
    
    init(value: HG) {
        self.value = value
    }
    
    var completionHandler: ((HG) -> ())?
    
    func addNewElement(_ completion: @escaping (HG) -> ()) {
        
        self.completionHandler = completion
        
    }
    
}
