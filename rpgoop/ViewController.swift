//
//  ViewController.swift
//  rpgoop
//
//  Created by Francisco Claret on 22/01/16.
//  Copyright © 2016 Francisco Claret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var attackButtonLbl: UIButton!
    
    @IBOutlet weak var printLbl: UILabel!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        player = Player(name: "Mannen", hp: 110, attackPwr: 20)
        playerHpLbl.text = ("\(player.hp)")
        print(player.hp)
    
        generateRandomEnemy()
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
            if rand == 0 {
                enemy = Kimara(startingHP: 50, attackPwr: 12)
            } else {
                enemy = DevilWizard(startingHP: 70, attackPwr: 15)
        }
        enemyImg.isHidden = false
        enemyHpLbl.isHidden = false
        enemyHpLbl.text = String(enemy.hp)
        attackButtonLbl.isHidden = false
        printLbl.text = "Lets go! Press Attack button!"
    }
    

    @IBAction func onChestTapped(_ sender: AnyObject) {
        chestButton.isHidden = true
        printLbl.text = chestMessage
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackButtonTapped(_ sender: UIButton) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = String(enemy.hp)
        } else {
            printLbl.text = "Attack failed"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.isHidden = false
            attackButtonLbl.isHidden = true
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type). Tapp chest to collect loot!"
            enemyImg.isHidden = true
        }
        
    }
}



