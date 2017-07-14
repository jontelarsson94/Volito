//
//  InchController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-17.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class InchController: UIViewController {

    @IBOutlet weak var inchField: UITextField!
    
    @IBOutlet weak var mmField: UITextField!
    @IBOutlet weak var ftField: UITextField!
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FromInch(_ sender: UIButton) {
        
        if(inchField.text == "")
        {
            return;
        }
        else{
            let inch = inchField.text!.floatValue;
            let mm : CGFloat = CGFloat(inch) * 25.4
            let ft : CGFloat = CGFloat(inch) * 0.0833333333
            mmField.text = String(format: "%.3f", mm);
            ftField.text = String(format: "%.3f", ft);
        }
        
    }
    @IBAction func FromMm(_ sender: UIButton) {
        
        if(mmField.text == "")
        {
            return;
        }
        else{
            let mm = mmField.text!.floatValue
            let inch : CGFloat = CGFloat(mm) * 0.0393700787
            let ft : CGFloat = CGFloat(mm) * 0.0032808399
            inchField.text = String(format: "%.3f", inch)
            ftField.text = String(format: "%.3f", ft)
        }
        
    }
    
    @IBAction func FromFt(_ sender: UIButton) {
        
        if(ftField.text == "")
        {
            return;
        }
        else{
            let ft = ftField.text!.floatValue;
            let mm : CGFloat = CGFloat(ft) * 304.8
            let inch : CGFloat = CGFloat(ft) * 12
            mmField.text = String(format: "%.3f", mm);
            inchField.text = String(format: "%.3f", inch);
        }
        
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
