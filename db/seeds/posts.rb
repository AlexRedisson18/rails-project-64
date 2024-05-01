# frozen_string_literal: true

if Rails.env.development?
  Post.destroy_all

  user1 = User.first
  category1 = Category.first
  category2 = Category.second

  post_body1 = 'Работу разработчика часто можно сравнить с решением головоломок. Как в настоящей головоломке, разработчику приходится тратить существенные ресурсы не столько на реализацию конкретного решения, сколько на выбор оптимального подхода. Иногда задача решается легко и эффективно, а порой — только полным перебором всех возможных вариантов. Такой подход часто называют наивным решением. Он имеет существенный минус — временные затраты. Представим хакера, который пытается взломать какой-то пароль перебором всех комбинаций символов. Если пароль допускает 10 цифр, 26 маленьких букв, 26 больших букв и 32 специальных символа (например, значок доллара), то для каждого символа в пароле есть 94 кандидата. Значит, чтобы взломать перебором пароль, состоящий из одного символа, потребуется 94 проверки. Если в пароле два символа — 94 кандидата на первую позицию, 94 кандидата на вторую позицию — то придется перебрать аж 94*94 = 8836 возможных пар. Для пароля из десяти символов потребуется уже перебор 94^10 комбинаций.'
  post_body2 = 'Это может быть не очевидно, но мы сталкиваемся с криптографией каждый день. Например, когда мы оплачиваем покупки картой, смотрим видео на YouTube или заправляем машину, криптография защищает нашу информацию. Может показаться, что криптография – это удел разработчиков, хакеров и корпораций, а простому пользователю знать о ней вовсе не обязательно. Однако это полезно не только узким специалистам, но и всем, кто заботится о собственной безопасности. Этот гайд поможет разобраться, что такое криптография и какое применение она находит в повседневной жизни.'

  Post.create(creator: user1, category: category1, title: 'Что такое динамическое программирование', body: post_body1)
  Post.create(creator: user1, category: category2, title: 'Что такое криптография?', body: post_body2)
end