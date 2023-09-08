//
//  TotalContestElement.swift
//  CashPicksPOC
//
//  Created by Presidio on 06/09/23.
//

import Foundation

// MARK: - TotalContestElement
struct TotalContestElement: Codable, Identifiable {
    
    let id = UUID()
    let contestID: EntryWithLink
    let entryFees, entryLimit, totalPrizes: Entry
    let totalEntries: EntryWithLink
    
    enum CodingKeys: String, CodingKey {
        case contestID = "contest_id"
        case entryFees = "entry_fees"
        case entryLimit = "entry_limit"
        case totalPrizes = "total_prizes"
        case totalEntries = "total_entries"
    }
}

// MARK: - Entry
struct Entry: Codable {
    let value: String
}

// MARK: - ContestID
struct EntryWithLink: Codable {
    let value, link: String
}

typealias TotalContest = [TotalContestElement]
