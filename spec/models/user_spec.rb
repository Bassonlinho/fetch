require 'spec_helper'

RSpec.describe User, type: :model do 
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:encrypted_password).of_type(:string) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:sign_in_count).of_type(:integer) }
  it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:current_sign_in_ip).of_type(:string) }
  it { should have_db_column(:last_sign_in_ip).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }


  before :each do
    @user = FactoryGirl.create(:user)
  end

  describe 'when email is not present' do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before {@user.password = " "}
    it { should_not be_valid }
  end

  describe 'when password is too short' do
    before {@user.password = "john"}
    it { should validate_length_of(:password).is_at_least(6) }
    it { should_not be_valid }
  end


end