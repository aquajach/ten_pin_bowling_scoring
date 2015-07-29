def score(pins)
  total_score = 0

  pins_in_frames = frames(pins)

  pins_in_frames.each_with_index do |frame, index|
    frame_score = frame.inject{|sum, ball| sum + ball}
    if frame_score == 10
      if frame.count == 1 #Strike
        if pins_in_frames[index+1]
          if pins_in_frames[index+1].count == 1 #Strikes in row
            frame_score += pins_in_frames[index+1][0]
            frame_score += pins_in_frames[index+2][0] if pins_in_frames[index+2]
          else #Strikes not in row
            frame_score += pins_in_frames[index+1][0] + pins_in_frames[index+1][1]
          end
        end
      else #Spare
        frame_score += pins_in_frames[index+1][0] if pins_in_frames[index+1]
      end
    end
    total_score += frame_score
  end

  total_score
end

def frames(pins)
  frames = []

  pins.each do |pin|
    if (frames.last && frames.last.count == 1 && frames.last[0] != 10) || frames.count == 10
      frames.last << pin
    else #Open a new frame when there are fewer than 10 frames and the last frame is complete
      frames << [pin]
    end
  end
  frames
end

