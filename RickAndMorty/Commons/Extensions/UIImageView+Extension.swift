//
//  UIImageView+Extension.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import UIKit

extension UIImageView {
    func load(url: String) {
        guard let urlData = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlData) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
