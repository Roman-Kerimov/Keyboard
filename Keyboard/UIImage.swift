//
//  UIImage.swift
//  Keyboard
//
//  Created by Roman Kerimov on 25.04.17.
//
//

import UIKit

public enum PDFExtension: String {
    case pdf = "pdf"
    case ai = "ai"
}

extension UIImage {
    public convenience init?(fromPDF pdfName: String, withExtension pdfExtension: PDFExtension, withScale scale: CGFloat, for object: AnyObject) {
        let bundle: Bundle = .init(for: type(of: object))
        
        guard let pdfURL = bundle.url(forResource: pdfName, withExtension: pdfExtension.rawValue) else {
            return nil
        }
        
        let pdfData = try! NSData.init(contentsOf: pdfURL) as CFData
        let pdfDocument = CGPDFDocument.init(CGDataProvider.init(data: pdfData)!)!
        let pdfPage = pdfDocument.page(at: 1)!
        
        var pageRect = pdfPage.getBoxRect(.mediaBox)
        pageRect.size = CGSize.init(width: pageRect.width * UIScreen.main.scale * scale, height: pageRect.height * UIScreen.main.scale * scale)
        
        UIGraphicsBeginImageContext(pageRect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.interpolationQuality = .high
        context.translateBy(x: 0, y: pageRect.height)
        context.scaleBy(x: UIScreen.main.scale * scale, y: -UIScreen.main.scale * scale)
        context.saveGState()
        context.drawPDFPage(pdfPage)
        context.restoreGState()
        let pdfImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.init(cgImage: pdfImage.cgImage!, scale: pdfImage.scale * UIScreen.main.scale, orientation: pdfImage.imageOrientation)
    }
}
