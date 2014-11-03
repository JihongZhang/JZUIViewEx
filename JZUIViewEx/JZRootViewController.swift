//
//  JZRootViewController.swift
//  JZNavigationController
//
//  Created by Jihong Zhang on 11/2/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import Foundation
import UIKit

class JZRootViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArr = NSMutableArray();
    var _tableView :  UITableView?;
    
    
    override func viewDidLoad() {
        self.title = "First";
        
        let nextItem = UIBarButtonItem(title: "NextPage", style:.Plain, target: self, action: "goToNextPage");
        
        self.navigationItem.rightBarButtonItem = nextItem;
        self.navigationItem.title = "First Page";
        
        for(var i=0; i<100; i++){
            dataArr.addObject("row \(i)");
        }
        var rect:CGRect = self.view.bounds; //get the self.view size
        _tableView = UITableView(frame: rect, style:.Plain);
        _tableView!.delegate = self;
        _tableView!.dataSource = self;
        self.view.addSubview(_tableView!);
        
    }
    
    func goToNextPage() {
        NSLog("goToNextPage clicked");
        let svc = JZSecondViewController();
        self.navigationController?.pushViewController(svc, animated: true);
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArr.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellid = "my cell id";
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid) as? UITableViewCell;
        if(cell == nil){
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellid);
        }
        var s = dataArr.objectAtIndex(indexPath.row) as? String;
        cell!.textLabel.text = s;
        return cell!;
        
    }
    
    //optional func numberOfSectionsInTableView(tableView: UITableView) -> Int // Default is 1 if not implemented
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("row \(indexPath.row) selected");
    }
 
  
}
