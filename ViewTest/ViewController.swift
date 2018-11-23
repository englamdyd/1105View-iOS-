

import UIKit

extension ViewController : UIScrollViewDelegate{
    //줌이 실행 될 뷰를 지정하는 메소드
    //리턴하는 뷰에서 줌이 구현된다.
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
    return imageView	
    }
}

class ViewController: UIViewController {
    //ImageView 변수 생성 - nil을 저장할 수 있도록 생성
    //!을 추가 해서 생성했으므로 사용할 때는 !를 붙일 필요가 없다.
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //이미지 뷰에 출력할 Image 생성
        let image = UIImage(named:"go2.jpg")
        //이미지를 이용해서 ImageView 생성
        imageView = UIImageView(image : image!)
        
        //이미지 뷰 크기를 가져오기
        let imageSize = imageView.frame.size
        //스트롤 뷰를 전체 크기로 생성
        let scrollView = UIScrollView(frame:UIScreen.main.bounds)
        //이미지 뷰가 스트롤이 가능하도록 설정
        imageView.isUserInteractionEnabled = true
        //스크롤 뷰가 스크롤이 가능하도록 설정
        scrollView.isScrollEnabled = true
        //스크롤 뷰의 화면 크기 설정
        scrollView.contentSize = imageSize
        //스트롤 뷰 위에 이미지 뷰 추가
        scrollView.addSubview(imageView)
        //스트롤 뷰를 영역 밖으로 스크롤 할 수 없도록 하는 속성 설정
        scrollView.bounces = false
        //현재 뷰 컨트롤러의 뷰에 추가
        self.view.addSubview(scrollView)
        
        scrollView.maximumZoomScale = 2.0
        scrollView.minimumZoomScale = 0.5
        //scrollView 의 delegate 설정
        scrollView.delegate = self
    
    }



}

