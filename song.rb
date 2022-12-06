tempo = 70

in_thread do
  7.times do
    use_bpm tempo
    play chord(:a3, :major), attack: 2, release: 6, amp: 0.4
    sleep(7)
    play chord(:b3, :major), attack: 2, release: 6, amp: 0.4
    sleep(7)
    play chord(:c3, :major), attack: 2, release: 6, amp: 0.4
    sleep(7)
    play chord(:d3, :major), attack: 2, release: 6, amp: 0.4
    sleep(7)
    play chord(:a3, :minor), attack: 2, release: 6, amp: 0.4
    sleep(7)
    play chord(:g3, :major7), attack: 2, release: 6, amp: 0.4
    sleep(7)
    tempo -= 1
  end
end

sleep(30)
in_thread do
  25.times do
    sample "/Users/lsmith2/Desktop/Fireplace.wav", attack: 4, release: 4
    sleep(10)
  end
end

sleep(20)
in_thread do
  use_synth :sine
  15.times do
    use_bpm tempo
    play_pattern chord(:d, :major), attack: 1, release: 3, amp: 0.2
    sleep(4)
    play_pattern chord(:e, :major), attack: 1, release: 3, amp: 0.2
    sleep(4)
    play_pattern chord(:f, :major), attack: 1, release: 3, amp: 0.2
    sleep(4)
  end
end

sleep(30)
in_thread do
  delay = 2
  use_synth :pluck
  20.times do
    use_bpm tempo
    play :c, attack: 2, release: delay + 1
    sleep(delay)
    play :e, attack: 2, release: delay + 1
    sleep(delay)
    play :d, attack: 2, release: delay + 1
    sleep(delay)
    play :c, attack: 2, release: delay + 1
    sleep(delay)
    play :f, attack: 2, release: delay + 1
    sleep(delay)
    play :g, attack: 2, release: delay + 1
    sleep(delay)
    play :f, attack: 2, release: delay + 1
    sleep(delay)
    play :d, attack: 2, release: delay + 1
    sleep(delay)
  end
end





