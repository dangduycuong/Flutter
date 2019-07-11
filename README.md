# Flutter
Toturial dart programming
chuyển màn trong cùng 1 storyboard
let vc = storyboard.instantiateViewController(withIdentifier: "VCMytoneDetail") as! DetailMyTonesVC


chuyển màn khác storyboard
let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController


//thao tác chuyển màn
present(vc, animated: true, completion: nil)



#dart
git clone -b beta https://github.com/flutter/flutter.git
ls -la
ls -la flutter
echo $PATH
pwd
Admins-iMac-3:FlutterApp cuong$ export PATH=`pwd`/flutter/bin:$PATH
Admins-iMac-3:FlutterApp cuong$ ls -la `pwd`/flutter/bin
Admins-iMac-3:FlutterApp cuong$ flutter doctor #kiểm tra việc cài đặt đã hoàn thành chưa
Admins-iMac-3:FlutterApp cuong$ flutter doctor --android-licenses #hiện các licenses agreement ra
Admins-iMac-3:FlutterApp cuong$ flutter doctor

#cài thêm hombrew, quản lý các pakages trong macOS
#cài rồi thì update
Admins-iMac-3:FlutterApp cuong$ brew update

#cài tool libimobiledevice = a library to communicate with iOS device, thư viện này cho phép communicate (liên hệ với các thiết bị iOS)
Admins-iMac-3:FlutterApp cuong$ brew install --HEAD libimobiledevice
#tạo một project
Admins-iMac-3:FlutterApp cuong$ flutter create myapp
#hiện ra danh sách các thiết bị
Admins-iMac-3:FlutterApp cuong$ flutter devices
Admins-iMac-3:FlutterApp cuong$ cd myapp/
Admins-iMac-3:myapp cuong$ flutter run

# nếu có nhiều devices, lấy id của device
flutter run -d

flie pubspec.yaml là file chứa các thư viện.
# cập nhật các thư viện đã khai báo
Admins-iMac-3:myapp cuong$ flutter packages get

khai báo bắt đầu với final nó giống như const, tức là hằng số không thay đổi được.
Hàm build chỉ chạy khi giao diện thay đổi, nên dùng final. Widget build (Widget được coi như thẻ)

StatelessWidget là một cái thẻ có các thuộc tính bên trong liên quan đến phần giao diện. Thuộc tính bên trong không thay đổi được.

Thực tế khi làm việc sẽ gặp các màn hình có các thuộc tính liên tục thay đổi, chúng ta sẽ làm thế nào. Chúng ta sẽ làm việc với StatefulWidget, thẻ có những thuộc tính có thể thay đổi được. Có giao diện thay đổi khi thuộc tính thay đổi.

trong func createState() phải return về một đối tượng có kiểu là state. State là nơi chứa các thuộc tính mà các thuộc tính đó thay đổi. Cái widget thay đổi theo, giao diện thay đổi tương ứng.


# tạo listView với độ dài tuỳ ý và thêm các sự kiện.
Thẻ Scaffold có phần AppBar tức là phần header. Trong AppBar có thuộc tính title, title có một cái text
Thuộc tính itemBuilder nó là một hàm, bên trong nó là một hàm. Dùng một cái hàm anounymous function có hai thuộc tính đầu vào là:
                                        context là con trỏ trỏ đến vị trí hiện tại là dòng lệnh dang sử dụng.
                                        index là chỉ số từng cái hàng một.
final không thể gán cho một đối tượng khác được, chứ còn ở bên trong nó thì thêm hoặc bớt thành phần trong mảng thì ok.

thuộc tính leading của listtitle thường hiểu như swift, trái phải đầu đuôi.

thuộc tính onTap() khi tay bạn chạm vào.

một Set là chứa tập hợp các phần tử không được trùng nhau.

dấu _ trước tên func có ý nghĩa là func chỉ nên sử dụng trong class mà thôi.

//To navigate, you must have a "route"
để chuyển màn, tạo một object có kiểu dữ liệu là MaterialPageRoute.

hàm map chuyển đổi từ một danh sách các đối tượng sang gồm có các string checkWords sang một cái
danh sách các objects kiểu listTiles (do mình tự khai báo)
sử dụng map khi muốn convert một mảng chứa các đối tượng kiểu A sang một mng3 chứa các đối tượng kiểu B
//map function = Convert thist list to another list (maybe different object's type)

lazy list chỉ được sử dụng khi mình gọi đến nó.
