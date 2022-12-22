//
//  ViewController.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/27/22.
//

import UIKit
import CoreData

class ViewControllerIntro: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var timer =  Timer()
    var count = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageView.alpha = 0
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.imageView.frame.size.height += 60
            self.imageView.alpha = 1
        }
    }
    
    @objc func timerFunc(){
        count -= 1
        if (count == 0){
            performSegue(withIdentifier: "toBegin", sender: nil)
            timer.invalidate()
        }
    }
    
}
