//
//  ViewController.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/13/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class PickSignViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var signPicker: UIPickerView!
    
    private let signs = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"].sorted()
    private var signName: String?
    
    private var horoscopes = [Horoscope]() {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHoroscopes()
        signPicker.dataSource = self
        signPicker.delegate = self
        signName = signs.first
    }
    private func loadHoroscopes() {
        HoroscopeAPIClient.getHoroscope(for: "Libra") { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success(let horoscopes):
                self?.horoscopes = horoscopes
            }
        }
    }

}

extension PickSignViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return signs.count
  }
}

extension PickSignViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return signs[row]
  }
}
