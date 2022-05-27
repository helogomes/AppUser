//
//  Pessoa.swift
//  Protocol
//
//  Created by user218997 on 5/11/22.
//

import Foundation


enum Gender: String {
    case masculine = "masculino"
    case feminine = "feminino"
}


class Pessoa {
    
    var name: String?
    var lastName: String?
    var age: Int?
    var gender: Gender?
    var avatar: String?
    var customID: Int?
    
    init(name: String?, lastName:String?, age: Int?, gender: Gender?, avatar: String?, customID: Int?){
        
        self.name = name
        self.lastName = lastName
        self.age = age
        self.gender = gender
        self.avatar = avatar
        self.customID = customID
        
    }
    
    
    
}
