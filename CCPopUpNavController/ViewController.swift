//
//  ViewController.swift
//  CCPopUpNavController
//
//  Created by Halo on 2017/7/4.
//  Copyright © 2017年 Choice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var actionBtn : UIButton = {
        let btn = UIButton.init(type: .roundedRect)
        btn.frame = CGRect(x: (UIScreen.main.bounds.width - 200)/2, y: (UIScreen.main.bounds.height-40)/2, width: 200, height: 40)
        btn.layer.cornerRadius = 2
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.orange.cgColor
        btn .setTitle("go", for: .normal)
        return btn
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        button.frame = CGRectMake((self.view.frame.size.width-280)/2, (self.view.frame.size.height-40)/2, 280, 40);
//        button.clipsToBounds = YES;
//        button.layer.cornerRadius = 2;
//        button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
//        button.layer.borderWidth = 1;
//        button.layer.borderColor = [UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0].CGColor;
//        [button setTitleColor:[UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0] forState:UIControlStateNormal];
        
        view.addSubview(actionBtn)
        actionBtn .addTarget(self, action:#selector(actionBtnAction), for: .touchUpInside)
        
        
    }
    @objc fileprivate func actionBtnAction(){
        let vc = ShowUpViewController()
        
        /// useage 1:should set CCPopUpNavController.view.frame
        let ccnavi = CCPopUpNavController(rootViewController: vc)
        ccnavi.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        /// set optionalValues
        //        ccnavi.transitionConfiguration.annimationDuration = 0.35
        //        ccnavi.transitionConfiguration.backgroundShadeColor = UIColor.orange
        //        ccnavi.transitionConfiguration.backgroundShadeAlpha = 0.4
        //        ccnavi.transitionConfiguration.scaleTransform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        //        ccnavi.transitionConfiguration.springDamping = 0.88
        //        ccnavi.transitionConfiguration.tapDismissEnable = true
        
        
        /// useage 2 :should set CCPopUpNavController.view.frame
        //        let ccnavi = CCPopUpNavController(rootViewController: vc, configuration: CCPopUpNavController.optionalValue(tapDismissEnable: true, annimationDuration: 0.35, backgroundShadeColor: UIColor.black, scaleTransform: CGAffineTransform(scaleX: 0.94, y: 0.94), springDamping: 0.88, springVelocity: 14, backgroundShadeAlpha: 0.4))
        //        ccnavi.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        //
        
        self.present(ccnavi, animated:true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

