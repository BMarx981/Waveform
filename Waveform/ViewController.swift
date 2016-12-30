//
//  ViewController.swift
//  Waveform
//
//  Created by Marx, Brian on 12/29/16.
//  Copyright © 2016 Marx, Brian. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    //MARK: Properties
    var osc: AKOscillator?
    let wave = AKTable(.sawtooth, count: 4096)
    var filter: AKLowPassFilter?
    var mixer: AKMixer?
    var oscFreq = 2000.0
    var filterFreq = 2000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        osc = AKOscillator(waveform: wave, frequency: oscFreq)
        osc?.start()
        filter = AKLowPassFilter(osc!, cutoffFrequency: filterFreq)
        filter?.start()
        mixer = AKMixer(filter!)
        mixer?.start()
        
        AudioKit.output = mixer
        AudioKit.start()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Waveform Image
    @IBOutlet weak var WaveformImage: UIView!
    
    //MARK: Sliders
    @IBAction func OscFreqSlider(_ sender: UISlider) {
        osc?.frequency = pow(10, Double(sender.value))
    }
    
    @IBAction func FilterFreqSlider(_ sender: UISlider) {
        filter?.cutoffFrequency = pow(10, Double(sender.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

