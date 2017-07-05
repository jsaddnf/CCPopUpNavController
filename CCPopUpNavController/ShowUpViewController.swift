//
//  ShowUpViewController.swift
//  CCPopUpNavController
//
//  Created by Halo on 2017/7/4.
//  Copyright © 2017年 Choice. All rights reserved.
//

import UIKit

class ShowUpViewController: UIViewController {
    
    let picker = UIDatePicker(frame: CGRect(x: 10, y: 10, width: UIScreen.main.bounds.width, height: 400))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(picker)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction))
        
    }
    
    @objc fileprivate func saveAction(){
        print(picker.date)
        self .dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
