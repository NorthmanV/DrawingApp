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
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 5.0
    var opacity: CGFloat = 1
    var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsStackView.arrangedSubviews.forEach {
            $0.layer.cornerRadius = $0.bounds.width / 2
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swiped = false
        lastPoint = touch.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swiped = true
        let currentPoint = touch.location(in: view)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if the user just tapped the screen to draw a single point
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
        // when you merge tempImageView with mainImageView, you can set the tempImageView opacity to the configured value, thus giving the brush stroke the opacity you want
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        tempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tempImageView.image = nil
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        tempImageView.image?.draw(in: view.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }

    @IBAction func resetPressed(_ sender: UIButton) {
        mainImageView.image = nil
    }
    
    @IBAction func sharePressed(_ sender: UIButton) {
        guard let image = mainImageView.image else { return }
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        guard let pencil = Pencil(tag: sender.tag) else { return }
        color = pencil.color
        if pencil == .eraser {
            opacity = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController,
              let settingsVC = navController.topViewController as? SettingsViewController
        else { return }
        settingsVC.delegate = self
        settingsVC.brush = brushWidth
        settingsVC.opacity = opacity
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        settingsVC.red = red
        settingsVC.green = green
        settingsVC.blue = blue
    }
    
}

// MARK: - SettingsViewControllerDelegate

extension ViewController: SettingsViewControllerDelegate {
    
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController) {
        brushWidth = settingsViewController.brush
        opacity = settingsViewController.opacity
        color = UIColor(red: settingsViewController.red, green: settingsViewController.green, blue: settingsViewController.blue, alpha: 1)
    }
    
}

