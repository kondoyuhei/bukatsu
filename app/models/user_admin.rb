class UserAdmin < ActiveHash::Base
  self.data = [
    { id: 1, value: '生徒' },
    { id: 2, value: '保護者' },
    { id: 11, value: '教員（管理者）' }
  ]
  end
