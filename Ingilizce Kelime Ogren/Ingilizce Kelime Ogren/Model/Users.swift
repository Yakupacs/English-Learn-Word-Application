//
//  Users.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/29/22.
//

import Foundation
import UIKit

class Users{
    var id : UUID?
    var name : String?
    var surname : String?
    var username : String?
    var password : String?
    var image : UIImage?
    var words : [String : String]?
    
    init(id : UUID, name : String, surname : String, username : String, password : String, image : UIImage?, words : [String : String]) {
        self.id = id
        self.name = name
        self.surname = surname
        self.username = username
        self.password = password
        self.image = image
        self.words = words
    }
}
