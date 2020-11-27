import sys
import pygame, pygame.sndarray
import numpy
import time

sample_rate = 44100
pygame.mixer.init(sample_rate, -16,1,2048)

def play_wave(sample_wave, ms):
    sound = pygame.sndarray.make_sound(sample_wave)
    sound.play(-1)
    pygame.time.delay(ms)
    sound.stop()

def sine_wave(hz, peak, n_samples=sample_rate):
    length = sample_rate / float(hz)
    omega = numpy.pi * 2 / length
    xvalues = numpy.arange(int(length)) * omega
    onecycle = peak * numpy.sin(xvalues)
    return numpy.resize(onecycle, (n_samples,)).astype(numpy.int16)

def play_sine(hz):
    play_wave(sine_wave(hz, 4096), 120)

def key_to_hz(key):
    base = 1.059463181818182
    return 440 * pow(base, key - 49)

def play_text(text):
    for c in text:
        play_sine(key_to_hz(ord(c) - 19))

if __name__ == "__main__":
    text = sys.argv[1]
    if text:
        play_text(sys.argv[1])
