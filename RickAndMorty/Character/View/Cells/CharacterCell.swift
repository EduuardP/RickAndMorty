//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Eduuard Pinzon on 3/07/23.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet private weak var profileImage: UIImageView!
    
    @IBOutlet private weak var name: UILabel!
    
    @IBOutlet private weak var aliveView: UIView! {
        didSet {
            aliveView.layer.cornerRadius = aliveView.bounds.size.width / 2.0
        }
    }
    
    @IBOutlet private weak var species: UILabel!
    
    @IBOutlet private weak var lastLocationPlaceholder: UILabel! {
        didSet {
            lastLocationPlaceholder.textColor = UIColor.gray
            lastLocationPlaceholder.text = "Last known location:"
        }
    }
    
    @IBOutlet private weak var lastLocationLabel: UILabel!
    
    @IBOutlet private weak var firstScenePlaceholder: UILabel! {
        didSet {
            firstScenePlaceholder.textColor = UIColor.gray
        }
    }
    
    @IBOutlet private weak var firstSceneLabel: UILabel! {
        didSet {
            
        }
    }
    
    func loadCharecter(character: Character) {
        
        self.profileImage.load(url: character.image ?? String())
        self.profileImage.contentMode = .scaleAspectFit
        self.name.text = character.name
        self.aliveView.backgroundColor = self.loadAliveColor(status: character.status ?? .unknown)
        self.species.text = "\(character.status?.rawValue ?? String()) - \(character.species?.rawValue ?? String())"
        self.lastLocationLabel.text = character.location?.name
    }
    
    private func loadAliveColor(status: Status) -> UIColor {
        switch status {
        case .alive:
            return .green
        case .dead:
            return .red
        default:
            return .gray
        }
    }
}
