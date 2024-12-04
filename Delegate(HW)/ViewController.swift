//
//  ViewController.swift
//  Delegate(HW)
//
//  Created by Yernur Adilbek on 12/4/24.
//

import UIKit

protocol SelectCategoryProtocol {
    func setCategory(_ category: String)
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    var delegate: SelectCategoryProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 20
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: containerView))! {
            return false
        } else {
            return true
        }
    }

    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func add(_ sender: UIButton) {
        delegate?.setCategory(textField.text!)
        dismissView()
    }
    
}

