# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
inhibit_all_warnings!
target 'BaseMVVM-RAC-Router' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
   use_frameworks!

  # Pods for BaseMVVM-RAC-Router

# 提示组件框架
  pod 'SVProgressHUD', '~> 2.2.2'
  
  # AOP面向切面
  pod 'Aspects', '~> 1.4.1'

  # 响应函数式框架
  pod 'ReactiveObjC', '~> 3.0.0' 
  
# 路由组件化解耦
  pod 'JLRoutes', '~> 2.0.5'

# 提示组件框架
  pod 'SVProgressHUD', '~> 2.2.2'

# 自动布局
  pod 'Masonry', '~> 1.0.2'

# 网络请求框架
  pod 'YTKNetwork', '~> 2.0.3'

  
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
        end
    end      
end


end
