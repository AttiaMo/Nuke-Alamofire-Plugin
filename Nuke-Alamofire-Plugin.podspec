Pod::Spec.new do |s|
    s.name             = 'Nuke-Alamofire-Plugin'
    s.version          = '4.3.0'
    s.summary          = 'Alamofire plugin for Nuke - image loading and caching framework'

    s.homepage         = 'https://github.com/kean/Nuke-Alamofire-Plugin'
    s.license          = 'MIT'
    s.author           = 'Alexander Grebenyuk'
    s.source           = { :git => 'https://github.com/kean/Nuke-Alamofire-Plugin.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/a_grebenyuk'
    
    s.ios.deployment_target = '10.0'
    s.watchos.deployment_target = '3.0'
    s.osx.deployment_target = '10.12'
    s.tvos.deployment_target = '10.0'

    s.module_name = "NukeAlamofirePlugin"

    s.dependency 'Nuke', '~> 8.0'
    s.dependency 'Alamofire', '~> 4.0'

    s.source_files  = 'Source/**/*'
end
