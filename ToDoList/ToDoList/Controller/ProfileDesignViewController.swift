import UIKit
import SwiftUI

struct PreView: PreviewProvider {
    static var previews: some View {
        ProfileDesignViewController().toPreview()
    }
}

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif

// info.plist StoryboardName Main
class ProfileDesignViewController : UIViewController {
    
    var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 97, height: 25)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name:"OpenSans-Bold", size: 18)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "nabaecamp", attributes: [NSAttributedString.Key.kern: -1])
        return label
    }()
    var userBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "line.horizontal.3")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    var userimg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "user")
        return imageView
    }()
    
    var postNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        label.textAlignment = .center
        label.text = "7"
        return label
    }()
    var postLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "post", attributes: [NSAttributedString.Key.kern: -0.3])
        return label
    }()
    var followerNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    var followerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 51, height: 19)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "follower", attributes: [NSAttributedString.Key.kern: -0.3])
        return label
    }()
    var followingNumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    var followingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 57, height: 19)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "following", attributes: [NSAttributedString.Key.kern: -0.3])
        return label
    }()
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 38, height: 19)
        label.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        label.font = UIFont(name:"OpenSans-Bold", size: 14)
        label.attributedText = NSMutableAttributedString(string: "르탄이", attributes: [NSAttributedString.Key.kern: -0.5])
        return label
    }()
    var userinfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 345, height: 19)
        label.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        label.font = UIFont(name:"OpenSans-Regular", size: 14)
        label.attributedText = NSMutableAttributedString(string: "iOS Developer 🍎", attributes: [NSAttributedString.Key.kern: -0.5])
        return label
    }()
    var websiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 0, y: 0, width: 121, height: 19)
        label.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        label.font = UIFont(name: "OpenSans-Regular", size: 14)
        label.attributedText = NSAttributedString(string: "spartacodingclub.kr", attributes: [NSAttributedString.Key.kern: -0.5])
        return label
    }()
    
    var followBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        button.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        button.layer.cornerRadius = 4
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        return button
    }()
    var messageBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.setTitle("Message", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        return button
    }()
    var moreBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
    }()
    
    //중간 갤러리 선택 뷰
    var gallerySelectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 100)
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    //피드 콜렉션 뷰
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        return collectionView
    }()
    
    //하단 네비게이션 툴바
    let bottomNavigationBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    //피드에 들어갈 이미지들
    var images: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(userLabel)
        view.addSubview(userBtn)
        view.addSubview(userimg)
        view.addSubview(postNumLabel)
        view.addSubview(postLabel)
        view.addSubview(followerNumLabel)
        view.addSubview(followerLabel)
        view.addSubview(followingNumLabel)
        view.addSubview(followingLabel)
        view.addSubview(usernameLabel)
        view.addSubview(userinfoLabel)
        view.addSubview(websiteLabel)
        view.addSubview(followBtn)
        view.addSubview(messageBtn)
        view.addSubview(moreBtn)
        view.addSubview(gallerySelectionView)
        view.addSubview(collectionView)
        view.addSubview(bottomNavigationBar)
        
        setupContraints()
        
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
            userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userBtn.topAnchor.constraint(equalTo: userLabel.topAnchor),
            userBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 338),
            userBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15),
        ])
        
        // userimg 제약 조건 설정
        NSLayoutConstraint.activate([
            userimg.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 14),
            userimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            userimg.widthAnchor.constraint(equalToConstant: 88),
            userimg.heightAnchor.constraint(equalToConstant: 88),
            
            // post, follower, following 제약 조건 설정
            postNumLabel.centerYAnchor.constraint(equalTo: userimg.centerYAnchor),
            postNumLabel.leadingAnchor.constraint(equalTo: userimg.trailingAnchor, constant: 50),
            
            postLabel.topAnchor.constraint(equalTo: postNumLabel.bottomAnchor,constant: 5),
            postLabel.centerXAnchor.constraint(equalTo: postNumLabel.centerXAnchor),
            
            followerNumLabel.centerYAnchor.constraint(equalTo: userimg.centerYAnchor),
            followerNumLabel.topAnchor.constraint(equalTo: postNumLabel.topAnchor),
            followerNumLabel.leadingAnchor.constraint(equalTo: postNumLabel.trailingAnchor, constant: 80),
            
            followerLabel.topAnchor.constraint(equalTo: followerNumLabel.bottomAnchor, constant: 5),
            followerLabel.centerXAnchor.constraint(equalTo: followerNumLabel.centerXAnchor),
            
            followingNumLabel.centerYAnchor.constraint(equalTo: userimg.centerYAnchor),
            followingNumLabel.topAnchor.constraint(equalTo: postNumLabel.topAnchor),
            followingNumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            followingLabel.topAnchor.constraint(equalTo: followingNumLabel.bottomAnchor, constant: 5),
            followingLabel.centerXAnchor.constraint(equalTo: followingNumLabel.centerXAnchor),
            followingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        // username, userinfo, website 제약 조건 설정
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: userimg.bottomAnchor, constant: 14),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            userinfoLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            userinfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            websiteLabel.topAnchor.constraint(equalTo: userinfoLabel.bottomAnchor, constant: 5),
            websiteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        // follow,message,more버튼 제약 조건 설정
        NSLayoutConstraint.activate([
            followBtn.topAnchor.constraint(equalTo: websiteLabel.bottomAnchor, constant: 11),
            followBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            followBtn.widthAnchor.constraint(equalToConstant: 150),
            followBtn.heightAnchor.constraint(equalToConstant: 30),
            
            messageBtn.topAnchor.constraint(equalTo: followBtn.topAnchor),
            messageBtn.leadingAnchor.constraint(equalTo: followBtn.trailingAnchor, constant: 8),
            messageBtn.widthAnchor.constraint(equalTo: followBtn.widthAnchor),
            messageBtn.heightAnchor.constraint(equalTo: followBtn.heightAnchor),
            
            moreBtn.topAnchor.constraint(equalTo: followBtn.topAnchor),
            moreBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            moreBtn.widthAnchor.constraint(equalToConstant: 30),
            moreBtn.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        // 갤러리 선택 뷰 제약 조건 설정
        NSLayoutConstraint.activate([
            gallerySelectionView.topAnchor.constraint(equalTo: followBtn.bottomAnchor, constant: 15),
            gallerySelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gallerySelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gallerySelectionView.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
        ])
        
        // 컬렉션 뷰 제약 조건 설정
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: followBtn.bottomAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomNavigationBar.topAnchor),
        ])
        
        // 하단 네비게이션 바 제약 조건 설정
        NSLayoutConstraint.activate([
            bottomNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomNavigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//피드에 들어가는 콜렉션 뷰 확장자
extension ProfileDesignViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
        let imageView = UIImageView(frame: cell.contentView.frame)
        imageView.image = images[indexPath.item]
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        cell.contentView.addSubview(imageView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 2, height: collectionView.frame.width / 3 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}
