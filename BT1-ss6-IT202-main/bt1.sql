SELECT 
    city, 
    SUM(total_price) AS revenue  -- [4] Chọn cột thành phố và tính tổng doanh thu (đặt tên là revenue)
FROM 
    Bookings                     -- [1] Lấy dữ liệu từ bảng Bookings
WHERE 
    status = 'COMPLETED'         -- [2] Lọc TỪNG DÒNG dữ liệu: Chỉ lấy các đơn đã hoàn thành. 
								-- (Mệnh đề WHERE chạy trước khi gom nhóm, nên không thể dùng SUM() ở đây)
GROUP BY 
    city                         -- [3] Gom nhóm các đơn hàng đã lọc ở trên theo từng thành phố
HAVING 
    SUM(total_price) > 0;        -- [ĐIỂM SỬA LỖI] Mệnh đề HAVING dùng để lọc CÁC NHÓM dữ liệu.
                                 -- Nó chạy SAU KHI đã gom nhóm (GROUP BY), nên ở đây dùng được hàm SUM().
                                 -- Dòng này có nghĩa là: Chỉ lấy những nhóm (thành phố) có tổng doanh thu > 0.;