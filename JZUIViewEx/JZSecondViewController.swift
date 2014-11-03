//
//  JZSecondViewController.swift
//  JZNavigationController
//
//  Created by Jihong Zhang on 11/2/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import Foundation
import UIKit


class  JZSecondViewController: UIViewController{
    var clickCount:Int = 0;
    var myLabel:UILabel?;       // ? : init is nil
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = "Second";
        
        self.view.backgroundColor = UIColor.purpleColor()
        
        var button = UIButton.buttonWithType(.System) as UIButton;
        var frame = CGRect(x: 100, y: 100, width: 200, height: 40);
        button.frame = frame;
        button.setTitle("Back to Previous Page", forState: .Normal);
        button.addTarget(self, action: "backToPreviousClicked:", forControlEvents: .TouchUpInside);
        self.view.addSubview(button);
        
        
        let nextItem = UIBarButtonItem(title: "ThirdPage", style:.Plain, target: self, action: "goToThirdPage");
        self.navigationItem.rightBarButtonItem = nextItem;
        self.navigationItem.title = "Second Page";
        
        
        var clickMeButton = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 40));
        clickMeButton.backgroundColor = UIColor.grayColor();
        clickMeButton.setTitle("Click Me", forState: .Normal);
        clickMeButton.addTarget(self, action: "clickMeClicked:", forControlEvents: .TouchUpInside);
        self.view.addSubview(clickMeButton);
        
        let rect = CGRect(x: 100, y: 150, width: 200, height: 44);
        myLabel = UILabel(frame: rect);
        myLabel!.text = "Click Count: ";
        myLabel!.backgroundColor = UIColor.grayColor();
        myLabel?.textAlignment = .Center;
        self.view.addSubview(myLabel!);
    }
    
    func backToPreviousClicked(sender: UIButton){
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func goToThirdPage() {
        NSLog("goToThirdPage clicked");
        let svc = JZThirdViewController();
        self.navigationController?.pushViewController(svc, animated: true);
    }
    
    func clickMeClicked(sender:UIButton) {
        clickCount += 1;
        myLabel!.text = "Click Count: \(clickCount)";
        
        
    }

}