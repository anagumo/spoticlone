//
//  SongTableViewCell.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 01/03/25.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = String(describing: SongTableViewCell.self)
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    func configure(with song: Song) {
        nameLabel.text = song.title
        artistLabel.text = song.artist
        durationLabel.text = song.duration
    }
}
