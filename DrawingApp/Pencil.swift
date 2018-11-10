//
//  Pencil.swift
//  DrawingApp
//
//  Created by Ruslan Akberov on 10/11/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

enum Pencil {
    case black
    case gray
    case red
    case orange
    case yellow
    case lightGreen
    case darkGreen
    case azure
    case blue
    case brown
    case eraser
    
    init?(tag: Int) {
        switch tag {
        case 1: self = .black
        case 2: self = .gray
        case 3: self = .red
        case 4: self = .orange
        case 5: self = .yellow
        case 6: self = .lightGreen
        case 7: self = .darkGreen
        case 8: self = .azure
        case 9: self = .blue
        case 10: self = .brown
        case 11: self = .eraser
        default: return nil
        }
    }
    
    var color: UIColor {
        switch self {
        case .black: return .black
        case .gray: return .gray
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .lightGreen: return UIColor(red: 0, green: 249 / 255, blue: 0, alpha: 1)
        case .darkGreen: return UIColor(red: 0, green: 144 / 255, blue: 81 / 255, alpha: 1)
        case .azure: return UIColor(red: 0, green: 253 / 255, blue: 1, alpha: 1)
        case .blue: return .blue
        case .brown: return .brown
        case .eraser: return .white
        }
    }
}
