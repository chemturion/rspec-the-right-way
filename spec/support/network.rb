def stub_network
  xml = Factory.comments_feed_xml
  allow_any_instance_of(Wordpress::Comments::Client).to receive(:get) { xml }
end
