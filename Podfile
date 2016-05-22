platform :ios, '8.0'
use_frameworks!


def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'SwiftCards' do
end

target 'SwiftCardsTests' do
  test_pods
end

target 'SwiftCardsUITests' do
  test_pods
  pod 'KIF', '~> 3.0', :configurations => ['Debug']
end
