//
//  ViewController.swift
//  digitalStethoscope
//
//  Created by Andrew Stoycos on 11/5/17.
//  Copyright © 2017 Andrew Stoycos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RoundedCornerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        RoundedCornerButton.layer.cornerRadius = 4
        //RoundedCornerButton2.layer.cornerRadius = 4
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}

