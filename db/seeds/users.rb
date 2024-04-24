# frozen_string_literal: true

if Rails.env.development?
  User.destroy_all

  User.create(email: 'test@mail.ru', password: '123456', password_confirmation: '123456')
end
