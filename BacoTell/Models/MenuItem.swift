//
//  MenuItem.swift
//  BacoTell
//
//  Created by Srinath Shah on 5/19/24.
//

import SwiftUI

protocol MenuItem: Identifiable, Codable {
    static var id: String {get}
    var calories: UInt8 {get}
    var name: String {get}
    var image: Image {get}
}


class Chalupa: MenuItem {
    static var id: String {String(describing: self)}
    var name: String {
        String(describing: self)
    }
    var calories: UInt8 {
        fatalError("Child must implement this")
    }
    var image: Image {
        fatalError("Child must implement this")
    }
}

final class GrilledChalupa: Chalupa {
    override var name: String {"Grilled Chalupa"}
}
