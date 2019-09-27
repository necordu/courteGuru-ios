//
//  CGAuthViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 27/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit

class CGAuthViewController: UIViewController {
    @IBOutlet var vkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vkButton.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }
    
    @IBAction func authVk(_ sender: Any) {
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
