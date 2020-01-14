//
//  AlertExtension.swift
//  Horoscope
//
//  Created by Lilia Yudina on 1/13/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

extension UIViewController {
  func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}
