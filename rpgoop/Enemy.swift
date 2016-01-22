//
//  Enemy.swift
//  rpgoop
//
//  Created by Francisco Claret on 22/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["rusty Dagger", "Cracked Buvkler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
    
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
}