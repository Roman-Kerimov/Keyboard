//
//  Array<CharacterComponent>.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-10-18.
//

import Foundation

extension Array where Element == CharacterComponent {
    
    private static let characterDictionary: [String: String] = Dictionary(
        uniqueKeysWithValues: characterComponentsDictionary
            .filter {!$0.value.isEmpty && $0.value != [.combined]}
            .map {($0.value.key, $0.key)}
    )
    
    var key: String {
        normalized
            .flatMap {CharacterComponent.replaces[$0] ?? [$0]}
            .map(\.description)
            .joined(separator: .comma + .space)
    }
    
    var character: String {
        type(of: self).characterDictionary[key] ?? ""
    }
    
    var normalized: [CharacterComponent] {
        nonCommutatives + commutatives
    }
    
    var nonCommutatives: [CharacterComponent] {
        filter {!$0.isCommutative}
    }
    
    var commutatives: [CharacterComponent] {
        self
            .filter {$0.isCommutative}
            .sorted(by: <)
    }
    
    static var extraArrayExtension: [[CharacterComponent]] = []
    var extraArray: [[CharacterComponent]] {
        let baseCharacterComponents = filter { $0.isExtraComponent == false }
        
        var extraArray = Array<CharacterComponent>.extraArrayExtension
        + CharacterComponent.extraComponents.map { baseCharacterComponents + [$0]}
        
        extraArray += [baseCharacterComponents + [.extra1, .turned]]
        
        //For LATIN SMALL LETTER SIDEWAYS TURNED M
        extraArray += [baseCharacterComponents + [.turned, .sideways]]
        
        return extraArray.filter { $0.character.isEmpty == false} .map { $0.normalized }
    }
    
    func removing(characterComponents: Set<CharacterComponent>) -> [CharacterComponent] {
        filter {!characterComponents.contains($0)}
    }
    
    var defaultShiftGesture: String? {
        
        guard !isEmpty else {
            return nil
        }
        
        if contains(where: {[.above, .combining, .below].contains($0)})
            || CharacterComponent.baseComponents[self.first!] != nil
            && contains(where: {[.superscript, .subscript].contains($0)}) {
            
            var components = self
            components.insert(components.removeLast(), at: 1)
            
            let shiftGestureComponents = components.enumerated().compactMap { (offset, component) -> String? in
                
                switch component {
                case .above:
                    return "↖︎"
                    
                case .combining:
                    return "←"
                    
                case .below:
                    return "↙︎"
                    
                case .superscript:
                    return "↖︎↗︎"
                    
                case .subscript:
                    return "↙︎↘︎"
                    
                default:
                    guard let baseComponent = CharacterComponent.baseComponents[component] else {
                        return nil
                    }
                    
                    if offset <= 1 {
                        return [baseComponent].character
                    } else {
                        return [baseComponent].character + "←"
                    }
                }
            }
            
            guard shiftGestureComponents.count == self.count else {
                return nil
            }
            
            return shiftGestureComponents.joined()
        }
        
        var componentSegments: [[CharacterComponent]] = []
        
        for component in self {
            
            if !component.isCommutative || componentSegments.isEmpty {
                componentSegments.append([component])
            } else {
                componentSegments[componentSegments.index(before: componentSegments.endIndex)].append(component)
            }
        }
        
        let components = componentSegments.enumerated().flatMap {[$0.element.first!] + $0.element.dropFirst().sorted()}
        
        var shiftGesture = ""
        
        for (index, component) in components.enumerated() {
            
            let shiftGestureComponent: String
            
            switch component {
            case .capital, .doubled:
                shiftGestureComponent = "↑"
                
            case .smallCapital:
                shiftGestureComponent = "↑↓"
                
            case .superscript, .extraUpRight:
                shiftGestureComponent = "↗︎"
                
            case .extraRight:
                shiftGestureComponent = "→"
                
            case .subscript, .extraDownRight:
                shiftGestureComponent = "↘︎"
                
            case .extraDown:
                shiftGestureComponent = "↓"
                
            case .extraDownLeft:
                shiftGestureComponent = "↙︎"
                
            case .extraLeft:
                shiftGestureComponent = "←"
                
            case .extraUpLeft:
                shiftGestureComponent = "↖︎"
                
            default:
                if component.isExtraComponent {
                    guard let extraComponentIndex = components
                        .prefix(while: {$0 != component})
                        .extraArray.firstIndex(where: {$0.contains(component)}) else {
                        return nil
                    }
                    
                    shiftGestureComponent = String("→↓←".prefix(extraComponentIndex+1))
                } else if let baseComponent = CharacterComponent.baseComponents[component], !shiftGesture.isEmpty {
                    shiftGestureComponent = [baseComponent].character + "←"
                } else if KeyboardLayout.qwerty.components.contains(component) {
                    guard [component].character.isEmpty == false  else {
                        return nil
                    }
                    
                    if shiftGesture.isEmpty {
                        shiftGestureComponent = [component].character
                    } else if let mixingComponent = CharacterComponent.letterToMixingComponentDictionary[component] {
                        
                        if (components.prefix(upTo: index) + [mixingComponent]).character.isEmpty {
                            shiftGestureComponent = [component].character + "←"
                        } else {
                            shiftGestureComponent = [component].character + "←→"
                        }
                    } else {
                        shiftGestureComponent = [component].character + "←"
                    }
                } else if let baseComponent = KeyboardLayout.reversedShiftRightDictionary[component] {
                    shiftGestureComponent = [baseComponent].character + "→" + (shiftGesture.isEmpty ? "" : "←")
                } else {
                    return nil
                }
            }
            
            if shiftGesture.hasSuffix("←") && component == .capital {
                shiftGesture.insert(contentsOf: shiftGestureComponent, at: shiftGesture.lastIndex(of: "←")!)
            } else {
                shiftGesture.append(shiftGestureComponent)
            }
        }
        
        return shiftGesture
    }
}
