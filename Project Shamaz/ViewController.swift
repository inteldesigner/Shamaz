//
//  ViewController.swift
//  Project Shamaz
//
//  Created by Eric Stein on 12/31/18.
//  Copyright © 2018 Eric Stein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- IBOutlets -
    @IBOutlet weak var textFieldStories: UITextView!
    @IBOutlet weak var textFieldForNumberPlayer: UITextField!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var futureButton: UIButton!
    @IBOutlet weak var textFieldNextPlayer: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK:- Variables -
    var totalPlayers: Int = 0
    let futureExperiences = [" What would you like to be doing a month from now? "," What would you like to be doing 2 weeks from now? "," What would you like to be doing 3 days from now? ", " What country have you visited? ", " What country will you visit next? ", " What language would you like to learn? "]
    let pastExperiences = [" What did you do last week? ", " what did you do yesterday? ", " What did you do last monday? "," What did you do last weekend? ", " What country have you visited? ", " Where were you born? "]
    let nextPlayers = [" Next Player #1 ", " Next Player #2 ", " Next Player #3 ", " Next Player #4 ", " Next Player #5 ", " Next Player #6 "," Next Player #7 "," Next Player #8 "," Next Player #9 "," Next Player #10 "," Next Player #11 "," Next Player #12 "]
    
    // MARK:- IBActions -
    @IBAction func enterButton(_ sender: UIButton) {
        if let enteredPlayerNumber = Int(textFieldForNumberPlayer.text!) {
            if enteredPlayerNumber <= 12 && enteredPlayerNumber >= 2 {
                textFieldForNumberPlayer.text = ""
                resign()
                totalPlayers = enteredPlayerNumber
                flipUI()
            } else {
                alertForInvalidEntries()
            }
        } else {
            alertForInvalidEntries()
        }
    }
    
    @IBAction func pastButton(_ sender: UIButton) {
        textFieldStories.text = pastExperiences[Int.random(in: 0..<pastExperiences.count)]
        textFieldNextPlayer.text = nextPlayers[Int.random(in: 0..<totalPlayers)]
    }
    
    @IBAction func futureButton(_ sender: UIButton) {
        textFieldStories.text = futureExperiences[Int.random(in: 0..<futureExperiences.count)]
        textFieldNextPlayer.text = nextPlayers[Int.random(in: 0..<totalPlayers)]
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        totalPlayers = 0
        flipUI()
    }
    
    // MARK:- Functions -
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(resign))
        view.addGestureRecognizer(tap)
    }
    
    @objc func resign() {
        view.endEditing(true)
    }
    
    func alertForInvalidEntries() {
        let alert = UIAlertController(title: "", message: "Please enter a valid number of players (min. 2 players, max. 12)", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    
    func flipUI() {
        textFieldStories.isHidden = !textFieldStories.isHidden
        textFieldForNumberPlayer.isHidden = !textFieldForNumberPlayer.isHidden
        subtitle.isHidden = !subtitle.isHidden
        startButton.isHidden = !startButton.isHidden
        pastButton.isHidden = !pastButton.isHidden
        futureButton.isHidden = !futureButton.isHidden
        textFieldNextPlayer.isHidden = !textFieldNextPlayer.isHidden
        resetButton.isHidden = !resetButton.isHidden
    }
}

