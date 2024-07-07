require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目の条件を満たしていれば登録できる'do
        user = User.new(nickname: 'taro', email: 'test@example', password: '000000', password_confirmation: '000000')
        expect(user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
        user.valid?
        expect(user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'emailが空では登録できない' do
        user = User.new(nickname: 'taro', email: '', password: '000000', password_confirmation: '000000')
        user.valid?
        expect(user.errors.full_messages).to include("Eメールを入力してください")
      end  
      it '同じemailは登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: '000000', password_confirmation: '000000')
        user.save
        another_user = User.new(nickname: 'jiro', email: 'test@example', password: '000000', password_confirmation: '000000')
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        user = User.new(nickname: 'taro', email: 'aaaaaaaa', password: '000000', password_confirmation: '000000')
        user.valid?
        expect(user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'パスワードが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: '', password_confirmation: '000000')
        user.valid?
        expect(user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが6文字未満では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: '00000', password_confirmation: '00000')
        user.valid?
        expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '確認用パスワードが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: '000000', password_confirmation: '')
        user.valid?
        expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
