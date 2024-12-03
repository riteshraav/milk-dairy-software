INSERT INTO admin (a_id, name, phone_num, password) VALUES
                                                                   (1, 'Ramesh Patil', '9876543210',  'admin123'),
                                                                   (2, 'Suresh Jadhav', '9876543211',  'password456'),
                                                                   (3, 'Sandhya Kulkarni', '9876543212',  'kulkarni789');
INSERT INTO Customer ( name, phone_num, animal,admin_name) VALUES
                                                         ( 'Ganesh Gaikwad', '9876543213', 'COW', 'Ramesh Patil'),
                                                         ( 'Vijaya Chavan', '9876543214', 'BUFFALO', 'Ramesh Patil'),
                                                         ( 'Ajit Bhosale', '9876543215', 'COW', 'Suresh Jadhav'),
                                                         ( 'Meera Kharat', '9876543216', 'BUFFALO', 'Ramesh Patil'),
                                                         ( 'Prakash Dhumal', '9876543217', 'COW', 'Suresh Jadhav'),
                                                         ( 'Swati Kadam', '9876543218', 'BUFFALO', 'Suresh Jadhav'),
                                                         ( 'Sharad Naik', '9876543219', 'COW', 'Sandhya Kulkarni'),
                                                         ( 'Vaibhav Salunkhe', '9876543220', 'BUFFALO', 'Sandhya Kulkarni'),
                                                         ('Kavita Phadke', '9876543221', 'COW', 'Sandhya Kulkarni'),
                                                         ('Kavita Phadke', '9876543221', 'COW', 'Sandhya Kulkarni');

INSERT INTO MILKCOLLECTION (c_id, admin_name, animal, shift, quantity_liters, fat, total_value, created_at) VALUES
                                                                                                                      (1, 'Ramesh Patil', 'COW', 'MORNING', 5.0, 4.5, 225.0, '2024-11-29 06:30:00'),
                                                                                                                      (2, 'Ramesh Patil', 'BUFFALO', 'EVENING', 6.0, 5.2, 312.0, '2024-11-29 18:45:00'),
                                                                                                                      (3, 'Suresh Jadhav', 'COW', 'MORNING', 4.5, 4.0, 180.0, '2024-11-29 07:00:00'),
                                                                                                                      (4, 'Ramesh Patil', 'BUFFALO', 'EVENING', 7.0, 5.5, 385.0, '2024-11-29 19:00:00'),
                                                                                                                      (5, 'Suresh Jadhav', 'COW', 'MORNING', 6.0, 4.8, 288.0, '2024-11-29 06:15:00'),
                                                                                                                      (6, 'Suresh Jadhav', 'BUFFALO', 'EVENING', 5.5, 5.0, 275.0, '2024-11-29 19:15:00'),
                                                                                                                      (7, 'Sandhya Kulkarni', 'COW', 'MORNING', 4.0, 3.8, 152.0, '2024-11-29 06:45:00'),
                                                                                                                      (8, 'Sandhya Kulkarni', 'BUFFALO', 'EVENING', 5.8, 5.4, 313.2, '2024-11-29 18:30:00'),
                                                                                                                      (9, 'Sandhya Kulkarni', 'COW', 'MORNING', 3.5, 4.2, 147.0, '2024-11-29 07:30:00'),
                                                                                                                      (10, 'Ramesh Patil', 'COW', 'EVENING', 6.5, 4.5, 292.5, '2024-11-29 19:45:00'),
                                                                                                                      (1, 'Ramesh Patil', 'COW', 'MORNING', 4.2, 4.1, 172.2, '2024-11-29 06:50:00'),
                                                                                                                      (3, 'Suresh Jadhav', 'COW', 'EVENING', 5.0, 4.7, 235.0, '2024-11-29 19:30:00'),
                                                                                                                      (2, 'Ramesh Patil', 'BUFFALO', 'MORNING', 6.8, 5.3, 360.4, '2024-11-29 06:40:00'),
                                                                                                                      (5, 'Suresh Jadhav', 'COW', 'EVENING', 5.5, 4.6, 253.0, '2024-11-29 18:55:00'),
                                                                                                                      (6, 'Suresh Jadhav', 'BUFFALO', 'MORNING', 6.0, 5.0, 300.0, '2024-11-29 07:25:00'),
                                                                                                                      (7, 'Sandhya Kulkarni', 'COW', 'EVENING', 3.8, 3.9, 148.2, '2024-11-29 19:40:00'),
                                                                                                                      (9, 'Sandhya Kulkarni', 'COW', 'MORNING', 4.1, 4.4, 180.4, '2024-11-29 07:10:00'),
                                                                                                                      (10, 'Ramesh Patil', 'COW', 'EVENING', 5.9, 4.8, 283.2, '2024-11-29 18:50:00'),
                                                                                                                      (8, 'Sandhya Kulkarni', 'BUFFALO', 'MORNING', 5.0, 5.1, 255.0, '2024-11-29 07:35:00'),
                                                                                                                      (6, 'Suresh Jadhav', 'BUFFALO', 'EVENING', 6.2, 5.0, 310.0, '2024-11-29 19:10:00');
