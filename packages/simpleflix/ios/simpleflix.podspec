Pod::Spec.new do |s|
  s.name             = 'simpleflix'
  s.version          = '0.0.1'
  s.summary          = 'A high-performance custom video player UI control plugin.'
  s.description      = <<-DESC
A high-performance custom video player UI control plugin with native window control integration.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  
  # Chỉ định tệp nguồn Swift cần biên dịch
  s.source_files = 'Classes/**/*'
  
  # Đăng ký sự phụ thuộc vào Flutter iOS SDK
  s.dependency 'Flutter'
  
  # Cấu hình Target: Ép buộc chạy từ iOS 12.0 trở lên để tối ưu hiệu năng đồ họa AVPlayer
  s.platform = :ios, '12.0'

  # Flutter và Xcode 12+ yêu cầu loại bỏ kiến trúc arm64 cho các thiết bị Simulator
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' 
  }
  
  s.swift_version = '5.0'
end