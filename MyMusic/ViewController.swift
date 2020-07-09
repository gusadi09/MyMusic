//
//  ViewController.swift
//  MyMusic
//
//  Created by Agus Adi Pranata on 10/07/20.
//  Copyright © 2020 gusadi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    private var _player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let url = Bundle.main.url(forResource: "guitar", withExtension: "wav") else {return}
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
            _player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
    }


    @IBAction func playPressed(_ sender: UIButton) {
        guard let player = _player else {return}
        player.play()
        stopButton.enable()
        playButton.disable()
    }
    @IBAction func stopPressed(_ sender: UIButton) {
        guard let player = _player else {return}
        player.stop()
        playButton.enable()
        stopButton.disable()
    }
}

extension UIButton {
    func enable() {
        self.isEnabled = true
    }
    
    func disable() {
        self.isEnabled = false
    }
}
