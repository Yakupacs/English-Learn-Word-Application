//
//  ViewController.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageVieww: NSLayoutConstraint!
    
    var timer =  Timer()
    var count = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunc(){
    count -= 1
    if (count == 0){
        performSegue(withIdentifier: "toLogin", sender: nil)
        timer.invalidate()
    }
    }
}

