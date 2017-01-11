//
//  Character.swift
//  rpgoop
//
//  Created by Francisco Claret on 22/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import Foundation

class Character {
    
    fileprivate var _hp: Int = 100
    fileprivate var _attackPwr = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(_ attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
    
}
