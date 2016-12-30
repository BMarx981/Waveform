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

    var osc: AKOscillator?
    let wave = AKTable(.sawtooth, count: 4096)
    var filter: AKLowPassFilter?
    var mixer: AKMixer?
    var oscFreq = 2000.0
    var filterFreq = 2000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        osc = AKOscillator(waveform: wave, frequency: oscFreq)
        filter = AKLowPassFilter(osc!, cutoffFrequency: filterFreq)
        mixer = AKMixer(filter!)
        mixer?.start()
        
        AudioKit.output = mixer
        AudioKit.start()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func OscFreqSlider(_ sender: UISlider) {
    }
    
    @IBAction func FilterFreqSlider(_ sender: UISlider) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

