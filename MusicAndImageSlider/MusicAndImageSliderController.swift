import UIKit

import AVFoundation

class MusicAndImageSliderController: UIViewController {
    
    var player:AVAudioPlayer?
    var playerItem:AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingBackgroundMusic()
        
        settingImageSlider()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func settingBackgroundMusic() {
        do {
            // Offline Code:
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!)as URL);
            player!.prepareToPlay()
            player!.play()
        }
        catch {
            // Error
            print("Error getting the audio file")
        }
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch{
            
        }
    }
    
    private func settingImageSlider() {
        ImageSlider.images = [#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "3")]
        ImageSlider.titles = ["1.picture","2.picture","3.picture"]
        
        ImageSlider.skip = {
            // code
            print("close")
            exit(0)
        }
        
        ImageSlider.add(to: self.view)
        
        ImageSlider.mode = .white
        ImageSlider.duration = 0.5
        ImageSlider.animation = .none
        
    }
    
}//


