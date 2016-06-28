def stub_network
  xml = File.read( File.join("spec", "fixtures", "feed.xml"))
  #allow(Wordpress::Comments::Client.any_instance).to receive(:get) { xml }
  Wordpress::Comments::Client.any_instance.stub(:get).and_return(xml)
end
