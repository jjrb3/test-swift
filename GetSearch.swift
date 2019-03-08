import Foundation 

var textStart   = 0
var textEnd     = 0

let text            = "Este es un texto muy largo para realizar pruebas en busqueda"
let textSearch      = "este"
let sizeCharacters  = 30


let range        : Range<String.Index> = text.lowercased().range(of: textSearch.lowercased())!
let characterIni : Int = text.distance(from: text.startIndex, to: range.lowerBound)
let characterFin : Int = characterIni + textSearch.count - 1


// Cuando el tamaño de caracteres es mas grande que el tamño del texto
if characterFin + (sizeCharacters - textSearch.count) > text.count {

    // Si es tamaño de los caracteres es mayor que el texto
    if sizeCharacters > text.count {
        textStart = 0
        textEnd   = text.count
    }
    else {
        
        if characterIni + sizeCharacters > text.count {
            textStart = text.count - sizeCharacters
            textEnd = text.count
        }
        else {
            print("Else")
        }
    }
}
else {
    textStart = characterIni
    textEnd = characterFin + (sizeCharacters - textSearch.count)
}
/*
print("""
Cadena Inicial: \(textStart)
-----------------------------
Cadena Inicial: \(characterIni)
Cadena Inicial: \(characterFin)
-----------------------------
Cadena Inicial: \(textEnd)
""")*/

var charIni = characterIni
var charFin = characterFin
var textSubst = text

if textStart >= 0 {

    let start = text.index(text.startIndex, offsetBy: textStart)
    let end   = text.index(text.endIndex, offsetBy: textEnd - text.count)
    let range = start..<end
    
    textSubst = String(text[range])

    charIni   = characterIni - textStart
    charFin   = characterFin - textStart
    textEnd   = textEnd - textStart
    textStart = 0
}
else if text.count > sizeCharacters {
    let start = text.index(text.startIndex, offsetBy: text.count - sizeCharacters)
    let end   = text.index(text.endIndex, offsetBy: 0)
    
    let range = start..<end
    
    textSubst = String(text[range])
}

textStart = textStart < 0 ? 0 : textStart 

print(textSubst)

print("""
/////////////////////////////
Cadena Inicial: \(textStart)
-----------------------------
Cadena Inicial: \(charIni)
Cadena Inicial: \(charFin)
-----------------------------
Cadena Inicial: \(textEnd)
""")