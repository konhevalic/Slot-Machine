//
//  ViewController.swift
//  slot-machine
//
//  Created by alan on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayOfImages: [String] = ["slot1.png", "slot2.png", "slot3.png", "slot4.png", "slot5.png", "slot6.png", "slot7.png", "slot8.png", "slot9.png"]

    var indexLeftSlot: Int = 0
    var indexCenterSlot: Int = 0
    var indexRightSlot: Int = 0
    var repeatSorting: Int = 4
    
    @IBOutlet weak var centerSlot: UIImageView!
    @IBOutlet weak var leftSlot: UIImageView!
    @IBOutlet weak var rightSlot: UIImageView!
    @IBOutlet weak var winnerMessage: UILabel!
    

    @IBAction func sortImages(_ sender: Any) {
        winnerMessage.isHidden = true
        let timer = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: true) { [self] timer in
            if repeatSorting >= 0 {
                indexLeftSlot = Int.random(in: 0...8)
                indexCenterSlot = Int.random(in: 0...8)
                indexRightSlot = Int.random(in: 0...8)
                
                leftSlot.image = UIImage(named: arrayOfImages[indexLeftSlot])
                centerSlot.image = UIImage(named: arrayOfImages[indexCenterSlot])
                rightSlot.image = UIImage(named: arrayOfImages[indexRightSlot])
                
                repeatSorting -= 1
                
                if (leftSlot.image == centerSlot.image && leftSlot.image == rightSlot.image && centerSlot.image == rightSlot.image) {
                    winnerMessage.isHidden = false
                }
            }
        }
        
        if repeatSorting >= 0 {
            timer.fire()
        } else {
            timer.invalidate()
        }
        
        repeatSorting = 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winnerMessage.isHidden = true
    }


}

