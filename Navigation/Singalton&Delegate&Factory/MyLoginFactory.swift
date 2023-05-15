
import Foundation


struct MyLoginFactory:LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
