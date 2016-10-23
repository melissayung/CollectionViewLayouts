//
//  NotesDatasource.swift
//  CollectionViewLayouts
//
//  Created by Melissa Yung on 22/10/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

final class NotesDatasource: NSObject {
    
    let notes = [("MONDAY", "Grocery shoppping, Laundry, Write tech blog"),
                 ("TUESDAY", "Bake cake, Birthday party"),
                 ("WEDNESDAY", "Research air fares, Visit Matisse"),
                 ("THURSDAY", "Lunch catch up with Peter, Yoga with Daphne, Attend meetup, Book tickets, Learn German"),
                 ("FRIDAY", "Tango")]
    
    var numberOfItems: Int {
        return notes.count
    }
    
    func title(atIndex index:Int) -> String {
        return notes[index].0
    }
    
    func text(atIndex index:Int) -> String {
        return notes[index].1
    }
}

