//
//  ViewController.swift
//  Lab5
//
//  Created by BenD on 2/23/22.
//

import UIKit

class ViewController: UIViewController {
    var randomPM: Pokemon!
    var pokemonDataHandler = PokemonDataHandler()
    
    //outlets
    @IBOutlet weak var PokemonLabel: UILabel!
    @IBOutlet weak var HPLabel: UILabel!
    @IBOutlet weak var ATKLabel: UILabel!
    @IBOutlet weak var SpecialATKLabel: UILabel!
    @IBOutlet weak var DEFLabel: UILabel!
    @IBOutlet weak var SpecialDEFLabel: UILabel!
    @IBOutlet weak var SpeedLabel: UILabel!
    @IBOutlet weak var TypingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIDdata()
    }
    
    func getAPIDdata() {
        Task {
            await pokemonDataHandler.loadjson()
            randomPM = pokemonDataHandler.getRandomPokemon()
            //print(randomPM!)
            PokemonLabel.text = "Your Pokemon of the Day is: " + randomPM.name
            
            for currentStat in randomPM.stats{
                if(currentStat.stat.name == "hp"){
                    HPLabel.text = "HP: " + String(currentStat.base_stat)
                }
                if(currentStat.stat.name == "attack"){
                    ATKLabel.text = "ATK: " + String(currentStat.base_stat)
                }
                if(currentStat.stat.name == "defense"){
                    DEFLabel.text = "DEF: " + String(currentStat.base_stat)
                }
                if(currentStat.stat.name == "special-attack"){
                    SpecialATKLabel.text = "Special ATK: " + String(currentStat.base_stat)
                }
                if(currentStat.stat.name == "special-defense"){
                    SpecialDEFLabel.text = "Special DEF: " + String(currentStat.base_stat)
                }
                if(currentStat.stat.name == "speed"){
                    SpeedLabel.text = "Speed: " + String(currentStat.base_stat)
                }
            }
            
            var types = ""
            for typings in randomPM.types{
                types += typings.type.name + " "
            }
            TypingLabel.text = "Type: " + types
        }
    }

    @IBAction func Randomize(_ sender: UIButton) {
        getAPIDdata()
    }
}

