def stub_network
  xml = File.read( File.join("spec", "fixtures", "feed.xml"))
  Wordpress::Comments::Client.any_instance
  allow(Wordpress::Comments::Client.any_instance).to receive(:get) { xml }
end
