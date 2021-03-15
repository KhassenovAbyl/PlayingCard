//
//  ViewController.swift
//  PlayingCard
//
//  Created by Abylbek Khassenov on 14.03.2021.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left , .right]
            playingCardView.addGestureRecognizer(swipe)
        }
    }
        
    @IBAction func fliipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = false
        default:
            break
        }
    }
    @objc func nextCard(){
        if let card = deck.drow(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

