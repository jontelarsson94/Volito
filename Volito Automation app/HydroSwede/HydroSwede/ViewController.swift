//
//  ViewController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-09.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func AboutClick(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.volitoautomation.se")!);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

