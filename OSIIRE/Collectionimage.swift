//データベースの構築

import UIKit
import RealmSwift

//クラスの構成
class CollectionImage: Object {
    //path
    @objc dynamic var path: String = String()
    //category
   @objc dynamic var category: String = String()
    
}
