require 'rails_helper'

RSpec.describe Task, type: :model do
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
      task_without_title = build(:task, title: "")
      expect(task_without_title).to be_invalid
      expect(task_without_title.errors[:title]).to eq ["can't be blank"]
    end

    # statusがなければ無効である
    it 'is invalid without status' do
      task_without_status = build(:task, status: nil)
      expect(task_without_status).to be_invalid
      expect(task_without_status.errors[:status]).to eq ["can't be blank"]
    end

    # titleが重複していたら無効である
    it 'is invalid with a duplicate title' do
      task = create(:task)
      task_with_duplicated_title = build(:task, title: task.title)
      expect(task_with_duplicated_title).to be_invalid
      expect(task_with_duplicated_title.errors[:title]).to eq ["has already been taken"]
    end

    it 'is valid with another title' do end
  end

end
