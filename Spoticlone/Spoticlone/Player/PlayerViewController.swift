//
//  PlayerViewController.swift
//  Spoticlone
//
//  Created by Ariana Rodríguez on 01/03/25.
//

import UIKit

final class PlayerViewController: UIViewController {
    // MARK: - UI Components
    @IBOutlet var artImageView: UIImageView!
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var addSongButton: UIButton!
    @IBOutlet var playbutton: UIButton!
    private var song: Song?
    
    // MARK: - Initializer
    init(song: Song?) {
        super.init(nibName: nil, bundle: nil)
        
        guard let song else {
            self.song = Song(title: "Four Sure - Dan Deacon Remix",
                             artist: "Future Islands, Dan Deacon",
                             duration: "3:19")
            return
        }
        self.song = song
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUIComponents()
        songNameLabel.text = song?.title
        artistLabel.text = song?.artist
        durationLabel.text = song?.duration
    }
}

extension PlayerViewController {
    // UI Components customization
    private func customizeUIComponents() {
        // TODO: Set bakground gradient based on the art
        artImageView.backgroundColor = UIColor(hex: "#8A2BE2")
        
        var addSongConfiguration = UIButton.Configuration.plain()
        addSongConfiguration.baseForegroundColor = .spotigreen
        let checkmarkImageConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        addSongConfiguration.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: checkmarkImageConfiguration)
        addSongButton.configuration = addSongConfiguration
        
        var playConfiguration = UIButton.Configuration.plain()
        playConfiguration.baseBackgroundColor = .white
        let playImageConfiguration = UIImage.SymbolConfiguration(pointSize: 50)
        playConfiguration.image = UIImage(systemName: "play.circle.fill", withConfiguration: playImageConfiguration)
        playbutton.configuration = playConfiguration
    }
}
