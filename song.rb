# Author: Lily Smith
# Course: CSCI 3725
# Assignment: M8
# 12/7/22
#
# This file contains Sonic Pi code for a relaxing song.

define :play_sequence do |sequence, attack_time, release_time, amp_val, delay|
  sequence.each do |x|
    play x, attack: attack_time, release: release_time, amp: amp_val
    sleep(delay)
  end
end

tempo = 70

# Chords that are present in whole song
in_thread do
  9.times do
    use_bpm tempo
    play_sequence([chord(:c3, :major), chord(:e3, :major), chord(:c3, :major), chord(:d3, :major), chord(:a3, :major), chord(:g3, :major7)], 2, 6, 0.4, 7)
    tempo -= 1
  end
  play chord(:c4, :major), attack: 2, release: 6, amp: 0.4
end

# Swoosh sound
sleep(27)
in_thread do
  22.times do
    sample :ambi_swoosh, attack: 2, release: 6
    sleep(14)
  end
end

# Supporting chords
sleep(23)
in_thread do
  7.times do
    use_synth :dark_ambience
    use_bpm tempo
    play_sequence([chord(:c4, :major), chord(:e4, :major), chord(:c4, :major), chord(:d4, :major), chord(:a4, :major), chord(:g4, :major7)], 2, 6, 0.4, 7)
  end
end


# First kalimba melody
sleep(30)
in_thread do
  use_synth :kalimba
  use_bpm tempo
  
  play :c5, attack: 1.5, release: 3, amp: 6
  sleep(7)
  play :b4, attack: 1.5, release: 3, amp: 6
  sleep(1)
  play :a4, attack: 1.5, release: 3, amp: 6
  sleep(14)
  play :d5, attack: 1.5, release: 3, amp: 6
  sleep(7)
  play :g5, attack: 1.5, release: 3, amp: 6
  sleep(1)
  play :a5, attack: 1.5, release: 3, amp: 6
  sleep(14)
  
  play_sequence([:c5, :e5], 1.5, 3, 6, 1)
  play chord(:c5, :major), attack: 2, release: 3, amp: 7
  sleep(14)
  play_sequence([:d5, :f5], 1.5, 3, 6, 1)
  play chord(:d5, :major), attack: 1.5, release: 3, amp: 7
  sleep(14)
  play_sequence([:e5, :g5], 1.5, 3, 6, 1)
  play chord(:e5, :major), attack: 1.5, release: 3, amp: 7
  sleep(14)
  play_sequence([:d5, :f5], 1.5, 3, 6, 1)
  play chord(:d5, :major), attack: 1.5, release: 3, amp: 7
  sleep(14)
  play_sequence([:c5, :e5], 1.5, 3, 6, 1)
  play chord(:c5, :major), attack: 2, release: 4, amp: 7
  sleep(14)
end

# Soft guitar sounds
sleep(80)
in_thread do
  use_bpm tempo
  8.times do
    sample :guit_e_fifths, amp: 0.1, attack: 4, release: 4
    sleep(8)
    sample :guit_em9, amp: 0.1, attack: 4, release: 4
    sleep(16)
  end
end

# Second kalimba melody
sleep(40)
in_thread do
  use_bpm tempo
  use_synth :kalimba
  
  play_sequence([:eb4, :g4, :bb4, :ab4], 1.5, 3, 6, 1)
  sleep(14)
  
  play_sequence([:d4, :eb4, :g4, :bb4], 1.5, 3, 6, 1)
  sleep(14)
  
  play_sequence([:eb4, :f4, :bb4, :ab4], 1.5, 3, 6, 1)
  sleep(14)
  
  play_sequence([:eb4, :d4, :bb4, :ab4], 1.5, 3, 6, 1)
  sleep(14)
  
  play_sequence([:eb4, :g4], 1.5, 3, 6, 1)
  play chord(:c5, :major), attack: 1.5, release: 5, amp: 7
end