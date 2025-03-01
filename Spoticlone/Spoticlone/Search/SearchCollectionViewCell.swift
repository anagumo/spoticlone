//
//  SearchCollectionViewCell.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    // MARK: - Identifier
    static let identifier = String(describing: SearchCollectionViewCell.self)
    // MARK: - UI Components
    @IBOutlet var roundedView: UIView!
    @IBOutlet var genreNameLabel: UILabel!
    
    func configure(genre: Genre) {
        genreNameLabel.text = genre.name
        roundedView.backgroundColor = UIColor(hex: genre.color)
        roundedView.layer.cornerRadius = 6
    }
}
