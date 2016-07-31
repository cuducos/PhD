require "filewatcher"

FileWatcher.new(["**/*.adoc", "**/*.sass"], spinner: true).watch do |name|
  puts "==> #{name} updated"
  case File.extname(name)
    when ".sass"
      system "make css"
    when ".adoc"
      system "make pdf ADOC=#{name}"
  end
end
