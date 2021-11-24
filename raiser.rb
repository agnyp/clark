GROUP = nil
def do_it
  puts rand(0)%0
  puts 0%100
  return
  puts ENV['G_ENV'].class
  puts ENV['G_ENV'].is_a?(Integer)
  puts 4.5.is_a?(Integer)
  return
  puts (0..100).include?(4.5)
  group = GROUP || 0
  puts 100 - group
  raise "hoppala"
  puts 'after raise'
rescue StandardError => e
  puts "caught it:" + e.to_s
end

# do_it

def hashie
  # h = {"first": 1, "second": 2}
  # h.each do |item|
  #   puts item[0].to_s + item[1].to_s
  # end

  thing = nil
  puts "thing:#{ !thing ? "yes" : "no"}"

  h = {one: '1', thing: false}
  out = h[:thing] || false
  puts out
  h = {one: '1', thing: true}
  out = h[:thing] || false
  puts out.class
  h = {one: '1', thing: 'true'}
  out = h[:thing] || false
  puts out.class
  h = {one: '1'}
  out = h[:thing] || false
  puts out
end
hashie
