//
//  JSONDecodingHelper.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

struct TopLevelPhoneBook: Decodable { //
    let result: PlaceDetail
}

struct PlaceDetail: Decodable { //
    let photos: [PhotoDictionary]
}

struct PhotoDictionary: Decodable { //
    let photo_reference: String
}

