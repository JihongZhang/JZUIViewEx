//
//  JZThirdViewController.swift
//  JZNavigationController
//
//  Created by Jihong Zhang on 11/2/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import Foundation
import UIKit


class  JZThirdViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = "Third";
        
        self.view.backgroundColor = UIColor.blueColor();
        
        var button = UIButton.buttonWithType(.System) as UIButton;
        var frame = CGRect(x: 100, y: 100, width: 200, height: 40);
        button.frame = frame;
        button.setTitle("Back to Second Page", forState: .Normal);
        button.addTarget(self, action: "clickMe:", forControlEvents: .TouchUpInside);
        self.view.addSubview(button);
        
        
        self.navigationItem.title = "Third Page";
        
    }
    
    func clickMe(sender: UIButton){
        self.navigationController?.popViewControllerAnimated(true);
    }
}