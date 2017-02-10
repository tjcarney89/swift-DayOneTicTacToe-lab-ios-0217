//
//  Player.swift
//  TicTacToe
//
//  Created by Jim Campagno on 2/5/17.
//  Copyright © 2017 Jim Campagno. All rights reserved.
//

import Foundation
import UIKit


enum Player: CustomStringConvertible {
    
    case x, o
    
    var image: UIImage {
        switch self {
        case .o:
            return #imageLiteral(resourceName: "OImage")
        case .x:
            return #imageLiteral(resourceName: "XImage")
        }
    }
    
    var description: String {
        switch self {
        case .o:
            return "o"
        case .x:
            return "x"
        }
    }
    
}
