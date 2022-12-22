//
//  ViewControllerTabBar.swift
//  Ingilizce Kelime Ogren
//
//  Created by Yakup Acis on 8/31/22.
//

import UIKit

class TabbarController: UITabBarController {
    
    var user = Users(id: UUID(), words: ["":""], questionCount: 0, trueCount: 0, falseCount: 0, totalRepeat: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeRadiusOfTabbar()

        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.systemPink, size: CGSize(width: 150, height: 150)).resizableImage(withCapInsets: UIEdgeInsets.zero)
    }
    
    override func viewDidLayoutSubviews() {
        self.changeHeightOfTabbar()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleAnimationWhenSelectItem(item)
        self.handleActionWhenSelectedItem(item)
    }
    
    // TABBAR RADIUS
    func changeRadiusOfTabbar()
    {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    // TABBAR HEIGHT
    func changeHeightOfTabbar()
    {
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame    = tabBar.frame
            tabFrame.size.height    = 100
            tabFrame.origin.y   = view.frame.size.height - 100
            tabBar.frame =  tabFrame
        }
    }
    
    // TABBAR ANIMATION
    func simpleAnimationWhenSelectItem(_ item : UITabBarItem)
    {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.4
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5){
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        }
        propertyAnimator.addAnimations({barItemView.transform = .identity},
                                       delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    //TABBAR HANDLE ACTION WHEN SELECTED ITEM
    func handleActionWhenSelectedItem(_ item: UITabBarItem)
    {
        if item == (self.tabBar.items!)[0]
        {

        }
        else if item == (self.tabBar.items!)[1]
        {

        }
        else if item == (self.tabBar.items!)[2]
        {

        }
        else if item == (self.tabBar.items!)[3]
        {

        }
    }
}

extension UIImage {
   class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
   }
}
