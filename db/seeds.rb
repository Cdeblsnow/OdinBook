# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(email: "example15@gmail.com", password: "123456", user_name: "gg2025")
user.posts.create!(
  title: "Test 1",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et bibendum nulla, nec rutrum risus. Fusce et varius urna. Aenean molestie consequat nisl. Sed rhoncus nec nisl vel dapibus. Vestibulum bibendum gravida lectus vel posuere. In molestie eget diam nec viverra. Aliquam convallis, mi sed placerat iaculis, purus eros sodales ex, eu sollicitudin leo tortor ac ante. Vestibulum justo metus, dapibus quis est quis, aliquet viverra magna.

Ut vitae dictum metus. Quisque finibus eros in dolor hendrerit blandit. Etiam orci lectus, venenatis nec eleifend eu, congue eu lorem. Nulla diam nisl, egestas et diam sit amet, pellentesque sollicitudin felis. Mauris felis lorem, feugiat eget pharetra in, eleifend eget nulla. Praesent consectetur, felis in condimentum tincidunt, metus nunc dignissim neque, non dapibus orci lorem in sem. Duis vitae varius sem. Pellentesque sodales lacinia lorem.

Nullam eget felis fermentum, aliquet dui nec, auctor enim. Praesent mattis dolor et elementum egestas. Nulla in quam in velit posuere accumsan. Curabitur dictum magna leo, eu iaculis massa tempus id. Quisque nec mi dolor. Etiam varius eu lacus tincidunt vehicula. Duis dapibus nisl in placerat convallis. Morbi pharetra eget elit blandit gravida. Donec bibendum, ligula at consequat consectetur, sapien tortor tincidunt augue, eget pulvinar velit elit id libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse finibus enim vitae ligula mollis venenatis. In ex nulla, euismod et justo sit amet, ornare tincidunt mauris.

Sed sed lectus ut lorem lacinia tincidunt quis et justo. Vivamus faucibus et est eu aliquet. In varius ac leo vel sollicitudin. Pellentesque ac tellus commodo, tempus nibh nec, condimentum lectus. Donec posuere cursus massa, et tristique mauris finibus a. Nulla sodales, massa vel ullamcorper pretium, sapien mauris rutrum enim, nec imperdiet lacus elit consequat dolor. Ut ornare, diam id posuere accumsan, magna nisi tristique erat, eu rutrum dolor metus ac metus.

Nulla vestibulum ac lacus eu luctus. Nam commodo gravida dictum. Mauris condimentum ante sit amet mauris ornare, quis elementum sem tincidunt. Morbi pulvinar nulla erat, id tempor ex vehicula vehicula. Ut lobortis, massa auctor laoreet porta, urna est rutrum mauris, vel pulvinar sem augue quis quam. Curabitur eu dui in ante fringilla tempus quis nec augue. Phasellus consequat dui vehicula nibh finibus egestas. Nullam id ligula a leo rutrum venenatis. Aenean est libero, convallis eget sem sit amet, mollis vehicula quam. Fusce gravida ex et nisl luctus maximus. Pellentesque volutpat, lacus sed aliquam suscipit, lacus velit venenatis nunc, vitae placerat ligula turpis eleifend mauris. Suspendisse velit urna, egestas ac laoreet nec, accumsan ut quam. Donec dapibus felis non dolor mollis finibus. Suspendisse auctor eleifend imperdiet.",
number_of_comments: 0,
number_of_likes: 0
)
