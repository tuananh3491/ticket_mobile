import 'package:ticket_system/data/models/comment.dart';

import '../models/ticket.dart';

class TicketRepository {
  final List<Ticket> tickets = [
    Ticket(
      id: "1234",
      sender: "Nhân Tâm",
      title: "Sửa quạt hư",
      date: "4/3/2025",
      status: "PROCESSING",
      description: "Tại phòng H103 có 1 cái quạt bị hư",
      category: "Thiết bị",
      priority: "Cao",
      department: "Bảo trì",
      imagePath: null,
      comments: [
        Comment(
            author: "Tuấn Anh",
            message: "Bạn đã thử cắm lại chưa?",
            time: "20:00"),
        Comment(
            author: "Nhân Tâm", message: "Chưa, để mình thử", time: "20:05"),
      ],
    ),
    Ticket(
      id: "1235",
      sender: "Yến Nhi",
      title: "Máy chiếu bật không lên",
      date: "6/3/2025",
      status: "NEW",
      description: "Phòng họp tầng 2 máy chiếu không hoạt động",
      category: "Thiết bị",
      priority: "Cao",
      department: "Kỹ thuật",
      imagePath: "assets/images/projector_issue.png",
      comments: [],
    ),
    Ticket(
      id: "1236",
      sender: "Đạt",
      title: "Đăng ký thi IELTS",
      date: "6/3/2025",
      status: "COMPLETE",
      description: "Cần đăng ký thi IELTS tại trung tâm A",
      category: "Học tập",
      priority: "Trung bình",
      department: "Đào tạo",
      imagePath: null,
      comments: [
        Comment(
            author: "Admin", message: "Đã đăng ký thành công", time: "10:00"),
      ],
    ),
    Ticket(
      id: "1237",
      sender: "Tuấn",
      title: "Học phí HK2",
      date: "4/3/2025",
      status: "PROCESSING",
      description: "Cần kiểm tra lại số tiền học phí học kỳ 2",
      category: "Tài chính",
      priority: "Khẩn cấp",
      department: "Kế toán",
      imagePath: null,
      comments: [
        Comment(
            author: "Kế toán",
            message: "Bạn vui lòng kiểm tra lại email xác nhận",
            time: "09:30"),
      ],
    ),
  ];
}
