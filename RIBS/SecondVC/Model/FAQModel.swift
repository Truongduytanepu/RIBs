//
//  FAQModel.swift
//  SolarVN
//
//  Created by Trương Duy Tân on 4/3/25.
//

import Foundation

struct FAQCategory: Codable {
    var category: String?
    var contents: [FAQItem]?
}

struct FAQItem: Codable {
    var title: String?
    var description: String?
    var isShowDescription: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case title, description
    }
}
