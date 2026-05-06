SELECT 
    hotel_id
FROM 
    Bookings
WHERE 
    status = 'COMPLETED'             -- [Lọc Sớm] Loại bỏ đơn hủy/lỗi trước tiên, giải phóng I/O và RAM
GROUP BY 
    hotel_id                         -- Chỉ gom nhóm những đơn đã thành công
HAVING 
    COUNT(*) >= 50                   -- Kiểm tra điều kiện 1: Có ít nhất 50 đơn (đã là đơn thành công nhờ WHERE)
    AND AVG(total_price) > 3000000;  -- Kiểm tra điều kiện 2: Doanh thu trung bình lớn hơn 3 triệu VNĐ