require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'ユーザー情報９項目が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'encrypted_passwordが空では登録できない' do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Encrypted password can't be blank"
      end
      it 'family_name_seiが空では登録できない' do
        @user.family_name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name sei can't be blank"
      end
      it 'family_name_meiが空では登録できない' do
        @user.family_name_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name mei can't be blank"
      end
      it 'family_name_kana_seiが空では登録できない' do
        @user.family_name_kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana sei can't be blank"
      end
      it 'family_name_kana_meiが空では登録できない' do
        @user.family_name_kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana mei can't be blank"
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it '@を含んでないemailは登録できない' do
        @user.email = 'kb.ezweb.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '５文字以下のパスワードは登録できない' do
        @user.password = '12aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordは129文字以上では、登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
      end
      it 'パスワードと確認用パスワードは一致していないと登録できない' do
        @user.password = '123aaa'
        @user.password_confirmation = '123bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'パスワードは全角英語が含まれていたら、登録できない' do
        @user.password = 'ｋ11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'パスワードは全角数字が含まれていたら、登録できない' do
        @user.password = '８aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'パスワードは半角英語だけでは登録できない' do
        @user.password = 'aaazzz'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'パスワードは半角数字だけでは登録できない' do
        @user.password = '111222'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it '名前（漢字・ひらがな・カタカナ）は半角文字が含まれていたら、登録できない' do
        @user.family_name_sei = 'ｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name sei 全角（漢字・ひらがな・カタカナ）を使用してください'
      end
      it '名前（漢字・ひらがな・カタカナ）は半角文字が含まれていたら、登録できない' do
        @user.family_name_mei = 'ｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name mei 全角（漢字・ひらがな・カタカナ）を使用してください'
      end
      it '名前（カタカナ）は漢字・ひらがなが含まれていたら、登録できない' do
        @user.family_name_kana_sei = 'や木'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana sei 全角(カタカナ)文字を使用してください'
      end
      it '名前（カタカナ）は漢字・ひらがなが含まれていたら、登録できない' do
        @user.family_name_kana_mei = 'り狗'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana mei 全角(カタカナ)文字を使用してください'
      end
      it '名前（カタカナ）は半角カタカナが含まれていたら、登録できない' do
        @user.family_name_kana_sei = 'ｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana sei 全角(カタカナ)文字を使用してください'
      end
      it '名前（カタカナ）は半角カタカナが含まれていたら、登録できない' do
        @user.family_name_kana_mei = 'ｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name kana mei 全角(カタカナ)文字を使用してください'
      end
    end
  end
end
