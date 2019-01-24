//
//  ViewControllerOne.swift
//  digitalStethoscope
//
//  Created by Andrew Stoycos on 4/23/18.
//  Copyright © 2018 Andrew Stoycos. All rights reserved.
//

import Foundation

import UIKit

class ViewControllerOne: UIViewController {
    
    
    @IBOutlet weak var RoundedCornerButton2:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        RoundedCornerButton2.layer.cornerRadius = 4
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
}
