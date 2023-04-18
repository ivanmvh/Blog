require 'rails_helper'

RSpec.describe 'hellos', type: :system do
  describe 'index page' do
    it '1-shows the right content' do
      visit hellos_path
      expect(page).to have_content('Hello')
    end
    it '2-shows the right content' do
      visit '/hellos'
      expect(page).to have_content('Hello')
    end
  end
end
