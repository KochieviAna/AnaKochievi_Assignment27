//
//  Color+Extensions.swift
//  AnaKochievi_Assignment27
//
//  Created by MacBook on 06.06.24.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// Extension to create gradient UIColor
extension UIColor {
    static func gradient(fromHex hex1: String, toHex hex2: String, locations: [NSNumber] = [0.0, 1.0], withSize size: CGSize) -> UIColor? {
        let color1 = UIColor(hex: hex1)
        let color2 = UIColor(hex: hex2)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = locations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return gradientImage.map { UIColor(patternImage: $0) }
    }
}

