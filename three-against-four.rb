load_sample :perc_snap2

define :my_play do |bpm, sample_sym, repeats|
  in_thread do
    with_bpm bpm do
      repeats.times do
        sample sample_sym
        sleep 1.0/repeats
      end
    end
  end
end


state = 1
start_bpm = 30.0
end_bpm = start_bpm*4.0/3.0
bpm = start_bpm

sound_a = :perc_snap
sound_b = :perc_snap2

live_loop :arp do
  #loop do
  with_bpm bpm do
    
    
    if state == 1
      
      if bpm == start_bpm
        #sample :perc_bell, amp: 0.5
      end
      
      my_play bpm, sound_a, 4
      my_play bpm, sound_b, 3
      
      
      if bpm >= end_bpm
        state = 2
        bpm = end_bpm
      else
        bpm += start_bpm/15.0
      end
      
    elsif state == 2
      sample sound_a
      my_play bpm, sound_b, 3
      
      bpm = start_bpm
      state=3
      
    elsif state == 3
      #sample :perc_bell, amp: 0.5
      my_play bpm, sound_b, 4
      
      # swap sounds
      helper = sound_a
      sound_a = sound_b
      sound_b = helper
      
      state=1
    else
      # alarm
      my_play bpm*2, :perc_bell, 7
      
    end
    
    sleep 1
  end
end


