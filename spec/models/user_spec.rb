require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '項目全てが存在すれば(imageとintroduction以外)登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameがひらがな(全角)であれば登録できる' do
        @user.last_name = 'なかだ'
        @user.first_name = 'きょうた'
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameがカタカナ(全角)であれば登録できる' do
        @user.last_name = 'ナカダ'
        @user.first_name = 'キョウタ'
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが漢字(全角)であれば登録できる' do
        @user.last_name = '中田'
        @user.first_name = '恭大'
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが英字(半角)であれば登録できる' do
        @user.last_name = 'Nakada'
        @user.first_name = 'Kyota'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつ、半角英数字混合であれば登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが全角では登録できない' do
        @user.password = 'あア阿あア阿'
        @user.password_confirmation = 'あア阿あア阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合登録できない' do
        @user.email = 'kyonakayahoo.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが存在してもfirst_nameが空では登録できない' do
        @user.last_name = '中田'
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが存在してもlast_nameが空では登録できない' do
        @user.last_name = ''
        @user.first_name = '恭大'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameがカタカナ(半角)では登録できない' do
        @user.last_name = 'ﾅｶﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameがカタカナ(半角)では登録できない' do
        @user.first_name = 'ｷｮｳﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが英字(全角)では登録できない' do
        @user.last_name = 'ｎａｋａｄａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが英字(全角)では登録できない' do
        @user.first_name = 'ｋｙｏｔａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
    end
  end

end
