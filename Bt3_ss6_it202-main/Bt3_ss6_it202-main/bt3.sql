SELECT 
    user_id
FROM 
    Bookings
GROUP BY 
    user_id
HAVING 
    -- Tiêu chí 1: Tổng số lần đặt phòng (bất kể trạng thái) >= 10
    COUNT(*) >= 10 
    
    AND 
    
    -- Tiêu chí 2: Số lượng đơn bị hủy > 5
    -- Dùng CASE WHEN để biến 'CANCELLED' thành 1, trạng thái khác thành 0, rồi tính tổng
    SUM(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) > 5;