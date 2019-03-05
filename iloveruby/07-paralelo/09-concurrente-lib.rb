
def do_something(id, delay)
  puts "[#{id}] BEGIN  :   delay = #{ delay.to_i}"
  delay.to_i.times { @counter+=1; sleep(1) }
  #sleep(delay)
  puts "[#{id}] END    : counter = #{@counter}"
end


def begin_work(values)
  puts "="*40
  puts "    Script : #{$0} "
  puts "    Inputs : #{values.to_s}"
  puts "    Counter: #{@counter}"
  puts "="*40
  @begintime = Time.now
end

def end_work
  duration = Time.now-@begintime
  puts "="*40
  puts "    Total duration = #{duration.to_i}"
  puts "           Counter = #{@counter}"
  puts "="*40
end

class Array

  def parallelize(action)
    tasks = []
    each_with_index do |input, index|
      tasks << Thread.new{ action.call(index, input)}
    end
    tasks.each { |t| t.join }
  end

end
