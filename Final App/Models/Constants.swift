//
//  Constants.swift
//  Final App
//
//  Created by Matthew Hartstein (student LM) on 3/15/24.
//

import SwiftUI

extension Color {
    static let blueish = Color("blueish")
    static let darkGreen = Color("darkGreen")
    static let lightGreen = Color("lightGreen")
    static let yellow = Color("yellow")
}

struct Constants {

    static let largeFancyFont: Font = Font(UIFont(name: "GillSans", size: 50) ?? UIFont.systemFont(ofSize: 50))
    
    static let mediumFancyFont: Font = Font(UIFont(name: "GillSans", size: 35) ?? UIFont.systemFont(ofSize: 35))

    static let smallFancyFont: Font = Font(UIFont(name: "GillSans", size: 20) ?? UIFont.systemFont(ofSize: 20))
    
    static let largeFont: Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 50) ?? UIFont.systemFont(ofSize: 50))
    
    static let mediumFont: Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 35) ?? UIFont.systemFont(ofSize: 35))
    
    static let smallFont: Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 20) ?? UIFont.systemFont(ofSize: 20))

}
