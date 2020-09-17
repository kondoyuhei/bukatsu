class Grade < ActiveHash::Base
  self.data = [
    { id: 1, value: '中1' },
    { id: 2, value: '中2' },
    { id: 3, value: '中3' },
    { id: 4, value: '高1' },
    { id: 5, value: '高2' },
    { id: 6, value: '高3' }
  ]
end
