-- Run this in Supabase SQL Editor (https://supabase.com/dashboard → SQL Editor)

CREATE TABLE IF NOT EXISTS okx_reviews (
  campaign TEXT PRIMARY KEY,
  decisions JSONB DEFAULT '{}',
  notes JSONB DEFAULT '{}',
  country_requests JSONB DEFAULT '{}',
  submitted_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Allow anonymous access for client review portal
ALTER TABLE okx_reviews ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow anonymous read" ON okx_reviews FOR SELECT USING (true);
CREATE POLICY "Allow anonymous insert" ON okx_reviews FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous update" ON okx_reviews FOR UPDATE USING (true);
