require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe '新規投稿' do
    context '新規投稿できるとき' do
      it 'すべての項目の条件を満たしていれば登録できる' do
        expect(@record).to be_valid
      end
      it 'imageは空でも登録できる' do
        @record.image = nil
        expect(@record).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'prefeture_idが空では登録できない' do
        @record.prefecture_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'prefeture_idが1~47の範囲でなければ登録できない' do
        @record.prefecture_id = '0'
        @record.valid?
        expect(@record.errors.full_messages).to include("都道府県を選択してください")
      end
      it '同じ都道府県は2度登録できない' do
        @record.save
        another_record = FactoryBot.build(:record)
        another_record.user_id = @record.user_id
        another_record.prefecture_id = @record.prefecture_id
        another_record.valid?
        expect(another_record.errors.full_messages).to include("ユーザーが選択した都道府県の記録は既に存在しています")
      end
      it 'contentが空では登録できない' do
        @record.content = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("内容を入力してください")
      end
    end
  end
end
