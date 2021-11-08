require 'rails_helper'

describe 'Gits', js: true do
  context 'when Github login dhh' do
    it 'shows a David Heinemeier Hansson' do
      visit '/git'
      fill_in 'query', with: 'dhh'
      click_button 'Search'
      expect(page).to have_content 'David Heinemeier Hansson'
    end
  end

  context 'when dont Github login ' do
    it 'shows There is no such name' do
      visit '/git'
      fill_in 'query', with: 'biubiubu'
      click_button 'Search'
      expect(page).to have_content 'There is no such name'
    end
  end
end
