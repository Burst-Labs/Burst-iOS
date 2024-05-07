Pod::Spec.new do |s|
    s.name              = 'BurstSDK'
    s.version           = '2.1.1'
    s.summary           = 'iOS implementation of the Burst SDK'
    s.description       = 'Boost installs with streamlined app installation'
    s.homepage          = 'https://github.com/Burst-Labs/Burst-iOS'
    s.documentation_url = 'https://github.com/Burst-Labs/Burst-iOS'
    s.license           = { :type => 'MIT', :file => 'LICENSE' }
    s.author            = 'Burst'
    s.source            = { :git => 'https://github.com/Burst-Labs/Burst-iOS.git', :tag => s.version.to_s }

    s.platform = :ios
    s.ios.deployment_target = '14.0'
    s.swift_versions = ['5.5']

    s.vendored_frameworks = 'xcframeworks/*.xcframework'
end
