//
//  Array<CharacterComponent>.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-10-18.
//

import Foundation

extension Array where Element == CharacterComponent {
    
    private static let characterDictionary: [String: String] = .init(
        uniqueKeysWithValues: characterComponentsDictionary.filter {!$0.value.isEmpty} .map {($0.value.key, $0.key)}
    )
    
    var key: String {
        return normalized.map {.fullStop + .init(describing: $0)} .joined(separator: .comma + .space)
    }
    
    var character: String {
        return type(of: self).characterDictionary[self.key] ?? .init()
    }
    
    var normalized: [CharacterComponent] {
        return nonCommutatives + commutatives
    }
    
    var nonCommutatives: [CharacterComponent] {
        return self.filter {!$0.isCommutative}
    }
    
    var commutatives: [CharacterComponent] {
        return self.filter {$0.isCommutative} .sorted {$0 < $1}
    }
    
    static var extraArrayExtension: [[CharacterComponent]] = .init()
    var extraArray: [[CharacterComponent]] {
        let baseCharacterComponents = self.filter { $0.isExtraComponent == false }
        
        var extraArray = Array<CharacterComponent>.extraArrayExtension + CharacterComponent.extraComponents.map { baseCharacterComponents + [$0]}
        
        extraArray += [baseCharacterComponents + [.extra1, .turned]]
        
        //For LATIN SMALL LETTER SIDEWAYS TURNED M
        extraArray += [baseCharacterComponents + [.turned, .sideways]]
        
        return extraArray.filter { $0.character.isEmpty == false} .map { $0.normalized }
    }
    
    func removing(characterComponents: Set<CharacterComponent>) -> [CharacterComponent] {
        return filter {!characterComponents.contains($0)}
    }
    
    var defaultShiftGesture: String? {
        
        if self.contains(where: {[.above, .combining, .below].contains($0)}) {
            let shiftGestureComponents = self.compactMap { (component) -> String? in
                
                switch component {
                case .above:
                    return "↖︎"
                    
                case .combining:
                    return "←"
                    
                case .below:
                    return "↙︎"
                    
                default:
                    
                    guard let baseComponent = CharacterComponent.baseComponents[component] else {
                        return nil
                    }
                    
                    return [baseComponent].character
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
            }
            else {
                componentSegments[componentSegments.index(before: componentSegments.endIndex)].append(component)
            }
        }

        let components = componentSegments.enumerated().flatMap {[$0.element.first!] + $0.element.dropFirst().sorted()}
        
        var shiftGesture = String.init()
        
        for (index, component) in components.enumerated() {
            
            let shiftGestureComponent: String
            
            switch component {
            case .capital:
                shiftGestureComponent = "↑"
                
            case .smallCapital:
                shiftGestureComponent = "↑↓"
                
            case .superscript, .extraUpRight:
                
                shiftGestureComponent = "↗︎"
                
            case .extraRight:
                shiftGestureComponent = "→"
                
            case .subscript, .extraDownRight:
                shiftGestureComponent = "↘︎"
                
            case .extraDownLeft:
                shiftGestureComponent = "↙︎"
                
                
            case .extraLeft:
                
                shiftGestureComponent = "←"
                
            case .extraUpLeft:
                shiftGestureComponent = "↖︎"
                
            default:
                if component.isExtraComponent {
                    guard let extraComponentIndex = extraArray.firstIndex(where: {$0.contains(component)}) else {
                        return nil
                    }
                    
                    shiftGestureComponent = .init("→↓←".prefix(extraComponentIndex+1))
                }
                else if KeyboardLayout.qwerty.components.contains(component) {
                    guard [component].character.isEmpty == false  else {
                        return nil
                    }
                    
                    if shiftGesture.isEmpty {
                        shiftGestureComponent = [component].character
                    }
                    else if let mixingComponent = CharacterComponent.letterToMixingComponentDictionary[component] {
                        
                        if (components.prefix(upTo: index) + [mixingComponent]).character.isEmpty {
                            shiftGestureComponent = [component].character + "←"
                        }
                        else {
                            shiftGestureComponent = [component].character + "←→"
                        }
                    }
                    else {
                        shiftGestureComponent = [component].character + "←"
                    }
                }
                else if let baseComponent = CharacterComponent.baseComponents[component]  {
                    shiftGestureComponent = [baseComponent].character + "←"
                }
                else {
                    return nil
                }
            }
            
            shiftGesture.append(shiftGestureComponent)
        }
        
        return shiftGesture
    }
}
