//
//  Kimara.swift
//  rpgoop
//
//  Created by Francisco Claret on 22/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Golden Spear", "Kimara Venom", "Tough hide"]
    }

    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            super.attemptAttack(attackPwr)
            return true
        }
        return false
    }






}