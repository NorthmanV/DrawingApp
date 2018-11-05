//
//  SettingsViewController.swift
//  DrawingApp
//
//  Created by Ruslan Akberov on 05/11/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var brushSlider: UISlider!
    @IBOutlet weak var brushLabel: UILabel!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBAction func closePressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func brushChanged(_ sender: UISlider) {
    }
    
    @IBAction func opacityChabged(_ sender: UISlider) {
    }
    
    @IBAction func colorChanged(_ sender: UISlider) {
    }
    
}
