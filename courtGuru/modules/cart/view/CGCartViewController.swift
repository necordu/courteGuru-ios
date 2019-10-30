//
//  CGCartViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 29.10.2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit

class CGCartViewController: UIViewController {
    
    var viewModel: CGCartViewModelProtocol?{
        didSet {
            fillUI()
        }
    }
   
    @IBOutlet var shopView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = CGCartViewModelIn()
        // Do any additional setup after loading the view.
        
        
    }
    
    func fillUI() {
        
        shopView.layer.cornerRadius = 10
        shopView.layer.masksToBounds = false
        shopView.layer.shadowColor = UIColor.black.cgColor
        shopView.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)//CGSizeMake(0.0f, 5.0f);
        shopView.layer.shadowOpacity = 0.2
        
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
