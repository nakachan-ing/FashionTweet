require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    @photo = FactoryBot.build(:photo)
  end

  describe 'スナップ新規投稿' do
    context 'スナップ投稿できるとき' do
      it '項目全てが入力されている時' do
        expect(@photo).to be_valid
      end
      it 'titleがひらがな(全角)入力されている時' do
        @photo.title = 'たいとる'
        expect(@photo).to be_valid
      end
      it 'titleがカタカナ(全角)入力されている時' do
        @photo.title = 'タイトル'
        expect(@photo).to be_valid
      end
      it 'titleがカタカナ(半角)入力されている時' do
        @photo.title = 'ﾀｲﾄﾙ'
        expect(@photo).to be_valid
      end
      it 'titleが漢字(全角)入力されている時' do
        @photo.title = '題名'
        expect(@photo).to be_valid
      end
      it 'titleが英字(全半角)入力されている時' do
        @photo.title = 'Title'
        expect(@photo).to be_valid
      end
      it 'titleが数字(全半角)入力されている時' do
        @photo.title = '11111'
        expect(@photo).to be_valid
      end
      it 'descriptionがひらがな(全角)入力されている時' do
        @photo.description = 'しょうさいこめんと'
        expect(@photo).to be_valid
      end
      it 'descriptionがカタカナ(全角)入力されている時' do
        @photo.description = 'ショウサイコメント'
        expect(@photo).to be_valid
      end
      it 'descriptionがカタカナ(半角)入力されている時' do
        @photo.description = 'ｼｮｳｻｲｺﾒﾝﾄ'
        expect(@photo).to be_valid
      end
      it 'descriptionが漢字(全角)入力されている時' do
        @photo.description = '詳細説明'
        expect(@photo).to be_valid
      end
      it 'descriptionが英字(全半角)入力されている時' do
        @photo.description = 'Description'
        expect(@photo).to be_valid
      end
      it 'descriptionが数字(全半角)入力されている時' do
        @photo.description = '11111'
        expect(@photo).to be_valid
      end
      it 'titleの文字数が40文字以下の時' do
        @photo.title = Faker::Lorem.characters(number: 40)
        expect(@photo).to be_valid
      end
      it 'descriptionの文字数が500文字以下の時' do
        @photo.description = Faker::Lorem.characters(number: 500)
        expect(@photo).to be_valid
      end
    end
    context 'スナップ投稿できないとき' do
      it 'snapが空の時' do
        @photo.snap = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Snap can't be blank")
      end
      it 'titleが空の時' do
        @photo.title = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionがからの時' do
        @photo.description = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Description can't be blank")
      end
      it 'price_idが「---」の時' do
        @photo.price_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Price Select')
      end
      it 'titleが40文字より多い時' do
        @photo.title = Faker::Lorem.characters(number: 41)
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Title is too long (maximum is 40 characters)')
      end
      it 'descriptionが500文字より多い時' do
        @photo.description = Faker::Lorem.characters(number: 501)
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Description is too long (maximum is 500 characters)')
      end
    end
  end
end
