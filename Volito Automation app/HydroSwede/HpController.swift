//
//  HpController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-08-20.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class HpController: UIViewController {

    @IBOutlet weak var kwText: UITextField!
    @IBOutlet weak var hpText: UITextField!
    @IBOutlet weak var kcalText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))

        // Do any additional setup after loading the view.
    }
    
    @objc func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }

    @IBAction func FromHp(_ sender: UIButton) {
        
        if(hpText.text == ""){
            return
        }
        let hp = hpText.text!.floatValue
        let kw = hp * 0.745699872
        let kcal = hp * 641.16
        
        kwText.text = String(format: "%.2f", kw)
        kcalText.text = String(format: "%.2f", kcal)
        
    }
    
    @IBAction func FromKw(_ sender: UIButton) {
        
        if(kwText.text == ""){
            return
        }
        let kw = kwText.text!.floatValue
        let hp = kw * 1.34102209
        let kcal = kw * 859.8452278589854
        
        hpText.text = String(format: "%.2f", hp)
        kcalText.text = String(format: "%.2f", kcal)
        
    }
    
    @IBAction func FromKcal(_ sender: UIButton) {
        
        if(kcalText.text == ""){
            return
        }
        let kcal = kcalText.text!.floatValue
        let hp = kcal * 0.00155898123324
        let kw = kcal * 0.001163
        
        hpText.text = String(format: "%.2f", hp)
        kwText.text = String(format: "%.2f", kw)
        
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
