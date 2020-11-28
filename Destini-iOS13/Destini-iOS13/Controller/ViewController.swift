//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choiceAButton: UIButton!
    @IBOutlet weak var choiceBButton: UIButton!
    
    // Initialize a StoryBrain struct for holding story prompt/choices strings and methods for retreiving them
    var storyBrain = StoryBrain()
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        
        updateUI()
    }
    
    // User presses a choice button -> storyBrain determines the next story prompt, Controller updates UI with new prompt and choices
    @IBAction func choiceMade(_ sender: UIButton) {
        
        currentQuestion = storyBrain.nextStory(index: currentQuestion, buttonText: sender.currentTitle!)
        updateUI()
    }
    
    // Updates story prompt, choice A & B text for the current "chapter"
    func updateUI() {
        
        storyLabel.text = storyBrain.adventure[currentQuestion].storyText
        choiceAButton.setTitle(storyBrain.getAButtonText(index: currentQuestion), for: .normal)
        choiceBButton.setTitle(storyBrain.getBButtonText(index: currentQuestion), for: .normal)
    }
}

