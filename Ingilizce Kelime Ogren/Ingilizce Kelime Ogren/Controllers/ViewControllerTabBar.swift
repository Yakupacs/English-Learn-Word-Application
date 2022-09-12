//
//  ViewControllerTabBar.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/31/22.
//

import UIKit

class ViewControllerTabBar: UITabBarController {

    var sendID : UUID?
    var sendName : String = "a"
    var sendSurname : String = "a"
    var sendUsername : String = "a"
    var sendPassword : String = "a"
    var sendWords : Dictionary = ["" : ""]
    var sendImage : UIImage?
    var allWords : Dictionary = ["" : ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
