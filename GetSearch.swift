import Foundation 

var textStart   = 0
var textEnd     = 0

let text            = "Este es un texto muy largo para realizar pruebas en busqueda"
let textSearch      = "texto"
let sizeCharacters  = 10


let range        : Range<String.Index> = text.lowercased().range(of: textSearch.lowercased())!
let characterIni : Int = text.distance(from: text.startIndex, to: range.lowerBound)
let characterFin : Int = characterIni + textSearch.count - 1


if characterFin + (sizeCharacters - textSearch.count) > text.count {
    textEnd   = sizeCharacters > text.count ? text.count : sizeCharacters
    textStart = characterIni - 20 < 0 ? 0 : characterIni - (characterIni - textEnd + sizeCharacters)
}
else {
    textStart = characterIni
    textEnd = characterFin + (sizeCharacters - textSearch.count)
}

print("""
Cadena Inicial: \(textStart)
-----------------------------
Cadena Inicial: \(characterIni)
Cadena Inicial: \(characterFin)
-----------------------------
Cadena Inicial: \(textEnd)
""")

