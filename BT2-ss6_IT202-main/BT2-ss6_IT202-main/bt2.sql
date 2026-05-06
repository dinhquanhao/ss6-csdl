SELECT 
    hotel_id,                           -- [1] Lấy ID của khách sạn. Cột này hợp lệ vì nó được khai báo ở GROUP BY.
    
    -- room_name,                       -- [ĐIỂM GÂY LỖI] Đã bị loại bỏ khỏi SELECT.
                                        -- Lý do: Khi gom nhóm theo hotel_id, một khách sạn có rất nhiều phòng.
                                        -- Chế độ ONLY_FULL_GROUP_BY chặn không cho hiển thị cột này vì nó 
                                        -- không biết phải chọn đại tên phòng nào để hiển thị bên cạnh ID khách sạn.

    MIN(price_per_night) AS min_price   -- [2] Tìm giá thấp nhất của các phòng trong khách sạn đó.
                                        -- Cột này hợp lệ dù không nằm trong GROUP BY vì nó đã được bọc 
                                        -- trong một hàm gộp (Aggregate Function) là MIN(). 
                                        -- Toán học quy định rất rõ: Trong 1 tập hợp, số nhỏ nhất là duy nhất.
FROM 
    Rooms                               -- Lấy dữ liệu từ bảng Rooms
GROUP BY 
    hotel_id;                           -- [3] Gom tất cả các phòng có chung hotel_id vào cùng một nhóm.