require "yaml"
require "fileutils"
require "time"

CONFIG_PATH = "config.yml"

unless File.exist?(CONFIG_PATH)
  File.write(CONFIG_PATH, <<~YAML)
    database:
      host: localhost
      port: 5432
      name: app_db
    last_run_at: null
  YAML
end

puts "--- Спосіб 1 (YAML.load_file + YAML.dump + File.write) ---"
def task2_simple(path)
  config = YAML.load_file(path)
  config["last_run_at"] = Time.now.iso8601
  File.write(path, YAML.dump(config))
  config
end

puts "  Було:"
puts File.read(CONFIG_PATH).lines.map { |l| "    #{l}" }.join
task2_simple(CONFIG_PATH)
puts "  Стало:"
puts File.read(CONFIG_PATH).lines.map { |l| "    #{l}" }.join
puts

puts "--- Спосіб 2 (YAML + атомарний запис через rename) ---"
def task2_safe(path)
  config = YAML.load_file(path)
  config["last_run_at"] = Time.now.iso8601
  tmp = "#{path}.tmp"
  File.open(tmp, "w") do |f|
    f.write(YAML.dump(config))
    f.flush
    f.fsync rescue nil
  end
  File.rename(tmp, path)
  config
end

puts "  Було:"
puts File.read(CONFIG_PATH).lines.map { |l| "    #{l}" }.join
task2_safe(CONFIG_PATH)
puts "  Стало:"
puts File.read(CONFIG_PATH).lines.map { |l| "    #{l}" }.join
puts "  Файл існує: #{File.exist?(CONFIG_PATH)}"
puts "  Тимчасовий файл прибрано: #{!File.exist?("#{CONFIG_PATH}.tmp")}"