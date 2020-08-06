//
//  ViewController.swift
//  Combine example
//
//  Created by Artem Mkrtchyan on 8/5/20.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    lazy var viewModel: CombineViewModel = {
        let model = CombineViewModel()
        return model
    }()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindView()
    }

    func bindView() {
        
        viewModel.$text.sink{ [weak self] v in
            self?.lbl.text = v
        }.store(in: &cancellables)
        
        
        textfield.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .allEditingEvents)
        
    }

}

extension ViewController {
    @objc func textFieldDidChange(_ textField: UITextField) {
        viewModel.text = textfield.text ?? ""
    }
}

