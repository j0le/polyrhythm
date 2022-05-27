load_sample :perc_snap2

bpm = 30
live_loop :arp do
  #loop do
  use_bpm bpm
  
  in_thread do
    use_bpm bpm
    
    3.times do
      sample :perc_snap
      sleep 1/3.0
    end
  end
  
  in_thread do
    use_bpm bpm
    4.times do
      sample :perc_snap2
      sleep 1/4.0
    end
  end
  sleep 1
  bpm = bpm * 1.05
end

