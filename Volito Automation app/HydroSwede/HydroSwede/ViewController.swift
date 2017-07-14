//
//  ViewController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-09.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func AboutClick(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://www.volitoautomation.se")!);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "HydSupply Hydraulic Calculator"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }


}

