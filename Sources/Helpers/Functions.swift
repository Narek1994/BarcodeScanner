import UIKit
import AVFoundation

/**
 Returns image with a given name from the resource bundle.
 - Parameter name: Image name.
 - Returns: An image.
 */
func imageNamed(_ name: String) -> UIImage {
  let traitCollection = UITraitCollection(displayScale: 3)

    guard let image = UIImage(named: name, in: Bundle.module, compatibleWith: traitCollection) else {
    return UIImage()
  }

  return image
}

/**
 Returns localized string using localization resource bundle.
 - Parameter name: Image name.
 - Returns: An image.
 */
func localizedString(_ key: String) -> String {
    NSLocalizedString(key, bundle: BarcodeCustomLanguage.createBundle(), comment: key)
}

/// Checks if the app is running in Simulator.
var isSimulatorRunning: Bool = {
  #if swift(>=4.1)
    #if targetEnvironment(simulator)
      return true
    #else
      return false
    #endif
  #else
    #if (arch(i386) || arch(x86_64)) && os(iOS)
      return true
    #else
      return false
    #endif
  #endif
}()

public struct BarcodeCustomLanguage {

    static var language: String = ""
    
    public static func set(language: String) {
        BarcodeCustomLanguage.language = language
    }
    
    static func createBundle() -> Bundle {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"), let bundle = Bundle(path: path) else  {
            return Bundle.module
        }
        return bundle
    }
}
