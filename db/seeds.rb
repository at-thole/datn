User.create!(username: "lvtho", email: "lvtho129@gmail.com",
  password: "123123", role: 1, password_confirmation: "123123",
  address: "123 Nguyen Luong Bang", phone: "0123456789")

20.times do |n|
  User.create!(username: "lvtho#{n+1}", email: "lvtho129#{n+1}@gmail.com",
  password: "123123", role: 0, password_confirmation: "123123",
  address: "a#{n+1} Nguyen Luong Bang", phone: "0123456789")
end

city = ["An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu",
  "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận",
  "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai", "Đồng Tháp",
  "Gia Lai", "Hà Giang", "Hà Nam", "Hà Tĩnh", "Hải Dương", "Hậu Giang", "Hòa Bình",
  "Hưng Yên", "Khánh Hòa", "Kiên Giang", "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn",
  "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ","Quảng Bình",
  "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La",
  "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang",
  "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái", "Phú Yên",
  "Cần Thơ", "Đà Nẵng", "Hải Phòng", "Hà Nội", "TP HCM"]
city.each do |city|
  City.create!(name: city)
end

categories = ["Du lịch mạo hiểm", "Chuyến đi công tác","Du lịch văn hóa","Du mục toàn cầu",
"Tuần trăng mật","Tour du lịch trọn gói","Du lịch thú nuôi","Du lịch giải trí",
"Kỳ nghỉ","Thăm bạn bè,người thân"]
categories.each do |cate|
  Category.create!(name: cate)
end

travel_places = [
  ["1","Búng Bình Thiên", "Cách Châu Đốc khoảng 30 km, Búng Bình Thiên hay còn có tên gọi là hồ nước trời, thuộc huyện An Phú, tỉnh An Giang, nằm sát biên giới Campuchia", "bung-binh-thien-ivivu.jpg"],
  ["1","Rừng tràm Trà Sư", "Rừng tràm Trà Sư thuộc huyện Tịnh Biên, có diện tích khoảng 850 ha với hệ sinh thái phong phú, là biểu trưng cho vẻ đẹp mùa nước nổi An Giang", "rungtram.jpg"],
  ["2","Rừng nguyên sinh Bình Châu", "Rừng Bình Châu - Phước Bửu là một quẩn thể cảnh quan đa dạng, có sức thu hút nhiều du khách trong và ngoài nước đến tham quan.", "15992776891_caa273dfb4_z.jpg"],
  ["2","Côn Đảo", "Là quần đảo Côn Lôn bao gồm 14 đảo lớn nhỏ nằm ở phía Nam Tây Nam biển Đông cánh Vũng Tàu 97 hải lưu ,cánh mũi Cà Mau 100 hải lưu. Là quần đảo có diện tích rộng 76.71km, dân cư thưa thớt", "15808758699_d7d3e22b84.jpg"],
  ["3","Thành cổ Xương Giang", "Thành cổ Xương Giang nằm ở xã Xương Giang, thành phố Bắc Giang, tỉnh Bắc Giang.", "thanh-co-xuong-giang-3.jpg"],
  ["3","Rừng nguyên sinh Khe Rỗ", "Cách Hà Nội 120 km về phía đông bắc, rừng nguyên sinh Khe Rỗ thuộc xã An Lạc, huyện Sơn Động là khu rừng nguyên sinh tiêu biểu cho vùng Đông Bắc Việt Nam.", "khero.jpg"],
  ["4","Ðộng Puông","Ðộng Puông nằm trên dòng sông Năng thuộc huyện Ba Bể, tỉnh Bắc Kạn, cách thị trấn Chợ Rã 5km. Ðộng Puông là một điểm du lịch sinh thái đặc biệt, độc đáo và rất hấp dẫn.","Nhung-diem-du-lich-dep-o-Bac-Kan_4.jpg"],
  ["4","Động Nàng Tiên", "Động là một hang đá tự nhiên có từ lâu đời và đã được Bộ văn hóa - thông tin xếp hạng di tích cấp quốc gia từ năm 1999.", "Nhung-diem-du-lich-dep-o-Bac-Kan_1.jpg"],
  ["5","Cánh đồng quạt gió Bạc Liêu", "Từ thành phố Bạc Liêu theo đường Cao Văn Lầu đi ra phía biển, ở địa phận ấp Biển Đông A, xã Vĩnh Trạch Đông là Nhà máy điện gió mới được hoàn thành đầu năm nay", "canh-dong-quat-gio-ivivu-2.jpg"],
  ["5","Vườn chim Bạc Liêu", "Cách thành phố Bạc Liêu 6 km về hướng biển thuộc xã Hiệp Thành, vườn chim Bạc Liêu là nơi làm tổ của nhiều loài chim nước, điển hình là các loài le le, cò, diệc, vạc, còng cọc, quắm đen…", "vuon-chim-bac-lieu-ivivu-1024x568.jpg"],
  ["6","Chùa Phật Tích", "Chùa Phật Tích là một ngôi chùa nằm ở sườn phía Nam núi Phật Tích, xã Phật Tích, huyện Tiên Du, tỉnh Bắc Ninh. Trong chùa có tượng đức Phật bằng đá thời nhà Lý lớn nhất Việt Nam.", "chua-phat-tich-bac-ninh.jpg"],
  ["6","Chùa Phúc Lâm", "Chùa Phúc Lâm thuộc địa phận xã Phú Lâm, huyện Tiên Du, tỉnh Bắc Ninh, Việt Nam, là một ngôi chùa cổ được xây dựng vào đầu thế kỷ 18, hoa văn kiến trúc thời Nguyễn.", "chua-phuc-lam-bac-ninh.jpg"],
  ["7","Cồn Phụng Bến Tre", "Xuôi dòng sông Tiền đến du lịch Cồn Phụng – Bến Tre (Cồn Đạo Dừa) tham quan, chiêm ngưỡng công trình kiến trúc Đạo Dừa, phòng trưng bày một số hình ảnh về danh nhân và các điểm di tích lịch sử của tỉnh Bến Tre", "cau-khi-700x394.jpg"],
  ["7","Cồn Ốc Bến Tre", "Cồn Ốc là cồn nổi lớn nhất trên sông Hàm Luông, thuộc xã Hưng Phong, huyện Giồng Trôm, tỉnh Bến Tre, cách thành phố Bến Tre khoảng 15 km đường bộ, có diện tích tự nhiên 647ha.", "con-oc.jpg"],
  ["8","Kỳ Co", "Nằm cách xa thành phố Quy Nhơn khoảng chừng 25km, bãi Kỳ Co thuộc xã đảo Nhơn Lý có một vẻ đẹp hoang sơ mà ít người biết đến.", "ky-co-ivivu.jpg"],
  ["8","Cù Lao Xanh", "Cù Lao Xanh hay còn gọi là xã đảo Nhơn Châu là món quà vô giá mà thiên nhiên ban tặng cho con người đất võ, cách Quy Nhơn chỉ khoảng hơn 20 km", "cu-lao-xanh-ivivu.jpg"],
  ["9","Nhà thờ Phú Cường", "Đến Bình Dương mà không ghé tham quan nhà thờ Chánh toà giáo phận Phú Cường quả là một thiếu sót. Nhà thờ tọa lạc ngay số 104 đường Lạc Long Quân, P. Phú Cường, TP. Thủ Dầu Một, Bình Dương, gần vòng xoay ngã 6 Thủ Dầu Một", "binhduong-ivivu-2.jpg"],
  ["9","Chùa Hội Khánh", "Chùa Hội Khánh tọa lạc tại số 35 đường Yersin, phường Phú Cường, TP. Thủ Dầu Một, Bình Dương.", "binhduong-ivivu-4.jpg"],
  ["10","Vườn Quốc Gia Bù Gia Mập", "Nằm trên địa bàn huyện Bù Gia Mập – nơi chuyển tiếp từ Tây Nguyên xuống vùng đồng bằng Nam Bộ, Vườn quốc gia Bù Gia Mập là cánh rừng nguyên sinh lớn nhất còn sót lại của tỉnh Bình Phước.", "bu-gia-map-ivivu-2.jpg"],
  ["10","Hồ suối Lam", "Hồ suối Lam thuộc địa phận xã Thuận Phúc, huyện Đông Phú. Mặt hồ bằng phẳng như gương, nước hồ bốn mùa trong xanh và được bao bọc bởi những rừng cao su thẳng tắp, xanh ngút ngàn.", "ho-suoi-lam-ivivu.jpg"],
  ["60","Non Nước","Khu du lịch Non Nước với bãi biển đẹp nằm kề sát danh thắng Ngũ Hành Sơn, cách thành phố Đà Nẵng 8 km về phía Đông Nam. Đây là gạch nối du lịch giữa Ngũ Hành Sơn và 3 di sản văn hóa thế giới: phố cổ Hội An, thánh địa Mỹ Sơn và Cố đô Huế. ","nonnuoc.jpg"],
  ["60","Bà Nà Hill", "Núi Bà Nà là một trong những núi đẹp nhất Đà Nẵng cùng với núi Ngũ Hành Sơn và núi Sơn Trà.", "banahill.jpg"],
  ["62","Hồ Tây", "Hồ Tây nằm ở phía Tây Bắc nội thành Hà Nội với diện tích khoảng 500 ha, đường vòng quanh hồ dài 17 km. Ngành địa dư lịch sử đã chứng minh rằng, hồ là một đoạn sông Hồng rớt lại, sau khi đổi dòng, có thể tới cả hàng nghìn năm.", "hotay.jpg"],
  ["62","Nhà hát Lớn", "Nhà hát Lớn Hà Nội là một công trình kiến trúc phục vụ biểu diễn nghệ thuật tọa lạc trên quảng trường Cách mạng tháng Tám, vị trí đầu phố Tràng Tiền, không xa hồ Hoàn Kiếm và Bảo tàng Lịch sử Việt Nam.", "nhahatlon.jpg"],
  ["63","Địa đạo Củ Chi", "Địa đạo Củ Chi là một hệ thống phòng thủ trong lòng đất ở huyện Củ Chi, cách Thành phố Hồ Chí Minh 70 km về hướng tây-bắc", "diadao.jpg"],
  ["63","Chợ Bến Thành", "Chợ Bến Thành là một ngôi chợ nằm tại Quận 1, Thành phố Hồ Chí Minh. Trong nhiều trường hợp, hình ảnh tháp đồng hồ ở cửa nam của ngôi chợ này được xem là biểu tượng không chính thức của Thành phố Hồ Chí Minh", "chobenthanh.jpg"]
]
travel_places.each do |place|
  TravelPlace.create!(name: place[1], description: place[2], avatar: place[3], city_id: place[0], category_id: rand(1..10), status: 1)
end

(1..20).each do |index|
  Rate.create! num_rate: rand(2..10).to_f / 2, user_id: rand(1..20), travel_place_id: rand(1..26)
end
