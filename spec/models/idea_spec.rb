require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should belong_to(:Category) }
  it { should validate_presence_of(:body) }
end
