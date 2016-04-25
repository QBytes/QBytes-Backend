require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validation" do 
    it { is_expected.to belong_to(:user) }
  end

  describe "associations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :user}
  end
end