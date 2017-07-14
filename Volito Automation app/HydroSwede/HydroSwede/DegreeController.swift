//
//  DegreeController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-09.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class DegreeController: UIViewController {

    @IBOutlet weak var textFieldFahr: UITextField!
    @IBOutlet weak var textFieldCels: UITextField!
    @IBOutlet weak var textFieldKelv: UITextField!
    
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
    
    @IBAction func FromFahrenheitClick(_ sender: UIButton) {
        
        if(textFieldFahr.text == "")
        {
            return;
        }
        else{
            let fahr = textFieldFahr.text!.floatValue;
            let cels : CGFloat = (CGFloat(fahr) - 32)/1.8;
            let kelv : CGFloat = (CGFloat(fahr) - 32)/1.8 + 273.15;
            textFieldCels.text = String(format: "%.2f", cels);
            textFieldKelv.text = String(format: "%.2f", kelv);
        }
        
    }
    
    @IBAction func FromCelsius(_ sender: UIButton) {
        
        if(textFieldCels.text == "")
        {
            return;
        }
        else{
            let cels = textFieldCels.text!.floatValue;
            let kelv : CGFloat = CGFloat(cels) + 273.15;
            let fahr : CGFloat = (CGFloat(cels) * 1.8) + 32;
            textFieldFahr.text = String(format: "%.2f", fahr);
            textFieldKelv.text = String(format: "%.2f", kelv);
        }
    }
    
    @IBAction func FromKelvinClick(_ sender: UIButton) {
        
        if(textFieldKelv.text == "")
        {
            return;
        }
        else
        {
            let kelv = textFieldKelv.text!.floatValue;
            let cels : CGFloat = CGFloat(kelv) - 273.15;
            let fahr : CGFloat = (CGFloat(kelv)-273.15)*1.8 + 32;
            textFieldFahr.text = String(format: "%.2f", fahr);
            textFieldCels.text = String(format: "%.2f", cels);
        }
        
    }

}
