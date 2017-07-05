//
//  CCPopUpNavController.swift
//  CCPopUpNavController
//
//  Created by Halo on 2017/7/4.
//  Copyright © 2017年 Choice. All rights reserved.
//

import UIKit

class CCPopUpNavController: UINavigationController {
    
    public struct optionalValue {
        /// default true, Switch this to YES to enable tapping on the background to dismiss the popup controller
        public var tapDismissEnable : Bool
        
        /// The duration at which the controller appears
        public var annimationDuration : TimeInterval
        
        /// the background shade color
        public var backgroundShadeColor : UIColor
        
        /// the underneath zoom factor
        public var scaleTransform : CGAffineTransform
        
        /// Spring damping for transition
        public var springDamping : CGFloat
        
        /// Spring Velocity for transition
        public var springVelocity :CGFloat
        
        /// The background shade alpha
        public var backgroundShadeAlpha : CGFloat
    }
    
    public var transitionConfiguration = optionalValue(tapDismissEnable: true, annimationDuration: 0.35, backgroundShadeColor: UIColor.black, scaleTransform: CGAffineTransform(scaleX: 0.94, y: 0.94), springDamping: 0.88, springVelocity: 14, backgroundShadeAlpha: 0.4)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extendedLayoutIncludesOpaqueBars = false
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
        self.view.clipsToBounds = true
    }
    convenience init(rootViewController:UIViewController, configuration:optionalValue) {
        self.init(rootViewController: rootViewController)
        transitionConfiguration = configuration
    }
    
    public func dismissPopUpViewController(){
        self .dismiss(animated: true, completion: nil)
    }
}

extension CCPopUpNavController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return self.createTransitioner(withType: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return self.createTransitioner(withType: false)
    }
    
    fileprivate func createTransitioner(withType presenting:Bool) -> CCPopUpTransition{
        let transitioner = CCPopUpTransition(configuration: transitionConfiguration, presenting: presenting)
        return transitioner
    }
    
}
