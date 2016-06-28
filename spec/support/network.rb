def stub_network
  xml = File.read( File.join("spec", "fixtures", "feed.xml"))
  allow_any_instance_of(Wordpress::Comments::Client).to receive(:get) { xml }
end
