require 'rails_helper'

describe Question, :type => :model do
  describe '#is_correct?' do
    subject { question.is_correct?(submission) }

    let(:question) { build(:question, answer: answer) }

    describe 'requires the correct answer' do
      let(:answer) { 'Paris' }

      context 'answer: "Paris", submission: "London"' do
        let(:submission) { 'London' }

        it { is_expected.to eq false }
      end

      context 'answer: "Paris", submission: "Paris"' do
        let(:submission) { 'Paris' }

        it { is_expected.to eq true }
      end
    end

    describe 'ignores whitespace' do
      context 'answer:  "  the  moon", submission: "the moon"' do
        let(:answer)     { "  the  moon" }
        let(:submission) { "the moon" }

        it { is_expected.to eq true }
      end
    end

    describe 'ignores case' do
      context 'answer: "France", submision: "france"' do
        let(:answer)    { 'France' }
        let(:submission) { 'france' }

        it { is_expected.to eq true }
      end
    end

    describe 'understands numbers as words' do
      context 'answer: "7", submision: "seven"' do
        let(:answer)    { '7' }
        let(:submission) { 'seven' }

        it { is_expected.to eq true }
      end

      context 'answer: "seven", submision: "7"' do
        let(:answer)    { 'seven' }
        let(:submission) { '7' }

        it { is_expected.to eq true }
      end
    end
  end
end
