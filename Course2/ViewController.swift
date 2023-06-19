//
//  ViewController.swift
//  Course2
//
//  Created by Mobile Dev 1 on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var dataToSend: String?
    
    @IBOutlet weak var headphoneLabel: UILabel!
    @IBOutlet weak var guitarLabel: UILabel!
    @IBOutlet weak var mIDILabel: UILabel!
    @IBOutlet weak var compressorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            detailViewController.receivedData = dataToSend
        }
    }

    @IBAction func onHeadPhoneBtnTap(_ sender: Any) {
        dataToSend = headphoneLabel.text
    }
    
    @IBAction func onGuitarBtnTap(_ sender: Any) {
        dataToSend = guitarLabel.text
    }
    
    @IBAction func onMIDIBtnTap(_ sender: Any) {
        dataToSend = mIDILabel.text
    }
    
    @IBAction func onCompressorBtnTap(_ sender: Any) {
        dataToSend = compressorLabel.text
    }
}

