//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Abylbek Khassenov on 14.03.2021.
//

import Foundation

struct PlayingCard : CustomStringConvertible
{
    var description: String { return "\(rank)\(suit)"}
    
    var suit: Suit
    var rank: Rank
    
    enum Suit : String  , CustomStringConvertible{
        
        var description: String {return rawValue}
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all: [Suit] = [.clubs , .diamonds , .hearts , .spades]
    }
    
    enum Rank : CustomStringConvertible{
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order : Int{
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all : [Rank] {
            var allRanks = [Rank.ace]
            for pips in 1...10{
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J") , .face("Q") , .face("K")]
            return allRanks
        }
        
        var description: String {
            switch self {
            case .ace: return "A"
            case .face(let kind): return kind
            case .numeric(let pips): return String(pips)
            }
        }
    }
}
