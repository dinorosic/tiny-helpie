# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
# User.create name: "name", email: "email", password: "password", password_confirmation: "password", admin: true, terms_of_service: true

energy = Category.find_or_create_by(name: "Energy")
energy.update(color: "purple", icon: "fire")

broadband = Category.find_or_create_by(name: "Broadband")
broadband.update(color: "pink", icon: "wifi")

insurance = Category.find_or_create_by(name: "Insurance")
insurance.update(color: "green", icon: "wallet")

banking = Category.find_or_create_by(name: "Banking")
banking.update(color: "lime", icon: "banknotes")

["Bord", "Gáis", "Energy", "Community", "Power", "Ecopower",
  "Electric", "Ireland", "Energia", "Flogas", "Panda", "Pinergy",
  "PrePayPower.ie", "SSE", "Airtricity", "Waterpower"].each do |provider_name|
  energy.providers.find_or_create_by(name: provider_name, url: "http://...")
  puts "Created #{provider_name}"
end

["Cellnet", "Digiweb", "Eir", "IFA", "Telecom", "Imagine",
  "Pure", "Telecom", "Rural", "Wifi", "Sky", "Ireland", "Virgin", "Media",
  "Vodafone"].each do |provider_name|
  broadband.providers.find_or_create_by(name: provider_name, url: "http://...")
  puts "Created #{provider_name}"
end

["New", "Ireland", "Aviva", "Royal", "London", "Zurich"].each do |provider_name|
  insurance.providers.find_or_create_by(name: provider_name, url: "http://...")
  puts "Created #{provider_name}"
end

["AIB", "An Post Money", "Bank of Ireland", "Credit Union", "EBS", "N26", "permanent tsb"].each do |provider_name|
  banking.providers.find_or_create_by(name: provider_name, url: "http://...")
  puts "Created #{provider_name}"
end
