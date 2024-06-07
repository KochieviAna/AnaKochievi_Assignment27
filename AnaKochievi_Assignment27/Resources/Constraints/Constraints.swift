//
//  Constraints.swift
//  AnaKochievi_Assignment27
//
//  Created by MacBook on 06.06.24.
//

import UIKit

class Constraint {
    
    static let deviceHeight = UIScreen.main.bounds.height
    static let deviceWidth = UIScreen.main.bounds.width
    
    static var xCoeff: CGFloat {
        return deviceWidth / 375
    }
    
    static var yCoeff: CGFloat {
        return deviceHeight / 822
    }

}
