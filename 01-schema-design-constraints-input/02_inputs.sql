-- Data for Instrument List
INSERT INTO instrument_list (instrument_name) 
VALUES 
('Piano'),
('Violin'),
('Viola'),
('Cello'),
('Bass'),
('Voice'),
('Piccolo'),
('Flute'),
('Oboe'),
('Clarinet'),
('Saxophone'),
('Bassoon'),
('Trumpet'),
('Trombone'),
('French Horn'),
('Tuba'),
('Timpani');

-- Data for Parent Info
INSERT INTO parent_info (id, full_name, email, phone) 
VALUES 
(1, 'Tim Shade', 'tshade84@gmail.com', '412-333-5252'),
(2, 'Tyler Callahan', 'tyler.callahan@comcast.net', '222-533-2124'),
(3, 'Charles Allen', 'charallen@comcast.net', '211-121-1234'),
(4, 'Mark Mangiardi', 'mmangi85@gmail.com', '222-212-2222'),
(5, 'Suzanne Smith', 'suzziesmith@aol.com', '424-456-7812'),
(6, 'Henry Rochester', 'h.rochester@comcast.net', '123-323-3424'),
(7, 'John Fitzgerald', 'john.fitzgerald.1952@gmail.com', '623-212-5845');


-- Data for Teacher Info
INSERT INTO teacher_info (full_name, email, phone) 
VALUES 
('Amber Hindy', 'ahindy@gmail.com', '212-424-3431'),
('Pablo Richardson', 'rpablo@gmail.com', '111-111-1112'),
('Makaela Guntz', 'mikkig@gmail.com', '724-555-5123'),
('Jeff Lopez', 'jeff.lopez52@gmail.com', '222-231-4521'),
('Benjamin Smith', 'bsmith@gmail.com', '222-214-4545');


-- Data for Invoice Info
INSERT INTO invoice_info (parent_id, billing_amount, invoice_paid) 
VALUES 
(1, 200.00, false),
(1, 150.00, false),
(1, 350.00, true),
(2, 100.00, true),
(3, 450.00, true),
(3, 500.00, true),
(4, 150.00, false),
(5, 75.00, false),
(6, 575.00, true),
(7, 100.00, true);

-- Data for Student Info
INSERT INTO student_info (parent_id, teacher_id, instrument_id, full_name, age) 
VALUES 
(1, 1, 2, 'Charles Shade', 14),
(3, 2, 8, 'Timothy Allen', 6),
(4, 5, 9, 'John Mangiardi', 17),
(5, 4, 1, 'Annabel Smith', 3),
(5, 4, 2, 'Harper Smith', 4),
(5, 4, 3, 'Amber Smith', 5),
(6, 1, 6, 'Don Rochester', 14); 
