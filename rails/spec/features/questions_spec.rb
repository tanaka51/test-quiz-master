require 'rails_helper'

feature 'Question' do
  background do
    visit '/'
  end

  scenario 'create question with correct params' do
    create_question(q: 'editor', a: 'answer')

    expect(page).to have_content 'Question created successfully.'
    expect(page).to have_link 'editor', href: %r{/questions/\d}
    expect(page).to have_link 'edit', href: %r{/questions/\d/edit}
    expect(page.current_path).to eq '/'
  end

  scenario 'create question with wrong params' do
    create_question(q: nil, a: nil)

    expect(page).to have_content "Question can't be blank"
    expect(page).to have_content "Answer can't be blank"
    expect(page.current_path).to eq '/questions'
  end

  scenario 'answer the question with a right submission' do
    create_question(q: 'editor', a: 'vim')

    click_link 'editor'
    fill_in 'answer_answer', with: 'vim'
    click_button 'Submit answer'

    expect(page).to have_content 'right!'
  end

  scenario 'answer the question with a wrong submission' do
    create_question(q: 'editor', a: 'vim')

    click_link 'editor'
    fill_in 'answer_answer', with: 'emacs'
    click_button 'Submit answer'

    expect(page).to have_content 'wrong...'
  end
end

def create_question(q:, a:)
  click_link 'Add a new question'

  fill_in 'Question', with: q
  fill_in 'Answer', with: a

  click_button 'Create Question'
end
