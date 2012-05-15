
  Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each do |l|
    require l
  end
