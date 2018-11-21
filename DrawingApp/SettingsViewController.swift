//
//  SettingsViewController.swift
//  DrawingApp
//
//  Created by Ruslan Akberov on 05/11/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController)
}

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
    
    var brush: CGFloat = 10
    var opacity: CGFloat = 1
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brushSlider.value = Float(brush)
        brushLabel.text = String(format: "%.1f", brush)
        opacitySlider.value = Float(opacity)
        opacityLabel.text = String(format: "%.1f", opacity)
        redSlider.value = Float(red * 255)
        redLabel.text = Int(redSlider.value).description
        greenSlider.value = Float(green * 255)
        greenLabel.text = Int(greenSlider.value).description
        blueSlider.value = Float(blue * 255)
        blueLabel.text = Int(blueSlider.value).description
        drawPreview()
    }
    
    @IBAction func closePressed(_ sender: UIBarButtonItem) {
        delegate?.settingsViewControllerFinished(self)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func brushChanged(_ sender: UISlider) {
        brush = CGFloat(sender.value)
        brushLabel.text = String(format: "%.1f", brush)
        drawPreview()
    }
    
    @IBAction func opacityChanged(_ sender: UISlider) {
        opacity = CGFloat(sender.value)
        opacityLabel.text = String(format: "%.1f", opacity)
        drawPreview()
    }
    
    @IBAction func colorChanged(_ sender: UISlider) {
        red = CGFloat(redSlider.value / 255)
        redLabel.text = Int(redSlider.value).description
        green = CGFloat(greenSlider.value / 255)
        greenLabel.text = Int(greenSlider.value).description
        blue = CGFloat(blueSlider.value / 255)
        blueLabel.text = Int(blueSlider.value).description
        drawPreview()
    }
    
    func drawPreview() {
        UIGraphicsBeginImageContext(previewImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(.round)
        context.setLineWidth(brush)
        context.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        context.move(to: CGPoint(x: 45, y: 45))
        context.addLine(to: CGPoint(x: 45, y: 45))
        context.strokePath()
        previewImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    // In order to UIResponder doesn't pass touches to the underlying view controller
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        return
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        return
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        return
    }
}
