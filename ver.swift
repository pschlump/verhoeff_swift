//
// Verhoeff Algorithm
//
// Copyright (C) Philip Schlump, 2014-2016
// MIT Licensed.
//
//

import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}

extension Character {
    var integerValue:Int {
        return Int(String(self)) ?? 0
    }
}

class VerhoeffAlgorithm {
    
    // From https://en.wikibooks.org/wiki/Algorithm_Implementation/Checksums/Verhoeff_Algorithm
    // based on the "C" implementation
    
    // The multiplication table
    let verhoeff_d : [[ Int ]] = [
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
        [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
        [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
        [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
        [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
        [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
        [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
        [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
        [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
        ];
    
    // The permutation table
    let verhoeff_p : [[Int]] = [
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
        [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
        [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
        [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
        [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
        [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
        [7, 0, 4, 6, 9, 1, 3, 2, 5, 8],
        ];
    
    //The inverse table
    let verhoeff_inv : [Int] = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];
    
    let digits : [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    
    //For a given number generates a Verhoeff digit
    func GenerateVerhoeff(num: String) -> Int {
        var c : Int = 0
        let ll : Int = num.characters.count
        for i in 0..<ll {
            c = verhoeff_d[c][verhoeff_p[((i + 1) % 8)][(num[ll-i-1]).integerValue]];
        }
        return verhoeff_inv[c];
    }
    
    func GenerateVerhoeffString(s : String) -> String {
        let r : Int = GenerateVerhoeff(s);
        let newS : String = s + digits[r%10];
        return newS;
    }
    
    //Validates that an entered number is Verhoeff compliant.  The check digit must be the last one.
    func ValidateVerhoeff(num : String) -> Bool {
        var c : Int = 0;
        let ll : Int = num.characters.count
        for i in 0..<ll {
            c = verhoeff_d[c][verhoeff_p[(i % 8)][(num[ll-i-1]).integerValue]]
        }
        return (c == 0);
    }
    
}

// var vv = VerhoeffAlgorithm()
// var ss = vv.GenerateVerhoeff("123")	 		// == 3
// var tt = vv.GenerateVerhoeff("124") 			// == 6

// var sss = vv.GenerateVerhoeffString("123")	// "1233"

// var v1 = vv.ValidateVerhoeff("1233")			// true
// var v2 = vv.ValidateVerhoeff("1133")			// false

