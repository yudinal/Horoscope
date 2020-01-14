//
//  DetailViewController.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/14/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signNameLabel: UILabel!
    @IBOutlet weak var todayHoroscope: UITextField!
    
     var horoscope: Horoscope?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     loadHoroscopes()
        updateUI()
    }
    
    private func loadHoroscopes() {
        HoroscopeAPIClient.getHoroscope(for: "Libra") { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success(let horoscopes):
                self?.horoscope = horoscopes
            }
        }
    }
    
    func updateUI() {
        signNameLabel.text = horoscope?.sunsign
        todayHoroscope.text = horoscope?.horoscope
    }

}
