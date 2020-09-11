//
//  QuestionsViewController.swift
//  inquirer
//
//  Created by Никита Микрюков on 11.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
      // MARK: - Private Properties
    
    private let questions = Question.getQuestions()
       private var questionIndex = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - Private Methodx
extension QuestionsViewController {
private func updateUI() {
    // hide stacks
    for stackView in [singleStackView, multipleStackView, rangedStackView] {
        stackView?.isHidden = true
    }
    // get current question
           let currentQuestion = questions[questionIndex]
    //set current question for question label
           questionLabel.text = currentQuestion.text
    // calculate progress
           let totalProgress = Float(questionIndex) / Float(questions.count)
           
           // set progress
           questionProgressView.setProgress(totalProgress, animated: true)
           
           // set navigation title
           title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
    
// show stacks corresponding to response type
     showCurrentAnswers(for: currentQuestion.type)
 }
 private func showCurrentAnswers(for type: ResponseType) {
      switch type {
      case .single: showSingleAnswers(with: currentAnswers)
      case .multiple: break
      case .ranged: break
  }
  
 /// Setup single stack view
 ///
 /// - Parameter answers: array with answers
 ///
 /// Description of method
 private func showSingleAnswers(with answers: [Answer]) {
     singleStackView.isHidden = false
     
     for (button, answer) in zip(singleButtons, answers) {
         button.setTitle(answer.text, for: .normal)
     }
 }
}
}
