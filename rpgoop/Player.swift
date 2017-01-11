//
//  Player.swift
//  rpgoop
//
//  Created by Francisco Claret on 22/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import Foundation

class Player: Character {
    
    fileprivate var _name: String = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    fileprivate var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory(_ item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        _name = name
    }
}
