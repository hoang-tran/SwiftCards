platform :ios, '8.0'
use_frameworks!

def test_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'RealmSwift'
end

target 'SwiftCards' do
  pod 'RealmSwift'
end

target 'SwiftCardsTests' do
  test_pods
end

target 'SwiftCardsUITests' do
  test_pods
  pod 'KIF', '~> 3.0', :configurations => ['Debug']
end
