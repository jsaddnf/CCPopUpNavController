//
//  CCPopUpTransition.swift
//  CCPopUpNavController
//
//  Created by Halo on 2017/7/4.
//  Copyright © 2017年 Choice. All rights reserved.
//

import UIKit

class CCPopUpTransition: NSObject {
    
    public var transitionConfiguration : CCPopUpNavController.optionalValue?
    
    public var present :Bool?
    
    convenience init(configuration : CCPopUpNavController.optionalValue, presenting : Bool) {
        self.init()
        transitionConfiguration = configuration
        present = presenting
    }
    
}

extension CCPopUpTransition : UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return transitionConfiguration!.annimationDuration
    }
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        let fromViewController = transitionContext.viewController(forKey:.from)
        let toViewController = transitionContext.viewController(forKey: .to)
        
        let modalViewFinalFrame = CGRect(x: 0, y: transitionContext.containerView.frame.size.height - (toViewController?.view.frame.size.height)!, width: (toViewController?.view.frame.size.width)!, height: (toViewController?.view.frame.size.height)!)
        var modalViewInitialFrame = modalViewFinalFrame
        modalViewInitialFrame.origin.y = transitionContext.containerView.frame.size.height
        
        let array = transitionContext.containerView.subviews
        var backgroundView = array.filter({$0.tag == 100}).last
        if backgroundView == nil{
            backgroundView = UIView(frame: transitionContext.containerView.bounds)
            backgroundView?.alpha = 0
            backgroundView?.tag = 100
            backgroundView?.backgroundColor = self.transitionConfiguration!.backgroundShadeColor
            
            if self.transitionConfiguration!.tapDismissEnable == true {
                let tap = UITapGestureRecognizer(target: toViewController, action:#selector(CCPopUpNavController.dismissPopUpViewController))
                backgroundView?.addGestureRecognizer(tap)
                backgroundView?.isUserInteractionEnabled = true;
            }
        }
        
        fromViewController?.view.isUserInteractionEnabled = false
        toViewController?.view.isUserInteractionEnabled = false
        
        if self.present == true {
            let image = self.outputImage(fromView: (fromViewController?.view)!)
            transitionContext.containerView.insertSubview(UIImageView(image: image), at: 0)
            fromViewController?.view.isHidden = true
            transitionContext.containerView .insertSubview(backgroundView!, belowSubview: (toViewController?.view)!)
            
            toViewController?.view.frame = modalViewInitialFrame
            transitionContext.containerView .addSubview((toViewController?.view)!)
            
            let navBarFrame = (toViewController as! CCPopUpNavController).navigationBar.frame
            (toViewController as! CCPopUpNavController).navigationBar.frame = CGRect(x: navBarFrame.origin.x, y: 0, width: navBarFrame.size.width, height: navBarFrame.size.height)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { 
                backgroundView?.alpha = self.transitionConfiguration!.backgroundShadeAlpha
                transitionContext.containerView.subviews[0].transform = self.transitionConfiguration!.scaleTransform
            })
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext) + 0.2, delay: 0, usingSpringWithDamping: self.transitionConfiguration!.springDamping, initialSpringVelocity: self.transitionConfiguration!.springVelocity, options: .curveEaseInOut, animations: {
                
                toViewController?.view.frame = modalViewFinalFrame
                
            }, completion: { (finish) in
                fromViewController?.view.isUserInteractionEnabled = true
                toViewController?.view.isUserInteractionEnabled = true
                transitionContext.completeTransition(true)
            })
            
        }
            
        else{
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { 
                transitionContext.containerView.subviews[0].transform = CGAffineTransform(scaleX: 1, y: 1)
                fromViewController?.view.frame = modalViewInitialFrame
                backgroundView?.alpha = 0
            }, completion: { (finish) in
                fromViewController?.view.isUserInteractionEnabled = true
                toViewController?.view.isUserInteractionEnabled = true
                toViewController?.view.isHidden = false
                transitionContext.completeTransition(true)
            })
        }
        

    }
}

// MARK: - private
extension CCPopUpTransition{
    
    fileprivate func outputImage(fromView view:UIView) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
