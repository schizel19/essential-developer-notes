//
//  SampleViewController.swift
//  RequirementAnalysis
//
//  Created by Patrick Domingo on 7/26/22.
//

import UIKit

struct Output {
    let text: String
}

class Sampleton {
    static let shared = Sampleton()
    func loadText(_ text: String, completion: @escaping (Output) -> Void) { }
}

class SampleViewController: UIViewController {
    var outputText: String = ""
    var inputText: String = ""
    var sampleton: Sampleton = .shared
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleton.loadText(inputText) { [weak self] output in
            guard let self = self else { return }
            self.outputText = output.text
        }
    }
}
