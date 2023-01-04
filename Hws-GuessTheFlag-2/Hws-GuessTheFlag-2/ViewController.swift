//
//  ViewController.swift
//  Hws-GuessTheFlag-2
//
//  Created by Burak Erden on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 1
    var finalTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        countries1()
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Question:\(questionAsked), \(countries[correctAnswer].uppercased()), \(score)"

    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var finalTitle: String
        questionAsked += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that is a flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        if score <= 0 {
            finalTitle = "Game Over!"
        } else {
            finalTitle = "Congrats, You Win!!"
        }
        
        let ac = UIAlertController(title: title, message: "Your Score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Countinue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        if questionAsked == 4 {
            let ac1 = UIAlertController(title: "\(title), next one is FINAL QUESTION", message: "Your Score is \(score).", preferredStyle: .alert)
            ac1.addAction(UIAlertAction(title: "Ask Me!", style: .default, handler: askQuestion))
            present(ac1, animated: true)
        }
        
        if questionAsked == 5 {
            let ac1 = UIAlertController(title: "It was \(title)", message: "\(finalTitle) Your Final Score is \(score).", preferredStyle: .alert)
            ac1.addAction(UIAlertAction(title: "RESTART", style: .default, handler: askQuestion))
            present(ac1, animated: true)
            score = 0
            correctAnswer = 0
            questionAsked = 1
        }
    }
    
    
    
// MARK: Configiration
    
    private func layout() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
    }
    
    private func countries1() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    
}

