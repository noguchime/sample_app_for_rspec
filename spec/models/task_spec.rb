require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  # バリデーションについてテストするグループ
  describe 'validation' do
    # 全ての属性が有効
    it 'is valid with all attributes' do
      task = build(:task)
      # taskが有効か
      expect(task).to be_valid
      # task.errorsでmessagesやdetailsが空欄になっているか
      expect(task.errors).to be_empty
    end

    # タイトルがなければ無効である
    it 'is invalid without title' do
      task = build(:task, title: "")
      expect(task).to be_invalid
      expect(task.errors[:title]).to eq ["can't be blank"]
    end

    # statusがなければ無効である
    it 'is invalid without status' do
      task = build(:task, status: "")
      expect(task).to be_invalid
      expect(task.errors[:status]).to eq ["can't be blank"]
    end

    # titleが重複していたら無効である
    it 'is invalid with a duplicate title' do
      task = create(:task)
      task_dup = build(:task, title: task.title)
      expect(task_dup).to be_invalid
      expect(task_dup.errors[:title]).to eq ["has already been taken"]
    end

    it 'is valid with another title' do end
  end

end
