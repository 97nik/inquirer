//
//  ResultsViewController.swift
//  inquirer
//
//  Created by Никита Микрюков on 11.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // 1. Избавиться от кнопкп возврата
    // 2. Передать сюда массив с выбранными ответами
    // 3. Определить то животное, которое встречается чаще всего
    // 4. Отобразить результаты
    // 5. Подумать над логикой определени индекса в соответсвии с диапазоном
    

    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateResult()
    }
}

// MARK: - Private Methods
extension ResultsViewController {
    
    private func updateResult() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
       
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
      
        
        
//        for animal in animals {
//            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//        }
//
        
//        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
//        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
     
        // Решение в одну строку:
        let mostFrequencyAnimal = Dictionary(grouping: answers, by: { $0.type })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}

