//
//  AreaController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-08-21.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class AreaController: UIViewController {

    @IBOutlet weak var inchText: UITextField!
    @IBOutlet weak var cmText: UITextField!
    @IBOutlet weak var ftText: UITextField!
    
    @objc func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func fromInch(_ sender: UIButton) {
        
        if(inchText.text == "")
        {
            return
        }
        
        let inch = inchText.text!.floatValue
        let cm = inch * 16.387064
        let ft = inch * 0.000578703704
        
        cmText.text = String(format: "%.2f", cm)
        ftText.text = String(format: "%.2f", ft)
        
    }

    @IBAction func fromCm(_ sender: UIButton) {
        
        if(cmText.text == "")
        {
            return
        }
        
        let cm = cmText.text!.floatValue
        let inch = cm * 0.0610237441
        let ft = cm * 0.0000353147
        
        inchText.text = String(format: "%.2f", inch)
        ftText.text = String(format: "%.2f", ft)
        
    }
    
    @IBAction func fromFt(_ sender: UIButton) {
        
        if(ftText.text == "")
        {
            return
        }
        
        let ft = ftText.text!.floatValue
        let cm = ft * 28316.8466
        let inch = ft * 1728
        
        inchText.text = String(format: "%.2f", inch)
        cmText.text = String(format: "%.2f", cm)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
