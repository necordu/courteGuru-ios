//
//  CGAuthViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 27/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import Foundation

protocol vkAuth: class {
    
    func pushForward(result: String)
    
}

class CGAuthViewController: UIViewController, vkAuth {
    @IBOutlet var vkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vkButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
        
    }
    @IBSegueAction func presentWeb(_ coder: NSCoder) -> CGVKController? {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc : CGVKController = storyboard.instantiateViewController(withIdentifier: "vkAuth") as! CGVKController
        vc.delegate = self
        
        return vc
    }
    
    @IBAction func authVk(_ sender: Any) {
        
        let vc = CGVKController()
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func pushForward(result: String) {
        
        if result == "Success" {
            self.present(CGTabBar(), animated: true, completion: nil)
        } else {
            print(result)
        }
        
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
