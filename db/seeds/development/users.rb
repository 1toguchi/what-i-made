names = %w[hoge hoge hoge]

0.upto(9) do |idx|
  user = User.create(
    name: names[idx],
    email: "#{names[idx]}@hoge.com",
    grade: [0, 2, 3][idx % 3],
    choice: [0,1,0][idx % 3],
    bunri: [0,0,1][idx % 3],
    administrator: (idx == 0),
    password: "password",
    password_confirmation: "password"
  )
end