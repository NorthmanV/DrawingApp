//
//  ViewController.swift
//  DrawingApp
//
//  Created by Ruslan Akberov on 05/11/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var colorsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsStackView.arrangedSubviews.forEach {
            $0.layer.cornerRadius = $0.bounds.width / 2
        }
    }

    @IBAction func resetPressed(_ sender: UIButton) {
    }
    
    @IBAction func sharePressed(_ sender: UIButton) {
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
    }
    
}

