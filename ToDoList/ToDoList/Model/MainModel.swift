import UIKit

//데이터 가져오는 모델 정의
final class MainModel {
    
    //스파르타 로고 이미지 불러오기
    public func getLogoImage(completion: @escaping (UIImage?) -> Void) {
        fetchImage(with: "https://spartacodingclub.kr/css/images/scc-og.jpg") { image in
            completion(image)
        }
    }
    //고양이 이미지 불러오기
    public func getCatImage(completion: @escaping (UIImage?) -> Void) { 
        getAnimalImage { image in
            completion(image)
        }
    }
}

extension MainModel {
    private func getAnimalImage(completion: @escaping (UIImage?) -> Void) {
        requset(with: "https://api.thecatapi.com/v1/images/search", type: [Cat].self) { data in
            guard let data = data else {
                completion(nil)
                return
            }
            self.fetchImage(with: data.first!.url) { image in
                completion(image)
            }
        }
    }
    
    private func fetchImage(with urlString: String, completion: @escaping (UIImage?) -> Void) {
        //url일때 가드문
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            guard let data = data else{
                completion(nil)
                return
            }
            //최종적으로 URLSeesion으로 불러온 데이터의 이미지 호출하게 됌
            completion(UIImage(data: data))
        }
        session.resume()
    }
    
    private func requset<T: Decodable>(with urlString: String, type: T.Type, completion: @escaping (T?) -> Void) {
        // https://api.thecatapi.com/v1/images/search
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        print("request URL: \(url)")
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            guard let successData = data else {
                completion(nil)
                return
            }
            do {
                let object = try JSONDecoder().decode(T.self, from: successData)
                
                completion(object)
            } catch let e {
                print(e.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
}
