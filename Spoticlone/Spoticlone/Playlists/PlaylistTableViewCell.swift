//
//  PlaylistTableViewCell.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 28/02/25.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    //MARK: - Identifier
    static let identifier = String(describing: PlaylistTableViewCell.self)
    // MARK: - UI Components
    @IBOutlet var roundedView: UIView!
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(with playlist: Playlist) {
        roundedView.backgroundColor = UIColor(hex: playlist.color)
        roundedView.layer.cornerRadius = 4
        emojiLabel.text = playlist.emoji
        nameLabel.text = playlist.name
        descriptionLabel.text = playlist.description
    }
}
