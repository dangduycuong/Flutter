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
