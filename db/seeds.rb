# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.create([
  { title: 'Bo wszystkie dzieci', author: 'Majka Jezowska', created_at: '2024-04-21 14:43:09', updated_at: '2024-04-21 14:43:09', country: 'Poland' },
  { title: 'W ustach mych fajek smak', author: 'Karol Czarnecki', created_at: '2024-04-21 14:43:09', updated_at: '2024-04-21 14:43:09', country: 'Sweden' },
  { title: 'Gejowo.pl', author: 'SQL bez S', created_at: '2024-04-21 14:43:09', updated_at: '2024-04-21 14:43:09', country: 'Holland' }
])