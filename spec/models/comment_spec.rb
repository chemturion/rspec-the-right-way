require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should validate_uniqueness_of :link  }

end
