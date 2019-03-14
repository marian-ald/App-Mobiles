

import Foundation


class ItPersonSet: IteratorProtocol {
	var setPers: PersonSet = PersonSet.init()
	var index: Int = 0



   	func next() -> Person? {
      	// if (index < self.word.endIndex) {
       //   	let character = self.word[index]
       //   	index = self.word.index(after: index)
       //   	return character
      	// } else { return nil }
   		return nil
   }
}