-- Run this in your Supabase SQL Editor

-- Appointments table
CREATE TABLE appointments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  date DATE NOT NULL,
  time_slot TEXT NOT NULL,
  customer_name TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT,
  car_year TEXT,
  car_make TEXT NOT NULL,
  car_model TEXT NOT NULL,
  service TEXT NOT NULL,
  notes TEXT,
  status TEXT DEFAULT 'confirmed',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Available time slots set by admin
CREATE TABLE available_slots (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  date DATE NOT NULL,
  time_slot TEXT NOT NULL,
  is_blocked BOOLEAN DEFAULT FALSE,
  UNIQUE(date, time_slot)
);

-- Admin settings
CREATE TABLE admin_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);

-- Insert default admin password hash (password: willys2024 — CHANGE THIS)
-- This is a simple approach; for production use Supabase Auth
INSERT INTO admin_settings (key, value) VALUES ('admin_password', 'willys2024');

-- Enable Row Level Security
ALTER TABLE appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE available_slots ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_settings ENABLE ROW LEVEL SECURITY;

-- Public can insert appointments and read available slots
CREATE POLICY "Anyone can book" ON appointments FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can read slots" ON available_slots FOR SELECT USING (true);
CREATE POLICY "Anyone can read appointments for booking" ON appointments FOR SELECT USING (true);

-- Available slots - anyone can read, admin manages via anon key
CREATE POLICY "Admin manages slots" ON available_slots FOR ALL USING (true);
CREATE POLICY "Admin manages appointments" ON appointments FOR ALL USING (true);
CREATE POLICY "Admin reads settings" ON admin_settings FOR SELECT USING (true);
