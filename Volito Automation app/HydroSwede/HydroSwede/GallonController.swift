//
//  GallonController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-08-21.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class GallonController: UIViewController {

    @IBOutlet weak var gallonText: UITextField!
    @IBOutlet weak var literText: UITextField!
    @IBOutlet weak var impText: UITextField!
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Find Store", style: .plain, target: self, action: #selector(showMap))

        // Do any additional setup after loading the view.
    }

    @IBAction func fromGallon(_ sender: UIButton) {
        
        if(gallonText.text == ""){
            return
        }
        let gallon = gallonText.text!.floatValue
        let liter = gallon * 3.78541178
        let imp = gallon * 0.8326741881476207
        
        impText.text = String(format: "%.2f", imp)
        literText.text = String(format: "%.2f", liter)
        
    }
    
    @IBAction func fromLiter(_ sender: UIButton) {
        
        if(literText.text == ""){
            return
        }
        let liter = literText.text!.floatValue
        let gallon = liter * 0.264172052
        let imp = liter * 0.21996924829908776
        
        impText.text = String(format: "%.2f", imp)
        gallonText.text = String(format: "%.2f", gallon)
        
    }
    
    @IBAction func fromIMP(_ sender: UIButton) {
        
        if(impText.text == ""){
            return
        }
        let imp = impText.text!.floatValue
        let gallon = imp * 1.201
        let liter = imp * 4.5461
        
        literText.text = String(format: "%.2f", liter)
        gallonText.text = String(format: "%.2f", gallon)
        
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
