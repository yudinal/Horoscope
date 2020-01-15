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
    
    var horoscope: Horoscope?
    var selectedPickerIndex = 0
    var userSelectedSign = "aries"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signPicker.dataSource = self
        signPicker.delegate = self
        signName = signs.first
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectedSign = signPicker?.selectedRow(inComponent: 0) {
            selectedPickerIndex = selectedSign
        }
    }

   
    
    private func getData(sign: String) {
        HoroscopeAPIClient.getHoroscope(for: sign) { (result) in
            switch result {
            case .failure(let appError):
                self.showAlert(title: "error", message: "Error: \(appError)")
            case .success(let horoscope):
                self.horoscope = horoscope
                dump(horoscope)
            }
        }
    }
    
    @IBAction func seeHoroscopeAction(_ sender: UIButton) {
    
        guard  userName.hasText else {
            self.showAlert(title: "Sorry", message: "Name required")
            return}
        guard userSelectedSign != "" else {
            showAlert(title: "Sorry", message: "Please select the sign")
            return
        }
        getData(sign: userSelectedSign)
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSelectedSign = signs[row].lowercased()
    }
}
