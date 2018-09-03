//
//  UiUtils.swift
//  Travel Companion
//
//  Created by Stefan Jaindl on 24.08.18.
//  Copyright © 2018 Stefan Jaindl. All rights reserved.
//

import Firebase
import Foundation
import UIKit

class UiUtils {
    
    static func showToast(message : String, view: UIView) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 200, y: view.frame.size.height - 100, width: 500, height: 70))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 11.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    static func setImage(_ imageName: String, for item: UIBarButtonItem) {
        let imageSetting = UIImageView(image: UIImage(named: imageName))
        imageSetting.image = imageSetting.image!.withRenderingMode(.alwaysOriginal)
        imageSetting.tintColor = UIColor.clear
        item.image = imageSetting.image
    }
    
    static func formatTimestampRangeForDisplay(begin: Timestamp, end: Timestamp) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        
        let formattedDate = dateFormatter.string(from: begin.dateValue()) + " - " + dateFormatter.string(from: end.dateValue())
        return formattedDate
    }
}